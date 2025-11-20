const std = @import("std");
const windows = std.os.windows;
const testing = std.testing;
const Session = @import("Session.zig");
const Document = @import("Document.zig");
const xml = @import("xml");

pub const Payload = extern struct { length: i32, data: ?[*]u8 };

const max_file = 100 * 1_048_576; //100MB

const global_allocator = std.heap.c_allocator;
var sess: *Session = undefined;
var has_sess: bool = false;
var freefn: ?*const fn (?*anyopaque) callconv(.c) void = null;

const DLL_PROCESS_ATTACH: windows.DWORD = 1;
const DLL_PROCESS_DETACH: windows.DWORD = 0;
const DLL_THREAD_ATTACH: windows.DWORD = 2;
const DLL_THREAD_DETACH: windows.DWORD = 3;

// just for debugging
fn dump(name: []const u8, str: []const u8) void {
    const file = std.fs.cwd().createFile(name, .{}) catch unreachable;
    defer file.close();
    file.writeAll(str) catch unreachable;
}

pub fn DllMain(hinstDLL: windows.HINSTANCE, dwReason: windows.DWORD, lpReserved: ?windows.LPVOID) callconv(std.builtin.CallingConvention.winapi) windows.BOOL {
    _ = hinstDLL;
    switch (dwReason) {
        DLL_PROCESS_ATTACH => {
            if (!has_sess) {
                freefn = xml.xmlFree orelse null;
                sess = Session.init(global_allocator) catch return windows.FALSE;
                has_sess = true;
            }
        },
        DLL_PROCESS_DETACH => {
            if (lpReserved != null and has_sess) {
                has_sess = false;
                unload();
            }
        },
        DLL_THREAD_ATTACH, DLL_THREAD_DETACH => {},
        else => {},
    }
    return windows.TRUE;
}

export fn unload() void {
    if (has_sess) {
        has_sess = false;
        for (sess.docs.items) |d| {
            d.deinit();
        }
        sess.deinit();
    }
}

export fn freeStr(ptr: [*c]u8) void {
    freefn.?(ptr);
}

export fn valid(idx: u8) bool {
    const doc = sess.get(idx);
    return doc.valid();
}

export fn transform(idx: u8, stylesheet: [*c]const u8, output: [*c]const u8) void {
    const doc = sess.get(idx);
    return doc.transform(stylesheet, output);
}

export fn edit(idx: u8, stylesheet: [*c]const u8) bool {
    const doc = sess.get(idx);
    return doc.edit(stylesheet);
}

export fn empty() u8 {
    const idx = sess.empty() catch return 255;
    return @truncate(idx);
}

export fn load(path: [*c]const u8) u8 {
    const ret = sess.load(std.mem.span(path)) catch return 255;
    return @intCast(ret);
}

// Tree data layout is [num_context, num_termclasses, contextentries, termclass entries]
// Context data layout is [len, text]
// TermClass data layout is [node_type, itemno_len, itemno_chars, title_len, title_chars, num_children, termclass_children].
export fn tree(idx: u8) Payload {
    const doc = sess.get(idx);
    doc.refreshTree() catch return .{ .length = 0, .data = null };
    return .{ .length = @intCast(doc.tree_menu.items.len), .data = doc.tree_menu.items.ptr };
}

export fn asStr(idx: u8) [*c]const u8 {
    const doc = sess.get(idx);
    return doc.toStr();
}

export fn setCurrent(idx: u8, nodeType: u8, nodeIdx: u16) void {
    const doc = sess.get(idx);
    doc.setCurrent(@enumFromInt(nodeType), nodeIdx);
}

export fn dropNode(idx: u8, nodeType: u8, nodeIdx: u16) void {
    const doc = sess.get(idx);
    doc.drop(@enumFromInt(nodeType), nodeIdx);
}

