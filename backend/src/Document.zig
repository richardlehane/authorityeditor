const std = @import("std");
const testing = std.testing;
const Allocator = std.mem.Allocator;
const tree = @import("tree.zig");
const elements = @import("elements.zig");
const xml = @import("xml");
const miniz = @import("miniz");
const Session = @import("Session.zig");
const paragraph = @import("paragraph.zig");

const Document = @This();
const max_file = 100 * 1_048_576; //100MB

const srnsw_blank =
    \\<Authority xmlns="http://www.records.nsw.gov.au/schemas/RDA">
    \\  <Term itemno="1.0.0" type="function">
    \\    <Term itemno="1.1.0" type="activity">
    \\      <Class itemno="1.1.1">
    \\        <Disposal />
    \\      </Class>
    \\    </Term>
    \\  </Term>
    \\</Authority> 
;

// Document fields
session: *Session,
doc: xml.xmlDocPtr,
tree_menu: std.ArrayList(u8),
current: ?xml.xmlNodePtr,
current_nt: tree.NodeType,
current_idx: usize,

fn wrapDoc(session: *Session, d: xml.xmlDocPtr) !*Document {
    const ptr = try session.allocator.create(Document);
    ptr.* = .{
        .session = session,
        .doc = d,
        .tree_menu = .empty,
        .current = null,
        .current_nt = .Authority,
        .current_idx = 0,
    };
    ptr.setCurrent(.Term, 0);
    return ptr;
}

pub fn empty(
    session: *Session,
) !*Document {
    const d = xml.xmlReadMemory(srnsw_blank.ptr, @intCast(srnsw_blank.len), null, "utf-8", xml.XML_PARSE_NOBLANKS | xml.XML_PARSE_RECOVER | xml.XML_PARSE_NOERROR | xml.XML_PARSE_NOWARNING);
    return wrapDoc(session, d);
}

pub fn load(session: *Session, path: []const u8) !*Document {
    const d = xml.xmlReadFile(path.ptr, "utf-8", xml.XML_PARSE_NOBLANKS | xml.XML_PARSE_RECOVER | xml.XML_PARSE_NOERROR | xml.XML_PARSE_NOWARNING);
    return wrapDoc(session, d);
}

// Save returns true if document saved
pub fn save(self: *Document, path: [*c]const u8) bool {
    return xml.xmlSaveFile(path, self.doc) > 0;
}

pub fn deinit(self: *Document) void {
    xml.xmlFreeDoc(self.doc);
    self.tree_menu.deinit(self.session.allocator);
    self.session.allocator.destroy(self);
}

pub fn transform(self: *Document, stylesheet_path: [*c]const u8, output_path: [*c]const u8) void {
    xml.exsltCommonRegister();
    const stylesheet: xml.xsltStylesheetPtr = xml.xsltParseStylesheetFile(stylesheet_path);
    defer xml.xsltFreeStylesheet(stylesheet);
    const result: xml.xmlDocPtr = xml.xsltApplyStylesheet(stylesheet, self.doc, null);
    defer xml.xmlFreeDoc(result);
    _ = xml.xsltSaveResultToFilename(output_path, result, stylesheet, 0);
}

// returns true if current node has changed
pub fn edit(self: *Document, stylesheet_path: [*c]const u8) bool {
    xml.exsltCommonRegister();
    const stylesheet: xml.xsltStylesheetPtr = xml.xsltParseStylesheetFile(stylesheet_path);
    defer xml.xsltFreeStylesheet(stylesheet);
    const result: xml.xmlDocPtr = xml.xsltApplyStylesheet(stylesheet, self.doc, null);
    if (result == null) return false;
    xml.xmlFreeDoc(self.doc);
    self.doc = result;
    const old_nt = self.current_nt;
    self.setCurrent(self.current_nt, self.current_idx);
    self.refreshTree() catch return true;
    return old_nt != self.current_nt;
}

pub fn valid(self: *Document) bool {
    const schema_valid: xml.xmlSchemaValidCtxtPtr = xml.xmlSchemaNewValidCtxt(self.session.schema.?);
    defer xml.xmlSchemaFreeValidCtxt(schema_valid);
    const v: i32 = xml.xmlSchemaValidateDoc(schema_valid, self.doc);
    return v == 0;
}

pub fn toStr(self: *Document) [*c]u8 {
    var char: [*c]xml.xmlChar = undefined;
    var len: c_int = 0;
    xml.xmlDocDumpFormatMemory(self.doc, &char, &len, 1);
    return char;
}

pub fn refreshTree(self: *Document) !void {
    try tree.refresh(&self.tree_menu, self.session.allocator, self.doc);
}

pub fn setCurrent(self: *Document, nt: tree.NodeType, idx: usize) void {
    self.current = lookup(self, nt, idx) orelse {
        self.current_nt = .Authority;
        self.current_idx = 0;
        self.current = xml.xmlDocGetRootElement(self.doc);
        return;
    };
    self.current_nt = nt;
    self.current_idx = idx;
}

pub fn drop(self: *Document, nt: tree.NodeType, idx: usize) void {
    if (nt == .Authority) return; // let's not drop root by accident :)
    const node = lookup(self, nt, idx) orelse return;
    xml.xmlUnlinkNode(node);
    xml.xmlFreeNode(node);
}

