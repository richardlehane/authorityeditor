const std = @import("std");
const testing = std.testing;
const Allocator = std.mem.Allocator;
const Document = @import("Document.zig");
const Session = @import("Session.zig");
const tree = @import("tree.zig");
const miniz = @import("miniz");
const xml = @import("xml");

const draftParams: [3]?[*:0]const u8 = .{ "atype", "'draft'", null };
const arParams: [3]?[*:0]const u8 = .{ "atype", "'ar'", null };

const docxType = enum(u8) {
    appraisalReport,
    approved,
    comments,
    draft,
    consultation,
    index,
    mapping,
    none,

    fn template(dt: docxType) []const u8 {
        return switch (dt) {
            .appraisalReport => "appraisal_report",
            .approved => "approved",
            .comments => "comments",
            .draft => "draft",
            .consultation => "draft",
            .index => "index",
            .mapping => "mapping",
            .none => "",
        };
    }

    fn params(dt: docxType) [*c][*c]const u8 {
        return switch (dt) {
            .appraisalReport => @ptrCast(@constCast(&arParams)),
            .draft => @ptrCast(@constCast(&draftParams)),
            else => null,
        };
    }
};

pub fn transform(doc: *Document, typ: u8, stylesheet_dir: []const u8, output_dir: []const u8, output_name: []const u8) !void {
    const t: docxType = @enumFromInt(typ);
    // create strings we'll need
    const output_path = try std.fs.path.joinZ(doc.session.allocator, &[_][]const u8{ output_dir, output_name });
    defer doc.session.allocator.free(output_path);
    const stylesheet_nm = try std.mem.concat(doc.session.allocator, u8, &[_][]const u8{ "word_", t.template(), ".xsl" });
    defer doc.session.allocator.free(stylesheet_nm);
    const stylesheet_path = try std.fs.path.joinZ(doc.session.allocator, &[_][]const u8{ stylesheet_dir, stylesheet_nm });
    defer doc.session.allocator.free(stylesheet_path);
    const templ = try std.mem.concat(doc.session.allocator, u8, &[_][]const u8{ t.template(), ".zip" });
    defer doc.session.allocator.free(templ);
    const rels = try std.mem.concat(doc.session.allocator, u8, &[_][]const u8{ t.template(), ".xml.rels" });
    defer doc.session.allocator.free(rels);
    const rels_path = try std.fs.path.joinZ(doc.session.allocator, &[_][]const u8{ stylesheet_dir, "docx", rels });
    defer doc.session.allocator.free(rels_path);
    // copy template
    const indir = try std.Io.Dir.openDirAbsolute(doc.session.io, stylesheet_dir, .{});
    const templ_dir = try indir.openDir(doc.session.io, "docx", .{});
    const outdir = try std.Io.Dir.openDirAbsolute(doc.session.io, output_dir, .{});
    try templ_dir.copyFile(templ, outdir, output_name, doc.session.io, .{});
    // create document.xml
    const result = stylesheetTransform(doc, t, stylesheet_path);
    const relations = try setRelations(doc.session.allocator, rels_path, result);
    insertDoc(relations, output_path, "word/_rels/document.xml.rels");
    xml.xmlFreeDoc(relations);
    insertDoc(result, output_path, "word/document.xml");
    xml.xmlFreeDoc(result);
    switch (t) {
        .draft => {
            try transformInsert(doc, t, stylesheet_dir, "word_header_contents.xsl", output_path, "word/header2.xml");
            try transformInsert(doc, t, stylesheet_dir, "word_header_contents_first.xsl", output_path, "word/header3.xml");
            try transformInsert(doc, t, stylesheet_dir, "word_header_authority.xsl", output_path, "word/header4.xml");
            try transformInsert(doc, t, stylesheet_dir, "word_header_authority_first.xsl", output_path, "word/header5.xml");
        },
        .consultation => {
            try transformInsert(doc, .draft, stylesheet_dir, "word_header_contents.xsl", output_path, "word/header2.xml");
            try transformInsert(doc, .draft, stylesheet_dir, "word_header_contents_first.xsl", output_path, "word/header3.xml");
            try transformInsert(doc, .draft, stylesheet_dir, "word_header_authority.xsl", output_path, "word/header4.xml");
            try transformInsert(doc, .draft, stylesheet_dir, "word_header_authority_first.xsl", output_path, "word/header5.xml");
        },
        .approved => {
            try transformInsert(doc, t, stylesheet_dir, "word_header_contents.xsl", output_path, "word/header2.xml");
            try transformInsert(doc, t, stylesheet_dir, "word_header_contents_first.xsl", output_path, "word/header3.xml");
            try transformInsert(doc, t, stylesheet_dir, "word_header_authority.xsl", output_path, "word/header4.xml");
            try transformInsert(doc, t, stylesheet_dir, "word_header_authority_first.xsl", output_path, "word/header5.xml");
        },
        .appraisalReport => {
            try transformInsert(doc, t, stylesheet_dir, "word_header_authority.xsl", output_path, "word/header2.xml");
            try transformInsert(doc, t, stylesheet_dir, "word_header_authority_first.xsl", output_path, "word/header3.xml");
            try transformInsert(doc, t, stylesheet_dir, "word_header_contents.xsl", output_path, "word/header4.xml");
            try transformInsert(doc, t, stylesheet_dir, "word_header_contents_first.xsl", output_path, "word/header5.xml");
        },
        .index => {
            try transformInsert(doc, t, stylesheet_dir, "word_header_index.xsl", output_path, "word/header1.xml");
        },
        else => {},
    }
}

