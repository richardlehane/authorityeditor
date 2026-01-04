const std = @import("std");
const testing = std.testing;
const Allocator = std.mem.Allocator;
const Document = @import("Document.zig");
const Session = @import("Session.zig");
const miniz = @import("miniz");
const xml = @import("xml");

// test "comments" {
//     var dir = try std.fs.cwd().openDir("../data/stylesheets/Comments/SRNSW Comments document", .{ .iterate = true });
//     defer dir.close();
//     var walker = try dir.walk(testing.allocator);
//     defer walker.deinit();
//     while (try walker.next()) |entry| {
//         if (entry.kind == .file) {
//             const buf = try dir.readFileAlloc(testing.allocator, entry.path, 100_000_000);
//             const status = miniz.mz_zip_add_mem_to_archive_file_in_place("comments.docx", entry.path, @ptrCast(buf), buf.len, null, 0, miniz.MZ_BEST_COMPRESSION);
//             try testing.expect(status == 1);
//             testing.allocator.free(buf);
//         }
//     }
//     const session = try Session.init(testing.allocator);
//     defer session.deinit();
//     const doc = try Document.load(session, "../data/examples/FA313 Premier and Cabinet 2025.xml");
//     defer doc.deinit();
//     xml.exsltCommonRegister();
//     const stylesheet: xml.xsltStylesheetPtr = xml.xsltParseStylesheetFile("../data/stylesheets/xslt/comments.xsl");
//     defer xml.xsltFreeStylesheet(stylesheet);
//     const result: xml.xmlDocPtr = xml.xsltApplyStylesheet(stylesheet, doc.doc, null);
//     defer xml.xmlFreeDoc(result);
//     var char: [*c]xml.xmlChar = undefined;
//     var len: c_int = 0;
//     xml.xmlDocDumpFormatMemory(result, &char, &len, 1);
//     const status = miniz.mz_zip_add_mem_to_archive_file_in_place("comments.docx", "word/document.xml", char, @intCast(len), null, 0, miniz.MZ_BEST_COMPRESSION);
//     try testing.expect(status == 1);
// }

// test "mapping" {
//     var dir = try std.fs.cwd().openDir("../data/stylesheets/Mapping/Mapping table", .{ .iterate = true });
//     defer dir.close();
//     var walker = try dir.walk(testing.allocator);
//     defer walker.deinit();
//     while (try walker.next()) |entry| {
//         if (entry.kind == .file) {
//             const buf = try dir.readFileAlloc(testing.allocator, entry.path, 100_000_000);
//             const status = miniz.mz_zip_add_mem_to_archive_file_in_place("mapping.docx", entry.path, @ptrCast(buf), buf.len, null, 0, miniz.MZ_BEST_COMPRESSION);
//             try testing.expect(status == 1);
//             testing.allocator.free(buf);
//         }
//     }
//     const session = try Session.init(testing.allocator);
//     defer session.deinit();
//     const doc = try Document.load(session, "../data/examples/FA313 Premier and Cabinet 2025.xml");
//     defer doc.deinit();
//     xml.exsltCommonRegister();
//     const stylesheet: xml.xsltStylesheetPtr = xml.xsltParseStylesheetFile("../data/stylesheets/xslt/mapping.xsl");
//     defer xml.xsltFreeStylesheet(stylesheet);
//     const result: xml.xmlDocPtr = xml.xsltApplyStylesheet(stylesheet, doc.doc, null);
//     defer xml.xmlFreeDoc(result);
//     var char: [*c]xml.xmlChar = undefined;
//     var len: c_int = 0;
//     xml.xmlDocDumpFormatMemory(result, &char, &len, 1);
//     const status = miniz.mz_zip_add_mem_to_archive_file_in_place("mapping.docx", "word/document.xml", char, @intCast(len), null, 0, miniz.MZ_BEST_COMPRESSION);
//     try testing.expect(status == 1);
// }