pub fn copy(self: *Document, nt: tree.NodeType, idx: usize) void {
    if (nt == .Authority) return;
    const node = lookup(self, nt, idx) orelse return;
    // drop old copyNode if one exists
    if (self.session.copyNode) |cn| {
        xml.xmlUnlinkNode(cn);
        xml.xmlFreeNode(cn);
    }
    self.session.copyNode = xml.xmlDocCopyNode(node, self.session.copyDoc, 1);
}

// this function is used for copying to avoiding duplicating the default namespace
// which libxml2 seems to unavoidably do when doing a simple recursive copy, add
fn duplicate(self: *Document, copyNode: xml.xmlNodePtr, newNode: xml.xmlNodePtr) void {
    var attr = copyNode.*.properties;
    while (attr != null) : (attr = attr.*.next) {
        _ = xml.xmlSetProp(newNode, attr.*.name, xml.xmlGetProp(copyNode, attr.*.name));
    }
    var child = copyNode.*.children;
    while (child != null) : (child = child.*.next) {
        if (child.*.type == xml.XML_TEXT_NODE) {
            _ = xml.xmlNodeSetContent(newNode, xml.xmlNodeGetContent(child));
        }
        if (child.*.type == xml.XML_ELEMENT_NODE) {
            var cn = xml.xmlNewDocNode(self.doc, self.session.ns, child.*.name, null);
            cn = xml.xmlAddChild(newNode, cn);
            duplicate(self, child, cn);
        }
    }
}

pub fn pasteChild(self: *Document, nt: tree.NodeType, idx: usize) void {
    if (self.session.copyNode) |cn| {
        const parent = lookup(self, nt, idx) orelse return;
        const newCopy = xml.xmlNewDocNode(self.doc, self.session.ns, cn.*.name, null);
        duplicate(self, cn, newCopy);
        _ = if (nt == .Authority)
            elements.orderedInsert(parent, .Authority, newCopy)
        else
            xml.xmlAddChild(parent, newCopy);
    }
}

pub fn pasteSibling(self: *Document, nt: tree.NodeType, idx: usize) void {
    if (self.session.copyNode) |cn| {
        const prev = lookup(self, nt, idx) orelse return;
        const newCopy = xml.xmlNewDocNode(self.doc, self.session.ns, cn.*.name, null); // make a new copy within doc
        duplicate(self, cn, newCopy);
        _ = xml.xmlAddNextSibling(prev, newCopy);
    }
}

pub fn addChild(self: *Document, ant: tree.NodeType, nt: tree.NodeType, idx: usize) void {
    const parent = lookup(self, nt, idx) orelse return;
    const node = xml.xmlNewDocNode(self.doc, self.session.ns, ant.toStr().ptr, null);
    if (ant == .Context) {
        _ = elements.orderedInsert(parent, .Authority, node);
        return;
    }
    if (ant == .Class) {
        _ = xml.xmlNewChild(node, null, "Disposal", null);
    }
    _ = xml.xmlAddChild(parent, node);
}

pub fn addSibling(self: *Document, ant: tree.NodeType, nt: tree.NodeType, idx: usize) void {
    const prev = lookup(self, nt, idx) orelse return;
    const sibling = xml.xmlNewDocNode(self.doc, self.session.ns, ant.toStr().ptr, null);
    if (ant == .Class) {
        _ = xml.xmlNewChild(sibling, null, "Disposal", null);
    }
    _ = xml.xmlAddNextSibling(prev, sibling);
}

pub fn moveUp(self: *Document, nt: tree.NodeType, idx: usize) bool {
    const next = lookup(self, nt, idx) orelse return false;
    const prev = xml.xmlPreviousElementSibling(next);
    if (prev == null or !nt.like(prev.*.name)) return false;
    _ = xml.xmlAddPrevSibling(prev, next);
    return true;
}

pub fn moveDown(self: *Document, nt: tree.NodeType, idx: usize) bool {
    const prev = lookup(self, nt, idx) orelse return false;
    const next = xml.xmlNextElementSibling(prev);
    if (next == null or !nt.like(next.*.name)) return false;
    _ = xml.xmlAddNextSibling(next, prev);
    return true;
}

// functions on current node

pub fn getType(self: *Document) tree.NodeType {
    return self.current_nt;
}

// caller must free the result with xmlFree
pub fn get(self: *Document, name: []const u8) [*c]u8 {
    const curr = self.current orelse return null;
    if (isAttr(name)) return xml.xmlGetProp(curr, name.ptr);
    const el = tree.childN(curr, name, 0) orelse return null;
    return xml.xmlNodeGetContent(el);
}

pub fn set(self: *Document, name: [:0]const u8, value: ?[:0]const u8) void {
    const curr = self.current orelse return;
    // handle attributes
    if (isAttr(name)) {
        const val = value orelse {
            // drop attribute
            _ = xml.xmlUnsetProp(curr, name.ptr);
            return;
        };
        // add/update attribute
        _ = xml.xmlSetProp(curr, name.ptr, val.ptr);
        return;
    }
    const el = tree.childN(curr, name, 0) orelse {
        const val = value orelse return; // no element and no value
        // add element with content as child or sibling
        const node = xml.xmlNewDocNode(self.doc, self.session.ns, name.ptr, null);
        _ = xml.xmlNodeAddContent(node, val.ptr);
        _ = elements.orderedInsert(curr, getType(self), node);
        return;
    };
    const val = value orelse {
        // drop element if empty
        if (el.*.properties == null) {
            xml.xmlUnlinkNode(el);
            xml.xmlFreeNode(el);
        } else _ = xml.xmlNodeSetContent(el, null);
        return;
    };
    // update element content
    _ = xml.xmlNodeSetContent(el, null); // clear first
    _ = xml.xmlNodeAddContent(el, val.ptr);
}

