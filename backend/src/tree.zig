const std = @import("std");
const testing = std.testing;
const Allocator = std.mem.Allocator;
const xml = @import("xml");

pub fn freeStr(ptr: [*c]u8) void {
    const freefn = xml.xmlFree orelse unreachable;
    freefn(ptr);
}

pub fn equals(a: [*]const xml.xmlChar, b: []const u8) bool {
    for (b, 0..) |char, idx| if (a[idx] != char) return false;
    return a[b.len] == 0;
}

pub fn contentEquals(node: xml.xmlNodePtr, val: []const u8) bool {
    const content = xml.xmlNodeGetContent(node);
    defer freeStr(content);
    return equals(content, val);
}

pub fn empty(node: xml.xmlNodePtr) bool {
    var child = node.*.children;
    while (child != null) : (child = child.*.next) {
        if (xml.xmlIsBlankNode(child) == 1) continue;
        return false;
    }
    return node.*.properties == null;
}

/// Returns the Nth child of node with name
pub fn childN(node: xml.xmlNodePtr, name: []const u8, nth: usize) ?xml.xmlNodePtr {
    var idx: usize = 0;
    var current_node = xml.xmlFirstElementChild(node);
    while (current_node != null) : (current_node = xml.xmlNextElementSibling(current_node)) {
        if (equals(current_node.*.name, name)) {
            if (idx == nth) return current_node;
            idx += 1;
        }
    }
    return null;
}

pub fn childAt(node: xml.xmlNodePtr, nth: usize) ?xml.xmlNodePtr {
    var idx: usize = 0;
    var current_node = xml.xmlFirstElementChild(node);
    while (current_node != null) : (current_node = xml.xmlNextElementSibling(current_node)) {
        if (idx == nth) return current_node;
        idx += 1;
    }
    return null;
}

pub fn count(node: xml.xmlNodePtr, name: []const u8) usize {
    var ret: usize = 0;
    var current_node = xml.xmlFirstElementChild(node);
    while (current_node != null) : (current_node = xml.xmlNextElementSibling(current_node)) {
        if (equals(current_node.*.name, name)) ret += 1;
    }
    return ret;
}

fn recurse(curr: xml.xmlNodePtr, idx: *usize, nth: usize) ?xml.xmlNodePtr {
    var current_node = xml.xmlFirstElementChild(curr);
    while (current_node != null) : (current_node = xml.xmlNextElementSibling(current_node)) {
        const nt = NodeType.fromStr(current_node.*.name);
        if (nt.kind() == .TermClass) {
            if (idx.* == nth) return current_node;
            idx.* += 1;
            if (nt == .Term) {
                const ret = recurse(current_node, idx, nth);
                if (ret != null) return ret;
            }
        }
    }
    return null;
}

pub fn tcChildN(node: xml.xmlNodePtr, nth: usize) ?xml.xmlNodePtr {
    var idx: usize = 0;
    return recurse(node, &idx, nth);
}

pub const NodeKind = enum(u8) {
    Authority,
    Context,
    TermClass,
    None,
};

// same order as Authority NodeType
pub const NodeType = enum(u8) {
    Authority,
    Context,
    Class,
    Term,
    None,
    Disposal,
    Supersede,
    SeeRef,
    Draft,
    Submitted,
    Applying,

    pub fn fromStr(a: [*]const xml.xmlChar) NodeType {
        if (equals(a, "Authority")) return .Authority;
        if (equals(a, "Context")) return .Context;
        if (equals(a, "Term")) return .Term;
        if (equals(a, "Class")) return .Class;
        if (equals(a, "Disposal")) return .Disposal;
        if (equals(a, "PartSupersedes") or equals(a, "Supersedes") or equals(a, "PartSupersededBy") or equals(a, "SupersededBy")) return .Supersede;
        if (equals(a, "SeeReference")) return .SeeRef;
        if (equals(a, "Draft") or equals(a, "Issued")) return .Draft;
        if (equals(a, "Submitted")) return .Submitted;
        if (equals(a, "Applying")) return .Applying;
        return .None;
    }

    pub fn toStr(tc: NodeType) []const u8 {
        return switch (tc) {
            .Authority => "Authority",
            .Context => "Context",
            .Term => "Term",
            .Class => "Class",
            else => "",
        };
    }

    fn title(tc: NodeType) []const u8 {
        return switch (tc) {
            .Authority => "AuthorityTitle",
            .Context => "ContextTitle",
            .Term => "TermTitle",
            .Class => "ClassTitle",
            else => "",
        };
    }

    fn kind(tc: NodeType) NodeKind {
        return switch (tc) {
            .Authority => NodeKind.Authority,
            .Context => NodeKind.Context,
            .Term, .Class => NodeKind.TermClass,
            else => NodeKind.None,
        };
    }

    pub fn like(tc: NodeType, b: [*]const xml.xmlChar) bool {
        const bnt = NodeType.fromStr(b);
        return tc.kind() == bnt.kind();
    }
};