// test "index" {
//     var dir = try std.fs.cwd().openDir("../data/stylesheets/Index/Index", .{ .iterate = true });
//     defer dir.close();
//     var walker = try dir.walk(testing.allocator);
//     defer walker.deinit();
//     while (try walker.next()) |entry| {
//         if (entry.kind == .file) {
//             const buf = try dir.readFileAlloc(testing.allocator, entry.path, 100_000_000);
//             const status = miniz.mz_zip_add_mem_to_archive_file_in_place("index.docx", entry.path, @ptrCast(buf), buf.len, null, 0, miniz.MZ_BEST_COMPRESSION);
//             try testing.expect(status == 1);
//             testing.allocator.free(buf);
//         }
//     }
//     const session = try Session.init(testing.allocator);
//     defer session.deinit();
//     const doc = try Document.load(session, "../data/examples/FA313 Premier and Cabinet 2025.xml");
//     defer doc.deinit();
//     xml.exsltCommonRegister();
//     const stylesheet: xml.xsltStylesheetPtr = xml.xsltParseStylesheetFile("../data/stylesheets/xslt/index.xsl");
//     defer xml.xsltFreeStylesheet(stylesheet);
//     const result: xml.xmlDocPtr = xml.xsltApplyStylesheet(stylesheet, doc.doc, null);
//     defer xml.xmlFreeDoc(result);
//     var char: [*c]xml.xmlChar = undefined;
//     var len: c_int = 0;
//     xml.xmlDocDumpFormatMemory(result, &char, &len, 1);
//     const status = miniz.mz_zip_add_mem_to_archive_file_in_place("index.docx", "word/document.xml", char, @intCast(len), null, 0, miniz.MZ_BEST_COMPRESSION);
//     xml.xmlFree.?(char);
//     const header_stylesheet: xml.xsltStylesheetPtr = xml.xsltParseStylesheetFile("../data/stylesheets/xslt/index_header.xsl");
//     defer xml.xsltFreeStylesheet(header_stylesheet);
//     const header_result: xml.xmlDocPtr = xml.xsltApplyStylesheet(header_stylesheet, doc.doc, null);
//     defer xml.xmlFreeDoc(header_result);
//     var header_char: [*c]xml.xmlChar = undefined;
//     var header_len: c_int = 0;
//     xml.xmlDocDumpFormatMemory(header_result, &header_char, &header_len, 1);
//     _ = miniz.mz_zip_add_mem_to_archive_file_in_place("index.docx", "word/header1.xml", header_char, @intCast(header_len), null, 0, miniz.MZ_BEST_COMPRESSION);
//     xml.xmlFree.?(header_char);
//     try testing.expect(status == 1);
// }

test "draft" {
    var dir = try std.fs.cwd().openDir("../data/stylesheets/Draft/Draft Authority", .{ .iterate = true });
    defer dir.close();
    var walker = try dir.walk(testing.allocator);
    defer walker.deinit();
    while (try walker.next()) |entry| {
        if (entry.kind == .file) {
            const buf = try dir.readFileAlloc(testing.allocator, entry.path, 100_000_000);
            const status = miniz.mz_zip_add_mem_to_archive_file_in_place("draft.docx", entry.path, @ptrCast(buf), buf.len, null, 0, miniz.MZ_BEST_COMPRESSION);
            try testing.expect(status == 1);
            testing.allocator.free(buf);
        }
    }
    const session = try Session.init(testing.allocator);
    defer session.deinit();
    const doc = try Document.load(session, "../data/examples/FA313 Premier and Cabinet 2025.xml");
    defer doc.deinit();
    // xml.exsltCommonRegister();
    // const stylesheet: xml.xsltStylesheetPtr = xml.xsltParseStylesheetFile("../data/stylesheets/xslt/index.xsl");
    // defer xml.xsltFreeStylesheet(stylesheet);
    // const result: xml.xmlDocPtr = xml.xsltApplyStylesheet(stylesheet, doc.doc, null);
    // defer xml.xmlFreeDoc(result);
    // var char: [*c]xml.xmlChar = undefined;
    // var len: c_int = 0;
    // xml.xmlDocDumpFormatMemory(result, &char, &len, 1);
    // const status = miniz.mz_zip_add_mem_to_archive_file_in_place("index.docx", "word/document.xml", char, @intCast(len), null, 0, miniz.MZ_BEST_COMPRESSION);
    // xml.xmlFree.?(char);
    // const header_stylesheet: xml.xsltStylesheetPtr = xml.xsltParseStylesheetFile("../data/stylesheets/xslt/index_header.xsl");
    // defer xml.xsltFreeStylesheet(header_stylesheet);
    // const header_result: xml.xmlDocPtr = xml.xsltApplyStylesheet(header_stylesheet, doc.doc, null);
    // defer xml.xmlFreeDoc(header_result);
    // var header_char: [*c]xml.xmlChar = undefined;
    // var header_len: c_int = 0;
    // xml.xmlDocDumpFormatMemory(header_result, &header_char, &header_len, 1);
    // _ = miniz.mz_zip_add_mem_to_archive_file_in_place("index.docx", "word/header1.xml", header_char, @intCast(header_len), null, 0, miniz.MZ_BEST_COMPRESSION);
    // xml.xmlFree.?(header_char);
    // try testing.expect(status == 1);
}