// caller must free the result with allocator
pub fn getParagraphs(self: *Document, name: []const u8) ?[]u8 {
    const curr = self.current orelse return null;
    const el = tree.childN(curr, name, 0) orelse return null;
    return paragraph.serialiseParas(self.session.allocator, el) catch return null;
}

pub fn setParagraphs(self: *Document, name: [:0]const u8, value: ?[]const u8) void {
    const curr = self.current orelse return;
    const el = tree.childN(curr, name, 0) orelse blk: {
        if (value == null) return;
        const node = xml.xmlNewDocNode(self.doc, self.session.ns, name.ptr, null);
        break :blk elements.orderedInsert(curr, getType(self), node);
    };
    paragraph.deserialiseParas(self, el, value) catch return;
}

// caller must free the result with xmlFree
pub fn getDate(self: *Document, typ: elements.DateType) [*c]u8 {
    const curr = self.current orelse return null;
    const dr = tree.childN(curr, "DateRange", 0) orelse return null;
    const dt = tree.childN(dr, typ.toStr(), 0) orelse return null;
    return xml.xmlNodeGetContent(dt);
}

pub fn setDate(self: *Document, typ: elements.DateType, value: ?[:0]const u8) void {
    const curr = self.current orelse return;
    const dr = tree.childN(curr, "DateRange", 0) orelse {
        const val = value orelse return; // nothing to add, nothing to do
        const node = xml.xmlNewDocNode(self.doc, self.session.ns, "DateRange", null);
        const child = xml.xmlNewChild(node, null, typ.toStr().ptr, null);
        _ = xml.xmlNodeAddContent(child, val.ptr);
        _ = elements.orderedInsert(curr, getType(self), node);
        return;
    };
    const val = value orelse {
        const date = tree.childN(dr, typ.toStr(), 0) orelse {
            if (xml.xmlChildElementCount(dr) > 0) return;
            xml.xmlUnlinkNode(dr);
            xml.xmlFreeNode(dr);
            return;
        };
        if (date.*.properties == null) {
            xml.xmlUnlinkNode(date);
            xml.xmlFreeNode(date);
            if (xml.xmlChildElementCount(dr) == 0) {
                xml.xmlUnlinkNode(dr);
                xml.xmlFreeNode(dr);
            }
        } else _ = xml.xmlNodeSetContent(date, null);
        return;
    };
    const date = tree.childN(dr, typ.toStr(), 0) orelse {
        const child = xml.xmlNewDocNode(self.doc, self.session.ns, typ.toStr().ptr, null);
        _ = xml.xmlNodeAddContent(child, val.ptr);
        if (typ == .start) {
            const end = tree.childN(dr, "End", 0) orelse {
                _ = xml.xmlAddChild(dr, child);
                return;
            };
            _ = xml.xmlAddPrevSibling(end, child);
        } else _ = xml.xmlAddChild(dr, child);
        return;
    };
    _ = xml.xmlNodeSetContent(date, val.ptr);
}

pub fn getCirca(self: *Document, typ: elements.DateType) bool {
    const curr = self.current orelse return false;
    const dr = tree.childN(curr, "DateRange", 0) orelse return false;
    const date = tree.childN(dr, typ.toStr(), 0) orelse return false;
    const val = xml.xmlGetProp(date, "circa");
    defer tree.freeStr(val);
    return elements.truthy(val);
}

pub fn setCirca(self: *Document, typ: elements.DateType, value: bool) void {
    const curr = self.current orelse return;
    const dr = tree.childN(curr, "DateRange", 0) orelse {
        if (!value) return; // nothing to add, nothing to do
        const node = xml.xmlNewDocNode(self.doc, self.session.ns, "DateRange", null);
        const child = xml.xmlNewChild(node, null, typ.toStr().ptr, null);
        _ = xml.xmlSetProp(child, "circa", "true");
        _ = elements.orderedInsert(curr, getType(self), node);
        return;
    };
    if (!value) {
        const date = tree.childN(dr, typ.toStr(), 0) orelse {
            if (xml.xmlChildElementCount(dr) > 0) return;
            xml.xmlUnlinkNode(dr);
            xml.xmlFreeNode(dr);
            return;
        };
        _ = xml.xmlUnsetProp(date, "circa");
        if (date.*.children == null) {
            xml.xmlUnlinkNode(date);
            xml.xmlFreeNode(date);
            if (xml.xmlChildElementCount(dr) == 0) {
                xml.xmlUnlinkNode(dr);
                xml.xmlFreeNode(dr);
            }
        }
        return;
    }
    const date = tree.childN(dr, typ.toStr(), 0) orelse {
        const child = xml.xmlNewDocNode(self.doc, self.session.ns, typ.toStr().ptr, null);
        _ = xml.xmlSetProp(child, "circa", "true");
        if (typ == .start) {
            const end = tree.childN(dr, "End", 0) orelse {
                _ = xml.xmlAddChild(dr, child);
                return;
            };
            _ = xml.xmlAddPrevSibling(end, child);
        } else _ = xml.xmlAddChild(dr, child);
        return;
    };
    _ = xml.xmlSetProp(date, "circa", "true");
}

