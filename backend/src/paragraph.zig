const std = @import("std");
const testing = std.testing;
const Allocator = std.mem.Allocator;
const AllocatorError = Allocator.Error;
const xml = @import("xml");
const Session = @import("Session.zig");
const Document = @import("Document.zig");
const tree = @import("tree.zig");

pub fn serialiseParas(alloc: Allocator, parent: xml.xmlNodePtr) ![]u8 {
    var list: std.ArrayList(u8) = .empty;
    const paraCount = tree.count(parent, "Paragraph");
    try list.append(alloc, @truncate(paraCount));
    for (0..paraCount) |idx| {
        try serialisePara(&list, alloc, tree.childN(parent, "Paragraph", idx));
    }
    return list.toOwnedSlice(alloc);
}

pub fn deserialiseParas(doc: *Document, parent: xml.xmlNodePtr, value: ?[]const u8) !void {
    // delete old paras
    var old_para = xml.xmlFirstElementChild(parent);
    var next_para = old_para;
    while (old_para != null) : (old_para = next_para) {
        if (!tree.equals(old_para.*.name, "Paragraph")) break;
        next_para = xml.xmlNextElementSibling(old_para);
        xml.xmlUnlinkNode(old_para);
        xml.xmlFreeNode(old_para);
    }
    const paras = value orelse return;
    // add new
    const sibling = xml.xmlFirstElementChild(parent);
    const newParaCount = @as(usize, paras[0]);
    var i: usize = 1;
    for (0..newParaCount) |_| {
        var para = xml.xmlNewDocNode(doc.doc, doc.session.ns, "Paragraph", null);
        if (sibling == null) {
            para = xml.xmlAddChild(parent, para);
        } else {
            para = xml.xmlAddPrevSibling(sibling, para);
        }
        i += deserialisePara(doc, para, paras, i);
    }
}

fn deserialisePara(doc: *Document, para: xml.xmlNodePtr, paras: []const u8, start: usize) usize {
    const tokCount: usize = @as(usize, paras[start]);
    var ret: usize = 1;
    for (0..tokCount) |_| {
        const tokTyp: ParaToken = @enumFromInt(paras[start + ret]);
        ret += 1;
        switch (tokTyp) {
            .text, .source, .emphasis, .url => ret += tokTyp.deserialise(doc, para, paras, start + ret),
            .list => {
                const list = xml.xmlNewChild(para, null, "List", null);
                const itemCount = @as(usize, paras[start + ret]);
                ret += 1;
                for (0..itemCount) |_| {
                    ret += 1; // ignore the item token
                    const item = xml.xmlNewChild(list, null, "Item", null);
                    ret += deserialisePara(doc, item, paras, start + ret);
                }
            },
            else => {},
        }
    }
    return ret;
}

fn asText(content: []const u8) [:0]const u8 {
    const len: usize = std.mem.readInt(u16, content[0..2], .little);
    if (len == 0) return @ptrCast(content[2..2]); // special case empty strings
    return content[2 .. 1 + len :0];
}

const ParaError = error{
    ParaNotFound,
    BadToken,
    OutofMemory,
};

const ParaToken = enum(u8) {
    text,
    source,
    emphasis,
    url,
    list,
    item,
    none,

    fn from(tok: xml.xmlNodePtr) ParaToken {
        if (xml.xmlNodeIsText(tok) == 1) return .text;
        if (tree.equals(tok.*.name, "Source")) {
            if (tok.*.properties != null) return .url;
            return .source;
        }
        if (tree.equals(tok.*.name, "Emphasis")) return .emphasis;
        if (tree.equals(tok.*.name, "List")) return .list;
        if (tree.equals(tok.*.name, "Item")) return .item;
        return .none;
    }

    fn serialise(self: ParaToken, list: *std.ArrayList(u8), alloc: Allocator, tok: xml.xmlNodePtr) ParaError!void {
        list.append(alloc, @intFromEnum(self)) catch return ParaError.OutofMemory;
        switch (self) {
            .text => {
                if (tok.*.content == null) {
                    list.append(alloc, 0) catch return ParaError.OutofMemory;
                    list.append(alloc, 0) catch return ParaError.OutofMemory;
                    return;
                }
                try writeText(list, alloc, std.mem.span(tok.*.content));
            },
            .source, .emphasis => {
                if (tok.*.children == null or tok.*.children.*.content == null) {
                    list.append(alloc, 0) catch return ParaError.OutofMemory;
                    list.append(alloc, 0) catch return ParaError.OutofMemory;
                    return;
                }
                try writeText(list, alloc, std.mem.span(tok.*.children.*.content));
            },
            .url => {
                if (tok.*.properties.*.children == null or tok.*.properties.*.children.*.content == null) {
                    list.append(alloc, 0) catch return ParaError.OutofMemory;
                    list.append(alloc, 0) catch return ParaError.OutofMemory;
                } else {
                    try writeText(list, alloc, std.mem.span(tok.*.properties.*.children.*.content));
                }
                if (tok.*.children == null or tok.*.children.*.content == null) {
                    list.append(alloc, 0) catch return ParaError.OutofMemory;
                    list.append(alloc, 0) catch return ParaError.OutofMemory;
                    return;
                }
                try writeText(list, alloc, std.mem.span(tok.*.children.*.content));
            },
            .item, .list => serialisePara(list, alloc, tok) catch return ParaError.BadToken,
            else => return ParaError.BadToken,
        }
    }

    fn deserialise(self: ParaToken, doc: *Document, parent: xml.xmlNodePtr, paras: []const u8, start: usize) usize {
        switch (self) {
            .text => {
                if (paras[start] == 0 and paras[start + 1] == 0) return 2;
                const txt = asText(paras[start..]);
                const textNode = xml.xmlNewDocText(doc.doc, txt.ptr);
                _ = xml.xmlAddChild(parent, textNode);
                return 3 + txt.len;
            },
            .source => {
                const src = xml.xmlNewChild(parent, null, "Source", null);
                if (paras[start] == 0 and paras[start + 1] == 0) return 2;
                const txt = asText(paras[start..]);
                _ = xml.xmlNodeAddContent(src, txt.ptr);
                return 3 + txt.len;
            },
            .emphasis => {
                const emp = xml.xmlNewChild(parent, null, "Emphasis", null);
                if (paras[start] == 0 and paras[start + 1] == 0) return 2;
                const txt = asText(paras[start..]);
                _ = xml.xmlNodeAddContent(emp, txt.ptr);
                return 3 + txt.len;
            },
            .url => {
                const src = xml.xmlNewChild(parent, null, "Source", null);
                var propLen: usize = 2;
                if (paras[start] > 0 or paras[start + 1] > 0) {
                    const prop = asText(paras[start..]);
                    _ = xml.xmlSetProp(src, "url", prop.ptr);
                    propLen = 3 + prop.len;
                }
                if (paras[start + propLen] == 0 and paras[start + propLen + 1] == 0) return propLen + 2;
                const txt = asText(paras[start + propLen ..]);
                _ = xml.xmlNodeAddContent(src, txt.ptr);
                return propLen + 3 + txt.len;
            },
            else => return start,
        }
    }
};

