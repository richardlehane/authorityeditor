const std = @import("std");
const testing = std.testing;
const Allocator = std.mem.Allocator;
const Document = @import("Document.zig");
const xml = @import("xml");
const miniz = @import("miniz");

const Session = @This();

const srnsw_schema = @embedFile("rda_schema");

// a Session
allocator: Allocator,
schema: xml.xmlSchemaPtr,
ns: *xml.xmlNs,
docs: std.ArrayList(*Document),

pub fn init(allocator: Allocator) !*Session {
    const schema_ctx: xml.xmlSchemaParserCtxtPtr = xml.xmlSchemaNewMemParserCtxt(srnsw_schema, srnsw_schema.len);
    defer xml.xmlSchemaFreeParserCtxt(schema_ctx);
    const ptr = try allocator.create(Session);
    ptr.* = .{
        .allocator = allocator,
        .schema = xml.xmlSchemaParse(schema_ctx),
        .ns = xml.xmlNewNs(null, "http://www.records.nsw.gov.au/schemas/RDA", null),
        .docs = .empty,
    };
    return ptr;
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

pub fn get(self: *Session, index: usize) *Document {
    return self.docs.items[index];
}

pub fn deinit(self: *Session) void {
    xml.xmlSchemaFree(self.schema);
    xml.xmlFreeNs(self.ns);
    self.docs.deinit(self.allocator);
    self.allocator.destroy(self);
    xml.xmlCleanupParser();
}

test "compress" {
    const status = miniz.mz_zip_add_mem_to_archive_file_in_place("test.zip", "test.txt", "test", 5, "comment", 7, miniz.MZ_BEST_COMPRESSION);
    try testing.expect(status == 1);
    try std.fs.cwd().deleteFile("test.zip");
}