// multi

pub fn multiLen(self: *Document, name: []const u8) usize {
    const curr = self.current orelse return 0;
    const mt = elements.MultiType.fromName(name);
    const parent = mt.parent(curr) orelse return 0;
    if (mt == .status) return xml.xmlChildElementCount(parent);
    return tree.count(parent, name);
}

pub fn multiEmpty(self: *Document, name: []const u8, idx: usize) bool {
    const curr = self.current orelse return true;
    const mt = elements.MultiType.fromName(name);
    var el = mt.parent(curr) orelse return true;
    el = blk: {
        if (mt == .status) {
            break :blk tree.childAt(el, idx) orelse return true;
        } else {
            break :blk tree.childN(el, name, idx) orelse return true;
        }
    };
    if (std.mem.eql(u8, name, "SeeReference")) {
        const ttr = tree.childN(el, "TermTitleRef", 0);
        if (ttr != null and !tree.empty(ttr.?)) return false;
        el = tree.childN(el, "IDRef", 0) orelse return true;
        return tree.contentEquals(el, "28");
    }
    return tree.empty(el);
}

pub fn multiStatusType(self: *Document, idx: usize) elements.StatusType {
    const curr = self.current orelse return .none;
    const parent = tree.childN(curr, "Status", 0) orelse return .none;
    const status = tree.childAt(parent, idx) orelse return .none;
    return elements.StatusType.fromName(std.mem.span(status.*.name));
}

pub fn multiSeeRefType(self: *Document, idx: usize) elements.SeeRefType {
    const curr = self.current orelse return .none;
    var el = elements.MultiType.para.parent(curr) orelse return .none;
    el = tree.childN(el, "SeeReference", idx) orelse return .none;
    const inr = tree.childN(el, "ItemNoRef", 0);
    if (inr != null) return .other;
    const ir = tree.childN(el, "IDRef", 0);
    const ar = tree.childN(el, "AuthorityTitleRef", 0);
    if (ir == null and ar == null) return .local;
    if (ir != null and tree.contentEquals(ir.?, "28")) return .ga28;
    return .other;
}

pub fn multiAdd(self: *Document, name: [:0]const u8, sub: ?[:0]const u8) usize {
    const curr = self.current orelse return 0;
    const mt = elements.MultiType.fromName(name);
    const el_name = sub orelse name;
    const el = xml.xmlNewDocNode(self.doc, self.session.ns, el_name.ptr, null);
    if (mt == .status) {
        const status = tree.childN(curr, "Status", 0);
        if (status) |s| {
            _ = xml.xmlAddChild(s, el);
            return xml.xmlChildElementCount(s) - 1;
        } else {
            var s = xml.xmlNewDocNode(self.doc, self.session.ns, "Status", null);
            s = elements.orderedInsert(curr, getType(self), s);
            _ = xml.xmlAddChild(s, el);
            return xml.xmlChildElementCount(s) - 1;
        }
    }
    if (mt == .para) {
        const para = mt.parent(curr) orelse {
            const nm = mt.parentName(curr) orelse return 0;
            var p = xml.xmlNewDocNode(self.doc, self.session.ns, nm.ptr, null);
            p = elements.orderedInsert(curr, getType(self), p);
            _ = xml.xmlAddChild(p, el);
            return 0;
        };
        _ = xml.xmlAddChild(para, el);
        return tree.count(para, el_name) - 1;
    }
    _ = elements.orderedInsert(curr, getType(self), el);
    return tree.count(curr, el_name) - 1;
}

pub fn multiAddSeeRef(self: *Document, srt: elements.SeeRefType) void {
    const curr = self.current orelse return;
    if (srt == .none) return;
    const seeref = xml.xmlNewDocNode(self.doc, self.session.ns, "SeeReference", null);
    switch (srt) {
        .ga28 => {
            const idref = xml.xmlNewChild(seeref, null, "IDRef", null);
            _ = xml.xmlSetProp(idref, "control", "GA");
            _ = xml.xmlNodeAddContent(idref, "28");
            const titleref = xml.xmlNewChild(seeref, null, "AuthorityTitleRef", null);
            _ = xml.xmlNodeAddContent(titleref, "Administrative records");
        },
        .other => {
            _ = xml.xmlNewChild(seeref, null, "IDRef", null);
            _ = xml.xmlNewChild(seeref, null, "TermTitleRef", null);
        },
        .local => {
            _ = xml.xmlNewChild(seeref, null, "TermTitleRef", null);
        },
        .none => return,
    }
    const parent = elements.MultiType.para.parent(curr) orelse {
        const nm = elements.MultiType.para.parentName(curr) orelse return;
        var pa = xml.xmlNewDocNode(self.doc, self.session.ns, nm.ptr, null);
        pa = elements.orderedInsert(curr, getType(self), pa);
        _ = xml.xmlAddChild(pa, seeref);
        return;
    };
    _ = xml.xmlAddChild(parent, seeref);
}