export fn addChild(
    idx: u8,
    ant: u8,
    nodeType: u8,
    nodeIdx: u16,
) void {
    const doc = sess.get(idx);
    doc.addChild(@enumFromInt(ant), @enumFromInt(nodeType), nodeIdx);
}

export fn addSibling(
    idx: u8,
    ant: u8,
    nodeType: u8,
    nodeIdx: u16,
) void {
    const doc = sess.get(idx);
    doc.addSibling(@enumFromInt(ant), @enumFromInt(nodeType), nodeIdx);
}

export fn moveUp(idx: u8, nodeType: u8, nodeIdx: u16) bool {
    const doc = sess.get(idx);
    return doc.moveUp(@enumFromInt(nodeType), nodeIdx);
}

export fn moveDown(idx: u8, nodeType: u8, nodeIdx: u16) bool {
    const doc = sess.get(idx);
    return doc.moveDown(@enumFromInt(nodeType), nodeIdx);
}

export fn getType(idx: u8) u8 {
    const doc = sess.get(idx);
    return @intFromEnum(doc.getType());
}

export fn get(idx: u8, name: [*c]const u8) [*c]const u8 {
    const doc = sess.get(idx);
    return doc.get(std.mem.span(name));
}

export fn getDate(idx: u8, dateType: u8) [*c]const u8 {
    const doc = sess.get(idx);
    return doc.getDate(@enumFromInt(dateType));
}

export fn getCirca(idx: u8, dateType: u8) bool {
    const doc = sess.get(idx);
    return doc.getCirca(@enumFromInt(dateType));
}

export fn set(idx: u8, name: [*c]const u8, value: [*c]const u8) void {
    const doc = sess.get(idx);
    return doc.set(std.mem.span(name), std.mem.span(value));
}

export fn setDate(idx: u8, dateType: u8, value: [*c]const u8) void {
    const doc = sess.get(idx);
    return doc.setDate(@enumFromInt(dateType), std.mem.span(value));
}

export fn setCirca(idx: u8, dateType: u8, value: bool) void {
    const doc = sess.get(idx);
    return doc.setCirca(@enumFromInt(dateType), value);
}

export fn getParagraphs(idx: u8, name: [*c]const u8) Payload {
    const doc = sess.get(idx);
    const paras = doc.getParagraphs(std.mem.span(name)) orelse return .{ .length = 0, .data = null };
    return .{ .length = @intCast(paras.len), .data = paras.ptr };
}

export fn setParagraphs(idx: u8, name: [*c]const u8, length: u16, data: [*c]const u8) void {
    const doc = sess.get(idx);
    if (length == 0) return doc.setParagraphs(std.mem.span(name), null);
    return doc.setParagraphs(std.mem.span(name), data[0..length]);
}

export fn multiLen(idx: u8, name: [*c]const u8) u16 {
    const doc = sess.get(idx);
    return @truncate(doc.multiLen(std.mem.span(name)));
}

export fn multiEmpty(idx: u8, name: [*c]const u8, midx: u16) bool {
    const doc = sess.get(idx);
    return doc.multiEmpty(std.mem.span(name), midx);
}

export fn multiStatusType(idx: u8, midx: u16) u8 {
    const doc = sess.get(idx);
    return @intFromEnum(doc.multiStatusType(midx));
}

export fn multiSeeRefType(idx: u8, midx: u16) u8 {
    const doc = sess.get(idx);
    return @intFromEnum(doc.multiSeeRefType(midx));
}

export fn multiAdd(idx: u8, name: [*c]const u8, sub: [*c]const u8) u16 {
    const doc = sess.get(idx);
    if (sub == null) {
        return @truncate(doc.multiAdd(std.mem.span(name), null));
    }
    return @truncate(doc.multiAdd(std.mem.span(name), std.mem.span(sub)));
}

export fn multiAddSeeRef(idx: u8, srt: u8) void {
    const doc = sess.get(idx);
    return doc.multiAddSeeRef(@enumFromInt(srt));
}

