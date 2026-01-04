const std = @import("std");
const testing = std.testing;
const Allocator = std.mem.Allocator;
const xml = @import("xml");

const header_template =
    \\<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
    \\<w:hdr xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
    \\  <w:p>
    \\    <w:pPr>
    \\      <w:pStyle w:val="Header" />
    \\    </w:pPr>
    \\    <w:r>
    \\      <w:t></w:t>
    \\    </w:r>
    \\  </w:p>
    \\</w:hdr>
;

fn writeHeader(val: [:0]const u8) []u8 {
    const h = xml.xmlReadMemory(header_template.ptr, @intCast(header_template.len), null, "utf-8", xml.XML_PARSE_NOBLANKS | xml.XML_PARSE_RECOVER | xml.XML_PARSE_NOERROR | xml.XML_PARSE_NOWARNING);
    defer xml.xmlFreeDoc(h);
    var el = xml.xmlDocGetRootElement(h);
    el = xml.xmlFirstElementChild(el);
    el = xml.xmlFirstElementChild(el);
    el = xml.xmlNextElementSibling(el);
    el = xml.xmlFirstElementChild(el);
    _ = xml.xmlNodeAddContent(el, val.ptr);
    var char: [*c]xml.xmlChar = undefined;
    var len: c_int = 0;
    xml.xmlDocDumpFormatMemory(h, &char, &len, 1);
    return std.mem.span(char);
}

test "header" {
    const expect =
        \\<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
        \\<w:hdr xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
        \\  <w:p>
        \\    <w:pPr>
        \\      <w:pStyle w:val="Header"/>
        \\    </w:pPr>
        \\    <w:r>
        \\      <w:t>te&amp;st</w:t>
        \\    </w:r>
        \\  </w:p>
        \\</w:hdr>
        \\
    ;
    const result = writeHeader("te&st");
    try testing.expectEqualStrings(expect, result);
    xml.xmlFree.?(result.ptr);
}
