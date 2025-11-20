# XSL transforms and XSD validation for authority editor

This is a helper library to support authority editor. It is a zig wrapper over libxml's xslt and xsd functionality.

# Building

## WASM

zig build -Dtarget=wasm32-wasi (test with wasmtime) // broken - switch to emscripten [https://github.com/ziglang/zig/issues/10836#issuecomment-1951538464] or https://ziggit.dev/t/how-do-i-access-emitted-object-files-in-the-build-system/6231/8

zig build -Doptimize=ReleaseFast