export fn multiDrop(idx: u8, name: [*c]const u8, midx: u16) void {
    const doc = sess.get(idx);
    return doc.multiDrop(std.mem.span(name), midx);
}

export fn multiUp(idx: u8, name: [*c]const u8, midx: u16) void {
    const doc = sess.get(idx);
    return doc.multiUp(std.mem.span(name), midx);
}

export fn multiDown(idx: u8, name: [*c]const u8, midx: u16) void {
    const doc = sess.get(idx);
    return doc.multiDown(std.mem.span(name), midx);
}

export fn multiGet(idx: u8, name: [*c]const u8, midx: u16, sub: [*c]const u8) [*c]const u8 {
    const doc = sess.get(idx);
    const subx: ?[:0]const u8 = if (sub == null) null else std.mem.span(sub);
    return doc.multiGet(std.mem.span(name), midx, subx);
}

export fn multiSet(idx: u8, name: [*c]const u8, midx: u16, sub: [*c]const u8, value: [*c]const u8) void {
    const doc = sess.get(idx);
    const subx: ?[:0]const u8 = if (sub == null) null else std.mem.span(sub);
    const valuex: ?[:0]const u8 = if (value == null) null else std.mem.span(value);
    return doc.multiSet(std.mem.span(name), midx, subx, valuex);
}

export fn multiGetParagraphs(idx: u8, name: [*c]const u8, midx: u16, sub: [*c]const u8) Payload {
    const doc = sess.get(idx);
    const subx: ?[:0]const u8 = if (sub == null) null else std.mem.span(sub);
    const paras = doc.multiGetParagraphs(std.mem.span(name), midx, subx) orelse return .{ .length = 0, .data = null };
    return .{ .length = @intCast(paras.len), .data = paras.ptr };
}

export fn multiSetParagraphs(idx: u8, name: [*c]const u8, midx: u16, sub: [*c]const u8, length: u16, data: [*c]const u8) void {
    const doc = sess.get(idx);
    const subx: ?[:0]const u8 = if (sub == null) null else std.mem.span(sub);
    if (length == 0) return doc.multiSetParagraphs(std.mem.span(name), midx, subx, data[0..length]);
    return doc.multiSetParagraphs(std.mem.span(name), midx, subx, data[0..length]);
}

export fn termsRefLen(idx: u8, name: [*c]const u8, midx: u16) u16 {
    const doc = sess.get(idx);
    return @truncate(doc.termsRefLen(std.mem.span(name), midx));
}

export fn termsRefAdd(idx: u8, name: [*c]const u8, midx: u16) void {
    const doc = sess.get(idx);
    return doc.termsRefAdd(std.mem.span(name), midx);
}

export fn termsRefGet(idx: u8, name: [*c]const u8, midx: u16, tidx: u16) [*c]const u8 {
    const doc = sess.get(idx);
    return doc.termsRefGet(std.mem.span(name), midx, tidx);
}

export fn termsRefSet(idx: u8, name: [*c]const u8, midx: u16, tidx: u16, value: [*c]const u8) void {
    const doc = sess.get(idx);
    const valuex: ?[:0]const u8 = if (value == null) null else std.mem.span(value);
    return doc.termsRefSet(std.mem.span(name), midx, tidx, valuex);
}

test {
    _ = @import("Session.zig");
    _ = @import("Document.zig");
    _ = @import("tree.zig");
    _ = @import("paragraph.zig");
}

const example = "../data/SRNSW_example.xml";

test "validate" {
    sess = Session.init(testing.allocator) catch unreachable;
    has_sess = true;
    defer unload();
    const idx = load(example);
    try testing.expect(valid(idx));
}

test "slices" {
    const buf = [_]u8{ 'h', 'e', 'l', 'l', 'o', 0 };
    const in: [*c]const u8 = @ptrCast(&buf);
    const out: ?[:0]const u8 = std.mem.span(in);
    try testing.expect(out.?.len == 5);
}