fn transformInsert(doc: *Document, t: docxType, stylesheet_dir: []const u8, stylesheet_nm: []const u8, output_file: [:0]const u8, output_path: [:0]const u8) !void {
    const stylesheet_path = try std.fs.path.joinZ(doc.session.allocator, &[_][]const u8{ stylesheet_dir, stylesheet_nm });
    defer doc.session.allocator.free(stylesheet_path);
    const result = stylesheetTransform(doc, t, stylesheet_path);
    insertDoc(result, output_file, output_path);
    xml.xmlFreeDoc(result);
}

fn stylesheetTransform(doc: *Document, t: docxType, stylesheet_path: [:0]const u8) xml.xmlDocPtr {
    const stylesheet: xml.xsltStylesheetPtr = xml.xsltParseStylesheetFile(stylesheet_path.ptr);
    defer xml.xsltFreeStylesheet(stylesheet);
    const result: xml.xmlDocPtr = xml.xsltApplyStylesheet(stylesheet, doc.doc, t.params());
    return result;
}

fn insertDoc(doc: xml.xmlDocPtr, output_file: [:0]const u8, output_path: [:0]const u8) void {
    var char: [*c]xml.xmlChar = undefined;
    var len: c_int = 0;
    xml.xmlDocDumpFormatMemory(doc, &char, &len, 1);
    _ = miniz.mz_zip_add_mem_to_archive_file_in_place(output_file.ptr, output_path.ptr, char, @intCast(len), null, 0, miniz.MZ_BEST_COMPRESSION);
    xml.xmlFree.?(char);
}

fn setRelations(alloc: Allocator, rel_path: [:0]const u8, doc: xml.xmlDocPtr) !xml.xmlDocPtr {
    const rel_doc = xml.xmlReadFile(rel_path.ptr, "utf-8", xml.XML_PARSE_NOBLANKS | xml.XML_PARSE_RECOVER | xml.XML_PARSE_NOERROR | xml.XML_PARSE_NOWARNING);
    const rel_root = xml.xmlDocGetRootElement(rel_doc);
    const rel_ns = xml.xmlSearchNsByHref(rel_doc, rel_root, "http://schemas.openxmlformats.org/officeDocument/2006/relationships");
    const doc_root = xml.xmlDocGetRootElement(doc);
    const start_id = startId(rel_root);
    const links = try delve(alloc, doc_root);
    defer alloc.free(links);
    for (links, 0..) |node, idx| {
        const url = xml.xmlGetProp(node, "tooltip");
        const link_idx = linkIdx(links, std.mem.span(url)) orelse continue;
        const val = try std.fmt.allocPrintSentinel(alloc, "rId{d}", .{link_idx + start_id + 1}, 0);
        if (link_idx == idx) {
            const new_rel = xml.xmlNewDocNode(rel_doc, rel_ns, "Relationship", null);
            _ = xml.xmlSetProp(new_rel, "Id", val);
            _ = xml.xmlSetProp(new_rel, "Type", "http://schemas.openxmlformats.org/officeDocument/2006/relationships/hyperlink");
            _ = xml.xmlSetProp(new_rel, "Target", url);
            _ = xml.xmlSetProp(new_rel, "TargetMode", "External");
            _ = xml.xmlAddChild(rel_root, new_rel);
        }
        _ = xml.xmlSetProp(node, "r:id", val.ptr);
        alloc.free(val);
    }
    return rel_doc;
}

fn delve(alloc: Allocator, root: xml.xmlNodePtr) ![]xml.xmlNodePtr {
    var list: std.ArrayList(xml.xmlNodePtr) = .empty;
    try descend(alloc, &list, root);
    return list.toOwnedSlice(alloc);
}

fn descend(alloc: Allocator, list: *std.ArrayList(xml.xmlNodePtr), el: xml.xmlNodePtr) !void {
    if (el == null) return;
    var e = el;
    while (e != null) : (e = xml.xmlNextElementSibling(e)) {
        if (tree.equals(e.*.name, "hyperlink") and (xml.xmlHasProp(e, "anchor") == null) and (xml.xmlHasProp(e, "tooltip") != null)) {
            try list.append(alloc, e);
        }
        try descend(alloc, list, xml.xmlFirstElementChild(e));
    }
}

fn startId(root: xml.xmlNodePtr) u32 {
    var rel = xml.xmlFirstElementChild(root);
    var largest: u32 = 0;
    while (rel != null) : (rel = xml.xmlNextElementSibling(rel)) {
        const id_str = std.mem.span(xml.xmlGetProp(rel, "Id"));
        if (id_str.len < 4) continue;
        const id = std.fmt.parseInt(u32, id_str[3..], 10) catch 0;
        if (id > largest) largest = id;
    }
    return largest;
}

fn linkIdx(list: []xml.xmlNodePtr, link: []const u8) ?usize {
    for (list, 0..) |node, idx| {
        if (std.mem.eql(u8, link, std.mem.span(xml.xmlGetProp(node, "tooltip")))) {
            return idx;
        }
    }
    return 0;
}

// test "approved" {
//     std.fs.cwd().deleteFile("approved.docx") catch |err| {
//         try testing.expectEqual(error.FileNotFound, err);
//     };
//     const outdir = try std.fs.cwd().realpathAlloc(std.testing.allocator, ".");
//     defer std.testing.allocator.free(outdir);
//     const styledir = try std.fs.cwd().realpathAlloc(std.testing.allocator, "../frontend/assets/stylesheets");
//     defer std.testing.allocator.free(styledir);
//     const session = try Session.init(testing.io, testing.allocator);
//     defer session.deinit();
//     const idx = try session.load("../frontend/assets/SRNSW_example.xml");
//     const doc = session.get(idx);
//     try transform(doc, @intFromEnum(docxType.approved), styledir, outdir, "approved.docx");
// }
