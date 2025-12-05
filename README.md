# Authority Editor

Application to create and edit retention and diposal authorities in XML.

Implements State Records NSW's [xml schema for retention and disposal authorities](https://www.nsw.gov.au/nsw-government/recordkeeping/sentence-and-dispose/xml-schema).

# Install or try online

https://authorityeditor.com

# License

Apache version 2.0

# Building
## Prerequisites

zig 0.15.2
flutter

## Windows

From backend folder:

`zig build -Doptimize=ReleaseFast`

After rebuilding DLL, copy to \assets

From frontend folder

`flutter build windows`

## Build for MS store

dart run msix:create

## Web

From frontend folder:

`flutter build web --base-href "/nsw/"`

Copy build/web folder to sites/authorityeditor.com/nsw

# Developing

## Generators

Uses riverpod for state management. Run `dart run build_runner build` to regenerate providers.

## Tests

From backend folder, run `zig build test`

From frontend folder, run `flutter test`