pub fn multiDrop(self: *Document, name: []const u8, idx: usize) void {
    const curr = self.current orelse return;
    const mt = elements.MultiType.fromName(name);
    const parent = mt.parent(curr) orelse return;
    const node = (if (mt == .status) tree.childAt(parent, idx) else tree.childN(parent, name, idx)) orelse return;
    xml.xmlUnlinkNode(node);
    xml.xmlFreeNode(node);
}

pub fn multiUp(self: *Document, name: []const u8, idx: usize) void {
    const curr = self.current orelse return;
    const mt = elements.MultiType.fromName(name);
    const parent = mt.parent(curr) orelse return;
    const next = (if (mt == .status) tree.childAt(parent, idx) else tree.childN(parent, name, idx)) orelse return;
    const prev = xml.xmlPreviousElementSibling(next);
    if (prev == null) return;
    if (mt != .status and !std.mem.eql(u8, std.mem.span(next.*.name), std.mem.span(prev.*.name))) return;
    _ = xml.xmlAddPrevSibling(prev, next);
}

pub fn multiDown(self: *Document, name: []const u8, idx: usize) void {
    const curr = self.current orelse return;
    const mt = elements.MultiType.fromName(name);
    const parent = mt.parent(curr) orelse return;
    const prev = (if (mt == .status) tree.childAt(parent, idx) else tree.childN(parent, name, idx)) orelse return;
    const next = xml.xmlNextElementSibling(prev);
    if (next == null) return;
    if (mt != .status and !std.mem.eql(u8, std.mem.span(next.*.name), std.mem.span(prev.*.name))) return;
    _ = xml.xmlAddNextSibling(next, prev);
}

pub fn multiSet(self: *Document, name: [:0]const u8, idx: usize, sub: ?[:0]const u8, val: ?[:0]const u8) void {
    const curr = self.current orelse return;
    const mt = elements.MultiType.fromName(name);
    const parent = mt.parent(curr) orelse return;
    const node = (if (mt == .status) tree.childAt(parent, idx) else tree.childN(parent, name, idx)) orelse return;
    const sub_name = sub orelse {
        // only need to update content - multidrop deletes nodes
        if (val) |v| {
            _ = xml.xmlNodeSetContent(node, null); // clear first
            _ = xml.xmlNodeAddContent(node, v.ptr);
        }
        return;
    };
    // set attribute
    if (isAttr(sub_name)) {
        var el = node;
        if (mt.elementName(sub_name)) |el_nm| {
            el = tree.childN(node, el_nm, 0) orelse blk: {
                const e = xml.xmlNewDocNode(self.doc, self.session.ns, el_nm.ptr, null);
                break :blk elements.orderedInsert(node, tree.NodeType.fromStr(node.*.name), e);
            };
        }
        const value = val orelse {
            // drop attribute
            _ = xml.xmlUnsetProp(el, sub_name.ptr);
            return;
        };
        // add/update attribute
        _ = xml.xmlSetProp(el, sub_name.ptr, value.ptr);
        return;
    }
    // set sub-element
    const maybe_el = tree.childN(node, sub_name, 0);
    const value = val orelse {
        // delete
        if (maybe_el) |el| {
            _ = xml.xmlNodeSetContent(el, null);
            if (tree.empty(el)) {
                xml.xmlUnlinkNode(el);
                xml.xmlFreeNode(el);
            }
        }
        return;
    };
    // update
    if (maybe_el) |el| {
        _ = xml.xmlNodeSetContent(el, null);
        _ = xml.xmlNodeAddContent(el, value.ptr);
        return;
    }
    // insert
    const e = xml.xmlNewDocNode(self.doc, self.session.ns, sub_name.ptr, null);
    _ = xml.xmlNodeAddContent(e, value.ptr);
    _ = elements.orderedInsert(node, tree.NodeType.fromStr(node.*.name), e);
    return;
}

// caller must free the result with xmlFree
pub fn multiGet(self: *Document, name: []const u8, idx: usize, sub: ?[]const u8) [*c]u8 {
    const curr = self.current orelse return null;
    const mt = elements.MultiType.fromName(name);
    const parent = mt.parent(curr) orelse return null;
    const node = (if (mt == .status) tree.childAt(parent, idx) else tree.childN(parent, name, idx)) orelse return null;
    const sub_name = sub orelse return xml.xmlNodeGetContent(node);
    if (isAttr(sub_name)) {
        var el = node;
        if (mt.elementName(sub_name)) |el_nm| {
            el = tree.childN(node, el_nm, 0) orelse return null;
        }
        return xml.xmlGetProp(el, sub_name.ptr);
    }
    const el = tree.childN(node, sub_name, 0) orelse return null;
    return xml.xmlNodeGetContent(el);
}

// caller must free via allocator
pub fn multiGetParagraphs(self: *Document, name: []const u8, idx: usize, sub: ?[]const u8) ?[]u8 {
    const curr = self.current orelse return null;
    const mt = elements.MultiType.fromName(name);
    const parent = mt.parent(curr) orelse return null;
    var node = (if (mt == .status) tree.childAt(parent, idx) else tree.childN(parent, name, idx)) orelse return null;
    if (sub) |sub_name| {
        node = tree.childN(node, sub_name, 0) orelse return null;
    }
    return paragraph.serialiseParas(self.session.allocator, node) catch return null;
}