fn writeText(list: *std.ArrayList(u8), alloc: Allocator, text: []const u8) ParaError!void {
    var buf: [2]u8 = .{ 0, 0 };
    std.mem.writeInt(u16, &buf, @truncate(text.len + 1), .little);
    list.append(alloc, buf[0]) catch return ParaError.OutofMemory;
    list.append(alloc, buf[1]) catch return ParaError.OutofMemory;
    list.appendSlice(alloc, text) catch return ParaError.OutofMemory;
    list.append(alloc, 0) catch return ParaError.OutofMemory; // null terminate strings
}

fn serialisePara(list: *std.ArrayList(u8), alloc: Allocator, para: ?xml.xmlNodePtr) ParaError!void {
    const p = para orelse return ParaError.ParaNotFound;
    const tokenCount = nodeCount(p);
    list.append(alloc, @truncate(tokenCount)) catch return ParaError.OutofMemory;
    for (0..tokenCount) |idx| {
        const tok = nth(p, idx);
        const tok_typ = ParaToken.from(tok);
        try tok_typ.serialise(list, alloc, tok);
    }
}

fn nodeCount(para: xml.xmlNodePtr) usize {
    var ret: usize = 0;
    var node = para.*.children;
    while (node != null) : (node = node.*.next) {
        if (xml.xmlIsBlankNode(node) == 1) continue; // xml.XML_PARSE_NOBLANKS has issues :)
        ret += 1;
    }
    return ret;
}

fn nth(para: xml.xmlNodePtr, idx: usize) xml.xmlNodePtr {
    var count: usize = 0;
    var node = para.*.children;
    while (node != null) : (node = node.*.next) {
        if (xml.xmlIsBlankNode(node) == 1) continue; // xml.XML_PARSE_NOBLANKS has issues :)
        if (count == idx) return node;
        count += 1;
    }
    // should not reach this!
    return para;
}

test "serialise" {
    const test_para =
        \\<Test xmlns="http://www.records.nsw.gov.au/schemas/RDA">
        \\  <Paragraph>Hello world.</Paragraph>
        \\  <Paragraph>This is a <Emphasis>test</Emphasis>. I want to use all the<Source>formatting</Source>. Including<Source url="http://www.world.com">links</Source>.</Paragraph>
        \\  <Paragraph>And lists:
        \\    <List>
        \\      <Item>One item</Item>
        \\      <Item>Two item, this one with<Emphasis>emphasis</Emphasis></Item>
        \\    </List>
        \\  </Paragraph>
        \\  <Paragraph>And a final para!</Paragraph>
        \\  <Paragraph>And a bad char Office’s</Paragraph>
        \\  <Paragraph><Source /></Paragraph>
        \\</Test> 
    ;
    const session = try Session.init(testing.allocator);
    defer session.deinit();

    const xdoc = xml.xmlReadMemory(test_para.ptr, @intCast(test_para.len), null, "utf-8", xml.XML_PARSE_NOBLANKS | xml.XML_PARSE_RECOVER | xml.XML_PARSE_NOERROR | xml.XML_PARSE_NOWARNING);
    defer xml.xmlFreeDoc(xdoc);
    var doc: Document = .{
        .session = session,
        .doc = xdoc,
        .tree_menu = .empty,
        .current = null,
        .current_nt = .None,
        .current_idx = 0,
    };
    const root = xml.xmlDocGetRootElement(xdoc);
    const res = try serialiseParas(testing.allocator, root);
    // const file = std.fs.cwd().createFile("paras.bin", .{}) catch unreachable;
    // defer file.close();
    // file.writeAll(res) catch unreachable;
    defer testing.allocator.free(res);
    try testing.expect(res[0] == 6); // six paras
    try testing.expect(res[1] == 1); // single token para
    try testing.expect(res[2] == 0); // text type
    try testing.expect(res[3] == 13); // le length
    try testing.expect(res[4] == 0); // le length
    try testing.expect(res[5] == 'H'); // first char
    try deserialiseParas(&doc, root, res);
}
