const std = @import("std");
const tree = @import("tree.zig");
const xml = @import("xml");

fn pos(haystack: []const []const u8, needle: []const u8) usize {
    for (haystack, 0..) |val, idx| {
        if (std.mem.eql(u8, val, needle)) return idx;
    }
    return haystack.len;
}

// insert node before its next sibling, or as a child if no sibling
pub fn orderedInsert(parent: xml.xmlNodePtr, nt: tree.NodeType, node: xml.xmlNodePtr) xml.xmlNodePtr {
    const sibling = followingSibling(parent, nt, std.mem.span(node.*.name)) orelse {
        return xml.xmlAddChild(parent, node);
    };
    return xml.xmlAddPrevSibling(sibling, node);
}

// ensures correct positioning of elements
pub fn followingSibling(parent: xml.xmlNodePtr, nt: tree.NodeType, el: []const u8) ?xml.xmlNodePtr {
    if (nt == .None) return null;
    const elements = switch (nt) {
        .Authority => authorityElements[0..],
        .Context => contextElements[0..],
        .Term => termElements[0..],
        .Class => classElements[0..],
        .Disposal => disposalElements[0..],
        .Supersede => supersedeElements[0..],
        .SeeRef => seeRefElements[0..],
        .Draft => draftElements[0..],
        .Amended => amendedElements[0..],
        .Submitted => submittedElements[0..],
        .Applying => applyingElements[0..],
        .None => unreachable,
    };
    const elIdx = pos(elements, el);
    var current_node = xml.xmlFirstElementChild(parent);
    while (current_node != null) : (current_node = xml.xmlNextElementSibling(current_node)) {
        const cIdx = pos(elements, std.mem.span(current_node.*.name));
        if (cIdx > elIdx) return current_node;
    }
    return null;
}

// Constants to maintain element order
const authorityElements = [_][]const u8{
    "ID",
    "AuthorityTitle",
    "Scope",
    "DateRange",
    "Status",
    "LinkedTo",
    "Comment",
    "Context",
    "Term",
    "Class",
};

const contextElements = [_][]const u8{ "ContextTitle", "ContextContent", "Comment" };

const termElements = [_][]const u8{
    "ID",
    "TermTitle",
    "TermDescription",
    "DateRange",
    "Status",
    "LinkedTo", // multiple
    "Comment", // multiple
    "Term",
    "Class",
};

const classElements = [_][]const u8{
    "ID",
    "ClassTitle",
    "ClassDescription",
    "Disposal", // multiple
    "Justification",
    "DateRange",
    "Status",
    "LinkedTo", // multiple
    "Comment", // multiple
};

const disposalElements = [_][]const u8{
    "DisposalCondition",
    "RetentionPeriod",
    "DisposalTrigger",
    "DisposalAction",
    "TransferTo",
    "CustomAction",
    "CustomCustody",
};

const supersedeElements = [_][]const u8{
    "IDRef",
    "AuthorityTitleRef",
    "TermTitleRef", // multiple
    "ItemNoRef",
    "PartText",
    "Date",
};

const seeRefElements = [_][]const u8{
    "IDRef",
    "AuthorityTitleRef",
    "TermTitleRef", // multiple
    "ItemNoRef",
    "SeeText",
};

const draftElements = [_][]const u8{ "Agency", "Date" };

const amendedElements = [_][]const u8{ "Agency", "Date", "AmendmentNote" };

const submittedElements = [_][]const u8{ "Officer", "Position", "Agency", "Date" };

const applyingElements = [_][]const u8{ "Agency", "StartDate", "EndDate" };

// Same order as Authority DateType
pub const DateType = enum(u8) {
    start,
    end,

    pub fn toStr(dt: DateType) []const u8 {
        return switch (dt) {
            .start => "Start",
            .end => "End",
        };
    }
};

pub fn truthy(val: [*c]u8) bool {
    if (val == null) return false;
    const str = std.mem.span(val);
    if (str.len < 4) return false;
    if (std.ascii.toLower(str[0]) == 't') return true;
    return false;
}

pub const MultiType = enum(u8) {
    node,
    para,
    status,

    pub fn parentName(self: MultiType, el: xml.xmlNodePtr) ?[]const u8 {
        switch (self) {
            .node => {},
            .para => {
                if (tree.equals(el.*.name, "Context")) return "ContextContent";
                if (tree.equals(el.*.name, "Term")) return "TermDescription";
                if (tree.equals(el.*.name, "Class")) return "ClassDescription";
            },
            .status => return "Status",
        }
        return null;
    }

    pub fn parent(self: MultiType, el: xml.xmlNodePtr) ?xml.xmlNodePtr {
        switch (self) {
            .node => return el,
            else => return tree.childN(el, parentName(self, el).?, 0),
        }
    }

    pub fn fromName(name: []const u8) MultiType {
        if (StatusType.fromName(name) != .none) return .status;
        if (std.mem.eql(u8, name, "SeeReference") or std.mem.eql(u8, name, "Source")) return .para;
        if (std.mem.eql(u8, name, "Status")) return .status;
        return .node;
    }

    // used in multiset and multiget functions to find the parent elements for nested attributes
    pub fn elementName(self: MultiType, attr: []const u8) ?[]const u8 {
        if (std.mem.eql(u8, "unit", attr)) return "RetentionPeriod";
        if (std.mem.eql(u8, "control", attr)) {
            if (self == .node) return null;
            return "IDRef";
        }
        if (std.mem.eql(u8, "agencyno", attr)) return "Agency";
        return null;
    }
};

// Same order as Authority StatusType
pub const StatusType = enum(u8) {
    none,
    draft,
    submitted,
    approved,
    issued,
    applying,
    partsupersedes,
    supersedes,
    partsupersededby,
    supersededby,
    amended,
    review,
    expired,
    revoked,

    pub fn fromName(name: []const u8) StatusType {
        if (std.mem.eql(u8, name, "Draft")) return .draft;
        if (std.mem.eql(u8, name, "Submitted")) return .submitted;
        if (std.mem.eql(u8, name, "Approved")) return .approved;
        if (std.mem.eql(u8, name, "Issued")) return .issued;
        if (std.mem.eql(u8, name, "Applying")) return .applying;
        if (std.mem.eql(u8, name, "PartSupersedes")) return .partsupersedes;
        if (std.mem.eql(u8, name, "Supersedes")) return .supersedes;
        if (std.mem.eql(u8, name, "PartSupersededBy")) return .partsupersededby;
        if (std.mem.eql(u8, name, "SupersededBy")) return .supersededby;
        if (std.mem.eql(u8, name, "Amended")) return .amended;
        if (std.mem.eql(u8, name, "Review")) return .review;
        if (std.mem.eql(u8, name, "Expired")) return .expired;
        if (std.mem.eql(u8, name, "Revoked")) return .revoked;
        return .none;
    }
};

// Same order as Authority SeeRefType
pub const SeeRefType = enum(u8) {
    none,
    local,
    ga28,
    other,
};
