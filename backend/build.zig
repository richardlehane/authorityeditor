const std = @import("std");

const LIBXML2_VERSION = "2.13.5";
const LIBXML2_VERSION_NUMBER = 21305;
const LIBXSLT_VERSION = "1.1.42";
const LIBXSLT_VERSION_NUMBER = 10142;

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const libxml2_dep = b.dependency("libxml2", .{});
    const libxslt_dep = b.dependency("libxslt", .{});
    const miniz_dep = b.dependency("miniz", .{});

    const xmlversion_h = b.addConfigHeader(.{
        .style = .{ .cmake = libxml2_dep.path("include/libxml/xmlversion.h.in") },
        .include_path = "libxml/xmlversion.h",
    }, .{
        .VERSION = LIBXML2_VERSION,
        .LIBXML_VERSION_NUMBER = LIBXML2_VERSION_NUMBER,
        .LIBXML_VERSION_EXTRA = "",
        .WITH_THREADS = false,
        .WITH_THREAD_ALLOC = false,
        .WITH_TREE = true,
        .WITH_OUTPUT = true,
        .WITH_PUSH = false,
        .WITH_READER = false,
        .WITH_PATTERN = true,
        .WITH_WRITER = false,
        .WITH_SAX1 = false,
        .WITH_FTP = false,
        .WITH_HTTP = false,
        .WITH_VALID = false,
        .WITH_HTML = true,
        .WITH_LEGACY = false,
        .WITH_C14N = false,
        .WITH_CATALOG = false,
        .WITH_XPATH = true,
        .WITH_XPTR = false,
        .WITH_XPTR_LOCS = false,
        .WITH_XINCLUDE = false,
        .WITH_ICONV = false,
        .WITH_ICU = false,
        .WITH_ISO8859X = false,
        .WITH_DEBUG = false,
        .WITH_REGEXPS = true,
        .WITH_SCHEMAS = true,
        .WITH_SCHEMATRON = false,
        .WITH_MODULES = false,
        .MODULE_EXTENSION = target.result.dynamicLibSuffix(),
        .WITH_ZLIB = false,
        .WITH_LZMA = false,
    });

    const libxml2_config_h = b.addConfigHeader(.{
        .style = .{ .cmake = libxml2_dep.path("config.h.cmake.in") },
    }, .{
        .ATTRIBUTE_DESTRUCTOR = "__attribute__((destructor))",
        .HAVE_ARPA_INET_H = true,
        .HAVE_ATTRIBUTE_DESTRUCTOR = true,
        .HAVE_DLFCN_H = true,
        .HAVE_DLOPEN = true,
        .HAVE_DL_H = false,
        .HAVE_FCNTL_H = true,
        .HAVE_FTIME = true,
        .HAVE_GETENTROPY = false,
        .HAVE_GETTIMEOFDAY = true,
        .HAVE_LIBHISTORY = false,
        .HAVE_LIBREADLINE = false,
        .HAVE_MMAP = true,
        .HAVE_MUNMAP = true,
        .HAVE_NETDB_H = true,
        .HAVE_NETINET_IN_H = true,
        .HAVE_POLL_H = true,
        .HAVE_PTHREAD_H = true,
        .HAVE_SHLLOAD = false,
        .HAVE_STAT = true,
        .HAVE_STDINT_H = true,
        .HAVE_SYS_MMAN_H = true,
        .HAVE_SYS_RANDOM_H = true,
        .HAVE_SYS_SELECT_H = true,
        .HAVE_SYS_SOCKET_H = true,
        .HAVE_SYS_STAT_H = true,
        .HAVE_SYS_TIMEB_H = true,
        .HAVE_SYS_TIME_H = true,
        .HAVE_UNISTD_H = true,
        .HAVE_VA_COPY = true,
        .HAVE_ZLIB_H = false,
        .HAVE___VA_COPY = true,
        .SUPPORT_IP6 = false,
        .VERSION = LIBXML2_VERSION,
        .XML_SOCKLEN_T = "socklen_t",
        .XML_THREAD_LOCAL = null,
    });

    var libxml2_sources: std.ArrayList([]const u8) = .empty;
    libxml2_sources.appendSlice(b.allocator, &.{
        "buf.c",
        "chvalid.c",
        "dict.c",
        "entities.c",
        "encoding.c",
        "error.c",
        "globals.c",
        "hash.c",
        "list.c",
        "parser.c",
        "parserInternals.c",
        "SAX2.c",
        "threads.c",
        "tree.c",
        "uri.c",
        "valid.c",
        "xmlIO.c",
        "xmlmemory.c",
        "xmlstring.c",
        "pattern.c",
        "xmlregexp.c",
        "xmlunicode.c",
        "relaxng.c",
        "xmlschemas.c",
        "xmlschemastypes.c",
        "xpath.c",
        "HTMLparser.c",
        "HTMLtree.c",
        "xmlsave.c",
    }) catch @panic("OOM");
    const libxml2_cflags: []const []const u8 = &.{
        "-DLIBXML_STATIC",
        "-pedantic",
        "-Wall",
        "-Wextra",
        "-Wshadow",
        "-Wpointer-arith",
        "-Wcast-align",
        "-Wwrite-strings",
        "-Wstrict-prototypes",
        "-Wmissing-prototypes",
        "-Wno-long-long",
        "-Wno-format-extra-args",
    };

    const libxslt_config_h = b.addConfigHeader(.{
        .style = .{ .cmake = libxslt_dep.path("config.h.cmake.in") },
    }, .{
        .HAVE_CLOCK_GETTIME = true,
        .HAVE_FTIME = true,
        .HAVE_GCRYPT = false,
        .HAVE_GETTIMEOFDAY = true,
        .HAVE_GMTIME_R = true,
        .HAVE_LIBPTHREAD = false,
        .HAVE_LOCALE_H = true,
        .HAVE_LOCALTIME_R = true,
        .HAVE_PTHREAD_H = false,
        .HAVE_SNPRINTF = true,
        .HAVE_STAT = true,
        .HAVE_STRXFRM_L = false, // LOCALE issues on windows
        .HAVE_SYS_SELECT_H = true,
        .HAVE_SYS_STAT_H = true,
        .HAVE_SYS_TIMEB_H = true,
        .HAVE_SYS_TIME_H = true,
        .HAVE_SYS_TYPES_H = true,
        .HAVE_UNISTD_H = true,
        .HAVE_VSNPRINTF = true,
        .HAVE_XLOCALE_H = false,
        .HAVE__STAT = false,
        .LT_OBJDIR = ".libs/",
        .PACKAGE = "libxslt",
        .PACKAGE_BUGREPORT = "xml@gnome.org",
        .PACKAGE_NAME = "libxslt",
        .PACKAGE_STRING = "libxslt " ++ LIBXSLT_VERSION,
        .PACKAGE_TARNAME = "libxslt",
        .PACKAGE_URL = "https://gitlab.gnome.org/GNOME/libxslt",
        .PACKAGE_VERSION = LIBXSLT_VERSION,
        .VERSION = LIBXSLT_VERSION,
    });

    const xsltconfig_h = b.addConfigHeader(.{
        .style = .{ .cmake = libxslt_dep.path("libxslt/xsltconfig.h.in") },
        .include_path = "libxslt/xsltconfig.h",
    }, .{
        .VERSION = "1.1.42",
        .LIBXSLT_VERSION_NUMBER = 10142,
        .LIBXSLT_VERSION_EXTRA = "",
        .WITH_XSLT_DEBUG = false,
        .WITH_MEM_DEBUG = false,
        .WITH_TRIO = false,
        .WITH_DEBUGGER = false,
        .WITH_PROFILER = false,
        .WITH_MODULES = false,
        .LIBXSLT_DEFAULT_PLUGINS_PATH = "",
    });

    const libxslt_cflags: []const []const u8 = &.{
        "-DLIBXML_STATIC",
        "-DLIBEXSLT_STATIC",
        "-DLIBXSLT_STATIC",
        "-Wall",
        "-Wextra",
        "-Wshadow",
        "-Wpointer-arith",
        "-Wcast-align",
        "-Wwrite-strings",
        "-Waggregate-return",
        "-Wstrict-prototypes",
        "-Wmissing-prototypes",
        "-Wnested-externs",
        "-Winline",
        "-Wredundant-decls",
    };
    var libxslt_sources: std.ArrayList([]const u8) = .empty;
    libxslt_sources.appendSlice(b.allocator, &.{
        "attrvt.c",
        "xslt.c",
        "xsltlocale.c",
        "xsltutils.c",
        "pattern.c",
        "templates.c",
        "variables.c",
        "keys.c",
        "numbers.c",
        "extensions.c",
        "extra.c",
        "functions.c",
        "namespaces.c",
        "imports.c",
        "attributes.c",
        "documents.c",
        "preproc.c",
        "transform.c",
        "security.c",
    }) catch @panic("OOM");

    const libexslt_exsltconfig_h = b.addConfigHeader(.{
        .style = .{ .cmake = libxslt_dep.path("libexslt/exsltconfig.h.in") },
        .include_path = "libexslt/exsltconfig.h",
    }, .{
        .LIBEXSLT_VERSION = LIBXSLT_VERSION,
        .LIBEXSLT_VERSION_NUMBER = LIBXSLT_VERSION_NUMBER,
        .LIBEXSLT_VERSION_EXTRA = "",
        .WITH_CRYPTO = false,
    });

    var libexslt_sources: std.ArrayList([]const u8) = .empty;
    libexslt_sources.appendSlice(b.allocator, &.{
        "exslt.c",
        "common.c",
        "crypto.c",
        "math.c",
        "sets.c",
        "functions.c",
        "strings.c",
        "date.c",
        "saxon.c",
        "dynamic.c",
    }) catch @panic("OOM");

    const translate_c = b.addTranslateC(.{
        .root_source_file = b.path("xml.h"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });
    translate_c.addIncludePath(libxml2_dep.path("include"));
    translate_c.addIncludePath(libxslt_dep.path("."));
    translate_c.addConfigHeader(xsltconfig_h);
    translate_c.addConfigHeader(xmlversion_h);
    translate_c.addConfigHeader(libexslt_exsltconfig_h);

    const xml_mod = translate_c.createModule();
    xml_mod.addIncludePath(libxml2_dep.path("include"));
    xml_mod.addIncludePath(libxslt_dep.path("."));
    xml_mod.addConfigHeader(xmlversion_h);
    xml_mod.addConfigHeader(libxml2_config_h);
    xml_mod.addConfigHeader(libxslt_config_h);
    xml_mod.addConfigHeader(xsltconfig_h);
    xml_mod.addConfigHeader(libexslt_exsltconfig_h);
    xml_mod.addCSourceFiles(.{
        .root = libxml2_dep.path("."),
        .files = libxml2_sources.items,
        .flags = libxml2_cflags,
    });
    xml_mod.addCSourceFiles(.{
        .root = libxslt_dep.path("libxslt"),
        .files = libxslt_sources.items,
        .flags = libxslt_cflags,
    });
    xml_mod.addCSourceFiles(.{
        .root = libxslt_dep.path("libexslt"),
        .files = libexslt_sources.items,
        .flags = libxslt_cflags,
    });

    if (target.result.os.tag == .windows) {
        xml_mod.linkSystemLibrary("bcrypt", .{});
    }

    const miniz_translate_c = b.addTranslateC(.{
        .root_source_file = miniz_dep.path("miniz.h"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });
    const miniz_mod = miniz_translate_c.createModule();
    miniz_mod.addCSourceFile(.{
        .file = miniz_dep.path("miniz.c"),
    });

    const lib_mod = b.createModule(.{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });
    lib_mod.addImport("xml", xml_mod);
    lib_mod.addImport("miniz", miniz_mod);
    lib_mod.addAnonymousImport("rda_schema", .{ .root_source_file = b.path("../frontend/assets/SRNSW_RDA_permissive.xsd") });

    const lib = b.addLibrary(.{
        .linkage = .dynamic,
        .name = "authority",
        .root_module = lib_mod,
    });
    b.installArtifact(lib);

    const lib_unit_tests = b.addTest(.{
        .root_module = lib_mod,
    });

    const run_lib_unit_tests = b.addRunArtifact(lib_unit_tests);

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_lib_unit_tests.step);
}
