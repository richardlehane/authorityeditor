# Authority Editor

Application to create and edit retention and diposal authorities in XML.

https://authorityeditor.com

# License

Apache version 2.0

# Building
## Prerequisites

zig 0.15.2
flutter

## Windows

From backend folder:

zig build `-Doptimize=ReleaseFast`

From frontend folder:

`flutter pub get`
`flutter build windows`


## Web

From frontend folder:

`flutter pub get`
`flutter build web --base-href "/nsw/"`

Copy build/web folder to sites/authorityeditor.com/nsw

git add .
git commit -m "fresh build"
git push origin main

# Developing

## Generators

Uses riverpod for state management. Run `dart run build_runner build` to regenerate providers.

## Tests

From backend folder, run `zig build test`

From frontend folder, run `flutter test`

## DLL locations

After rebuilding DLL, copy to locations:

.flutter\flutter\bin\cache\artifacts\engine\windows-x64
authorityeditor\frontend\build\windows\x64\runner\Release
authorityeditor\frontend\build\windows\x64\runner\Debug