fn countChildren(current_node: xml.xmlNodePtr, kind: NodeKind) u8 {
    var ret: u8 = 0;
    var curr = xml.xmlFirstElementChild(current_node);
    while (curr != null) : (curr = xml.xmlNextElementSibling(curr)) {
        const tc = NodeType.fromStr(curr.*.name);
        if (tc.kind() == kind) ret += 1;
    }
    return ret;
}

// data is num_context,num_termclasses, contextentries, termclass entries
// Each context entry is len,text
// Each termclass entry is [node_type, itemno_len, itemno_chars, title_len, title_chars, num_children], children.

fn add(list: *std.ArrayList(u8), ally: Allocator, current_node: xml.xmlNodePtr) !void {
    var curr: xml.xmlNodePtr = current_node;
    while (curr != null) : (curr = curr.*.next) {
        switch (NodeType.fromStr(curr.*.name)) {
            .Authority => {
                try list.append(ally, countChildren(curr, NodeKind.Context));
                try list.append(ally, countChildren(curr, NodeKind.TermClass));
                try add(list, ally, curr.*.children);
            },
            .Context => {
                const title = childN(curr, NodeType.Context.title(), 0);
                if (title == null) {
                    try list.append(ally, 0);
                } else {
                    const chars = xml.xmlNodeGetContent(title.?);
                    const len: u8 = @truncate(std.mem.len(chars));
                    try list.append(ally, len);
                    if (len > 0) try list.appendSlice(ally, std.mem.span(chars));
                }
            },
            .Term, .Class => |nt| {
                try list.append(ally, @intFromEnum(nt));
                const chars = xml.xmlGetProp(curr, "itemno");
                const len: u8 = @truncate(std.mem.len(chars));
                try list.append(ally, len);
                if (len > 0) try list.appendSlice(ally, std.mem.span(chars));
                const title = childN(curr, nt.title(), 0);
                if (title == null) {
                    try list.append(ally, 0);
                } else {
                    const tchars = xml.xmlNodeGetContent(title.?);
                    const tlen: u8 = @truncate(std.mem.len(tchars));
                    try list.append(ally, tlen);
                    if (len > 0) try list.appendSlice(ally, std.mem.span(tchars));
                }
                if (nt == .Term) {
                    const children = countChildren(curr, NodeKind.TermClass);
                    try list.append(ally, children);
                    if (children > 0) try add(list, ally, curr.*.children);
                }
            },
            else => {},
        }
    }
}

pub fn refresh(list: *std.ArrayList(u8), ally: Allocator, doc: xml.xmlDocPtr) !void {
    list.clearRetainingCapacity();
    const root: xml.xmlNodePtr = xml.xmlDocGetRootElement(doc);
    try add(list, ally, root);
}

test "xml" {
    const test_empty =
        \\<Test xmlns="http://www.example.com/example">
        \\  <Empty></Empty>
        \\  <Empty />
        \\  <Empty> </Empty>
        \\  <NotEmpty attr="true" />
        \\  <NotEmpty><Empty /></NotEmpty>
        \\  <NotEmpty>content</NotEmpty>
        \\  <Content>ga28</Content>
        \\</Test> 
    ;
    const doc = xml.xmlReadMemory(test_empty.ptr, @intCast(test_empty.len), null, "utf-8", xml.XML_PARSE_NOBLANKS | xml.XML_PARSE_RECOVER | xml.XML_PARSE_NOERROR | xml.XML_PARSE_NOWARNING);
    defer xml.xmlFreeDoc(doc);
    const root = xml.xmlDocGetRootElement(doc);
    var e = childAt(root, 0).?;
    try testing.expect(empty(e));
    e = childAt(root, 1).?;
    try testing.expect(empty(e));
    e = childAt(root, 2).?;
    try testing.expect(empty(e));
    e = childAt(root, 3).?;
    try testing.expect(!empty(e));
    e = childAt(root, 4).?;
    try testing.expect(!empty(e));
    e = childAt(root, 5).?;
    try testing.expect(!empty(e));
    e = childAt(root, 6).?;
    try testing.expect(contentEquals(e, "ga28"));
}