pub fn multiSetParagraphs(self: *Document, name: [:0]const u8, idx: usize, sub: ?[]const u8, value: ?[]const u8) void {
    const curr = self.current orelse return;
    const mt = elements.MultiType.fromName(name);
    const parent = mt.parent(curr) orelse return;
    var node = (if (mt == .status) tree.childAt(parent, idx) else tree.childN(parent, name, idx)) orelse return;
    if (sub) |sub_name| {
        node = tree.childN(node, sub_name, 0) orelse blk: {
            if (value == null) return;
            const e = xml.xmlNewDocNode(self.doc, self.session.ns, sub_name.ptr, null);
            break :blk elements.orderedInsert(node, tree.NodeType.fromStr(node.*.name), e);
        };
    }
    paragraph.deserialiseParas(self, node, value) catch return;
}

pub fn termsRefLen(self: *Document, name: []const u8, idx: usize) usize {
    const curr = self.current orelse return 0;
    const mt = elements.MultiType.fromName(name);
    const parent = mt.parent(curr) orelse return 0;
    const node = (if (mt == .status) tree.childAt(parent, idx) else tree.childN(parent, name, idx)) orelse return 0;
    return tree.count(node, "TermTitleRef");
}

pub fn termsRefAdd(self: *Document, name: []const u8, idx: usize) void {
    const curr = self.current orelse return;
    const mt = elements.MultiType.fromName(name);
    const parent = mt.parent(curr) orelse return;
    const node = (if (mt == .status) tree.childAt(parent, idx) else tree.childN(parent, name, idx)) orelse return;
    const t = xml.xmlNewDocNode(self.doc, self.session.ns, "TermTitleRef", null);
    _ = elements.orderedInsert(node, tree.NodeType.fromStr(node.*.name), t);
}

pub fn termsRefSet(self: *Document, name: []const u8, idx: usize, tidx: usize, value: ?[:0]const u8) void {
    const curr = self.current orelse return;
    const mt = elements.MultiType.fromName(name);
    const parent = mt.parent(curr) orelse return;
    const node = (if (mt == .status) tree.childAt(parent, idx) else tree.childN(parent, name, idx)) orelse return;
    const t = tree.childN(node, "TermTitleRef", tidx) orelse return;
    const val = value orelse {
        xml.xmlUnlinkNode(t);
        xml.xmlFreeNode(t);
        return;
    };
    _ = xml.xmlNodeSetContent(t, null);
    _ = xml.xmlNodeAddContent(t, val.ptr);
}

// caller must free the result with xmlFree
pub fn termsRefGet(self: *Document, name: []const u8, idx: usize, tidx: usize) [*c]u8 {
    const curr = self.current orelse return null;
    const mt = elements.MultiType.fromName(name);
    const parent = mt.parent(curr) orelse return null;
    const node = (if (mt == .status) tree.childAt(parent, idx) else tree.childN(parent, name, idx)) orelse return null;
    const t = tree.childN(node, "TermTitleRef", tidx) orelse return null;
    return xml.xmlNodeGetContent(t);
}

// helpers

fn lookup(self: *Document, nt: tree.NodeType, idx: usize) ?xml.xmlNodePtr {
    return switch (nt) {
        .Authority => xml.xmlDocGetRootElement(self.doc),
        .Context => tree.childN(xml.xmlDocGetRootElement(self.doc), "Context", idx),
        .Term, .Class => tree.tcChildN(xml.xmlDocGetRootElement(self.doc), idx),
        else => null,
    };
}

fn isAttr(nm: []const u8) bool {
    if (nm.len < 1) return false;
    return std.ascii.isLower(nm[0]);
}

// Tests
const example = "../data/SRNSW_example.xml";

test "validate" {
    const session = try Session.init(testing.allocator);
    defer session.deinit();
    const idx = try session.load(example);
    const doc = session.get(idx);
    try testing.expect(doc.valid());
}

test "empty" {
    const session = try Session.init(testing.allocator);
    defer session.deinit();
    const doc = try Document.empty(session);
    defer doc.deinit();
    try doc.refreshTree();
    try testing.expectEqual(doc.tree_menu.items.len, 28);
}

test "load" {
    const session = try Session.init(testing.allocator);
    defer session.deinit();
    const doc = try Document.load(session, example);
    defer doc.deinit();
    try doc.refreshTree();
    try testing.expectEqual(doc.tree_menu.items.len, 293);
}

test "toStr" {
    const session = try Session.init(testing.allocator);
    defer session.deinit();
    const doc = try Document.empty(session);
    defer doc.deinit();
    const str = doc.toStr();
    try testing.expectEqual(std.mem.sliceTo(str, 49).len, 15);
    tree.freeStr(str);
}

test "tree" {
    const session = try Session.init(testing.allocator);
    defer session.deinit();
    const doc = try Document.load(session, example);
    defer doc.deinit();
    try doc.refreshTree();
    try testing.expectEqual(doc.tree_menu.items.len, 293);
}

test "transform" {
    const session = try Session.init(testing.allocator);
    defer session.deinit();
    const doc = try Document.load(session, example);
    defer doc.deinit();
    doc.transform("../frontend/assets/stylesheets/word_approved_authority.xsl", "word.xml");
    //const stat = try std.fs.cwd().statFile("preview.html");
    // try testing.expect(stat.size == 2025);
    try std.fs.cwd().deleteFile("word.xml");
}

