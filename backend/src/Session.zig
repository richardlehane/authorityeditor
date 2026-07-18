const std = @import("std");
const testing = std.testing;
const Allocator = std.mem.Allocator;
const Document = @import("Document.zig");
const xml = @import("xml");
const miniz = @import("miniz");

const Session = @This();

const srnsw_schema = @embedFile("rda_schema");

// a Session
// 0.16.0 +
//io: std.Io, // 0.15.2 trim
allocator: Allocator,
schema: xml.xmlSchemaPtr,
ns: *xml.xmlNs,
copyDoc: xml.xmlDocPtr,
copyNode: ?xml.xmlNodePtr,
docs: std.ArrayList(?*Document),

// pub fn init(io: std.Io, allocator: Allocator) !*Session { // 0.16.0
pub fn init(allocator: Allocator) !*Session { // 0.15.2
    const schema_ctx: xml.xmlSchemaParserCtxtPtr = xml.xmlSchemaNewMemParserCtxt(srnsw_schema, srnsw_schema.len);
    defer xml.xmlSchemaFreeParserCtxt(schema_ctx);
    const ptr = try allocator.create(Session);
    ptr.* = .{
        // 0.16.0 +
        //.io = io, // trim from 0.15.2
        .allocator = allocator,
        .schema = xml.xmlSchemaParse(schema_ctx),
        .ns = xml.xmlNewNs(null, "http://www.records.nsw.gov.au/schemas/RDA", null),
        .copyDoc = xml.xmlNewDoc(null),
        .copyNode = null,
        .docs = .empty,
    };
    const root = xml.xmlNewDocNode(ptr.copyDoc, ptr.ns, "Authority", null);
    _ = xml.xmlDocSetRootElement(ptr.copyDoc, root);
    return ptr;
}

// wrapper to make the transition from 0.15.2 -> 0.16+ simpler
pub fn initTesting() !*Session {
    return Session.init(testing.allocator); // 0.15.2
    //return Session.init(testing.io, testing.allocator); // 0.16.0 +
}

pub fn empty(self: *Session) !usize {
    const doc = try Document.empty(self);
    try self.docs.append(self.allocator, doc);
    return self.docs.items.len - 1;
}

pub fn load(self: *Session, path: []const u8) !usize {
    const doc = try Document.load(self, path);
    try self.docs.append(self.allocator, doc);
    return self.docs.items.len - 1;
}

pub fn unload(self: *Session, index: usize) void {
    if (self.docs.items[index]) |d| {
        d.deinit();
        self.docs.items[index] = null;
    }
}

pub fn get(self: *Session, index: usize) *Document {
    return self.docs.items[index].?;
}

pub fn deinit(self: *Session) void {
    xml.xmlSchemaFree(self.schema);
    xml.xmlFreeNs(self.ns);
    xml.xmlFreeDoc(self.copyDoc);
    for (self.docs.items) |doc| {
        if (doc) |d| {
            d.deinit();
        }
    }
    self.docs.deinit(self.allocator);
    self.allocator.destroy(self);
    xml.xmlCleanupParser();
}

test "compress" {
    const status = miniz.mz_zip_add_mem_to_archive_file_in_place("test.zip", "test.txt", "test", 5, "comment", 7, miniz.MZ_BEST_COMPRESSION);
    try testing.expect(status == 1);
    try std.fs.cwd().deleteFile("test.zip"); // 0.15.2
    //try std.Io.Dir.cwd().deleteFile(testing.io, "test.zip"); // 0.16.0+
}

test "load" {
    const session = try Session.initTesting();
    defer session.deinit();
    const idx = try session.load("../frontend/assets/SRNSW_example.xml");
    session.unload(idx);
}