test "edit" {
    const session = try Session.init(testing.allocator);
    defer session.deinit();
    const doc = try Document.load(session, example);
    defer doc.deinit();
    doc.setCurrent(.Authority, 0);
    try testing.expectEqual(doc.multiLen("Comment"), 1);
    try testing.expect(!doc.edit("../frontend/assets/stylesheets/edit_clear_comments.xsl"));
    try testing.expectEqual(doc.multiLen("Comment"), 0);
}

test "current" {
    const session = try Session.init(testing.allocator);
    defer session.deinit();
    const doc = try Document.load(session, example);
    defer doc.deinit();
    doc.setCurrent(.Context, 3);
    try testing.expectEqualSlices(u8, std.mem.span(xml.xmlNodeGetContent(tree.childN(doc.current.?, "ContextTitle", 0).?)), "About the records held by the organisation");
    doc.setCurrent(.Class, 4);
    const itemno = xml.xmlGetProp(doc.current.?, "itemno");
    try testing.expectEqualSlices(u8, std.mem.span(itemno), "3.6.1");
    try testing.expect(doc.valid());
}

test "drop" {
    const session = try Session.init(testing.allocator);
    defer session.deinit();
    const doc = try Document.empty(session);
    defer doc.deinit();
    doc.drop(.Class, 2);
    doc.drop(.Term, 1);
    doc.drop(.Term, 0);
    try testing.expectEqualSlices(u8, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Authority xmlns=\"http://www.records.nsw.gov.au/schemas/RDA\"/>\n", std.mem.span(doc.toStr()));
    try testing.expect(doc.valid());
}

test "paste child" {
    const session = try Session.init(testing.allocator);
    defer session.deinit();
    const doc = try Document.empty(session);
    const doc2 = try Document.empty(session);
    defer doc.deinit();
    defer doc2.deinit();
    doc.addChild(.Context, .Authority, 0);
    doc.copy(.Context, 0);
    doc.pasteChild(.Authority, 0);
    doc2.addChild(.Context, .Authority, 0);
    doc2.copy(.Context, 0);
    doc2.pasteSibling(.Context, 0);
    try testing.expectEqualSlices(u8, std.mem.span(doc.toStr()), std.mem.span(doc2.toStr()));
    try testing.expect(doc.valid());
}

test "paste sibling" {
    const session = try Session.init(testing.allocator);
    defer session.deinit();
    const doc = try Document.empty(session);
    defer doc.deinit();
    doc.copy(.Term, 1);
    doc.pasteSibling(.Term, 1);
    // try testing.expectEqualSlices(u8, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Authority xmlns=\"http://www.records.nsw.gov.au/schemas/RDA\"/>\n", std.mem.span(doc.toStr()));
    try testing.expect(doc.valid());
}

test "add child" {
    const session = try Session.init(testing.allocator);
    defer session.deinit();
    const doc = try Document.empty(session);
    defer doc.deinit();
    doc.addChild(.Class, .Term, 1);
    doc.addChild(.Context, .Authority, 0);
    doc.drop(.Term, 0);
    doc.drop(.Context, 0);
    try testing.expectEqualSlices(u8, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Authority xmlns=\"http://www.records.nsw.gov.au/schemas/RDA\"/>\n", std.mem.span(doc.toStr()));
    try testing.expect(doc.valid());
}

test "add sibling" {
    const session = try Session.init(testing.allocator);
    defer session.deinit();
    const doc = try Document.empty(session);
    defer doc.deinit();
    doc.addSibling(.Class, .Term, 1);
    doc.addChild(.Context, .Authority, 0);
    doc.addSibling(.Context, .Context, 0);
    doc.drop(.Term, 0);
    doc.drop(.Context, 0);
    doc.drop(.Context, 0);
    try testing.expectEqualSlices(u8, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Authority xmlns=\"http://www.records.nsw.gov.au/schemas/RDA\"/>\n", std.mem.span(doc.toStr()));
    try testing.expect(doc.valid());
}

test "move" {
    const session = try Session.init(testing.allocator);
    defer session.deinit();
    const doc = try Document.empty(session);
    defer doc.deinit();
    doc.addChild(.Term, .Authority, 0);
    try testing.expect(doc.moveUp(.Term, 3));
    try testing.expect(!doc.moveUp(.Term, 0));
    try testing.expect(doc.moveDown(.Term, 0));
    try testing.expect(doc.valid());
}

test "get type" {
    const session = try Session.init(testing.allocator);
    defer session.deinit();
    const doc = try Document.empty(session);
    defer doc.deinit();
    doc.setCurrent(.Class, 2);
    try testing.expectEqual(doc.getType(), .Class);
    try testing.expect(doc.valid());
}

test "get and set" {
    const session = try Session.init(testing.allocator);
    defer session.deinit();
    const doc = try Document.empty(session);
    defer doc.deinit();
    doc.addSibling(.Class, .Term, 1);
    doc.setCurrent(.Class, 3);
    doc.set("itemno", "1.<&.2");
    var result = doc.get("itemno");
    try testing.expectEqualSlices(u8, "1.<&.2", std.mem.span(result));
    tree.freeStr(result);
    result = doc.get("itemno");
    try testing.expectEqualSlices(u8, "1.<&.2", std.mem.span(result));
    tree.freeStr(result);
    doc.setCurrent(.Class, 2);
    doc.set("itemno", null);
    result = doc.get("itemno");
    try testing.expect(result == null);
    doc.setCurrent(.Class, 3);
    doc.set("ClassTitle", "The ides of &march");
    result = doc.get("ClassTitle");
    try testing.expectEqualSlices(u8, "The ides of &march", std.mem.span(result));
    tree.freeStr(result);
    doc.addSibling(.Term, .Class, 3);
    doc.setCurrent(.Term, 4);
    doc.set("TermTitle", "The ides of &march");
    result = doc.get("TermTitle");
    try testing.expectEqualSlices(u8, "The ides of &march", std.mem.span(result));
    tree.freeStr(result);
    doc.set("TermTitle", null);
    try testing.expect(doc.get("TermTitle") == null);
    try testing.expect(doc.valid());
}

test "dates" {
    const session = try Session.init(testing.allocator);
    defer session.deinit();
    const doc = try Document.empty(session);
    defer doc.deinit();
    doc.setCurrent(.Term, 0);
    doc.setCirca(.start, true);
    doc.setDate(.start, "1900");
    doc.setDate(.end, "2000");
    doc.setCirca(.end, false);
    var result = doc.getDate(.start);
    try testing.expectEqualSlices(u8, "1900", std.mem.span(result));
    tree.freeStr(result);
    result = doc.getDate(.end);
    try testing.expectEqualSlices(u8, "2000", std.mem.span(result));
    tree.freeStr(result);
    try testing.expect(doc.getCirca(.start));
    try testing.expect(!doc.getCirca(.end));
    doc.setDate(.end, null);
    try testing.expect(doc.getCirca(.start));
    const doc2 = try Document.empty(session);
    defer doc2.deinit();
    doc.setDate(.start, null);
    doc.setCirca(.start, false);
    try testing.expectEqualSlices(u8, std.mem.span(doc.toStr()), std.mem.span(doc2.toStr()));
    try testing.expect(doc.valid());
}

test "multi" {
    const session = try Session.init(testing.allocator);
    defer session.deinit();
    const doc = try Document.empty(session);
    defer doc.deinit();
    doc.setCurrent(.Term, 0);
    try testing.expect(doc.multiAdd("Status", "Draft") == 0);
    try testing.expect(doc.multiAdd("Status", "Issued") == 1);
    try testing.expect(doc.multiAdd("Status", "Submitted") == 2);
    doc.multiDrop("Status", 1);
    try testing.expect(doc.multiLen("Status") == 2);
    try testing.expect(doc.multiAdd("LinkedTo", null) == 0);
    try testing.expect(doc.multiAdd("LinkedTo", null) == 1);
    try testing.expect(doc.multiAdd("LinkedTo", null) == 2);
    doc.multiDrop("LinkedTo", 1);
    try testing.expect(doc.multiLen("LinkedTo") == 2);
    try testing.expect(doc.multiAdd("Comment", null) == 0);
    try testing.expect(doc.multiAdd("Comment", null) == 1);
    doc.multiDrop("Comment", 0);
    try testing.expect(doc.multiLen("Comment") == 1);
    doc.multiAddSeeRef(.ga28);
    doc.multiAddSeeRef(.local);
    doc.multiAddSeeRef(.other);
    try testing.expect(doc.multiLen("SeeReference") == 3);
    try testing.expect(doc.valid());
}

test "multi set and get" {
    const session = try Session.init(testing.allocator);
    defer session.deinit();
    const doc = try Document.empty(session);
    defer doc.deinit();
    doc.setCurrent(.Authority, 0);
    try testing.expect(doc.multiAdd("ID", null) == 0);
    doc.multiSet("ID", 0, "control", "AR");
    doc.multiSet("ID", 0, null, "28");
    var result = doc.multiGet("ID", 0, null);
    try testing.expectEqualSlices(u8, "28", std.mem.span(result));
    tree.freeStr(result);
    doc.multiSet("ID", 0, null, "29");
    result = doc.multiGet("ID", 0, null);
    try testing.expectEqualSlices(u8, "29", std.mem.span(result));
    tree.freeStr(result);
    result = doc.multiGet("ID", 0, "control");
    try testing.expectEqualSlices(u8, "AR", std.mem.span(result));
    tree.freeStr(result);
    try testing.expect(doc.multiAdd("Status", "Issued") == 0);
    doc.multiSet("Status", 0, "agencyno", "294");
    doc.multiSet("Status", 0, "Agency", "Wild dog");
    result = doc.multiGet("Status", 0, "agencyno");
    try testing.expectEqualSlices(u8, "294", std.mem.span(result));
    tree.freeStr(result);
    result = doc.multiGet("Status", 0, "Agency");
    try testing.expectEqualSlices(u8, "Wild dog", std.mem.span(result));
    tree.freeStr(result);
    doc.multiSet("Status", 0, "Date", "2025-11-04");
    result = doc.multiGet("Status", 0, "Date");
    try testing.expectEqualSlices(u8, "2025-11-04", std.mem.span(result));
    tree.freeStr(result);
    doc.multiSet("Status", 0, "Date", null);
    doc.multiSet("Status", 0, "Agency", null);
    result = doc.multiGet("Status", 0, "agencyno");
    try testing.expectEqualSlices(u8, "294", std.mem.span(result));
    tree.freeStr(result);
    try testing.expect(doc.valid());
}
