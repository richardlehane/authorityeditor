import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'dart:typed_data';
import 'dart:io' show Platform, Directory;
import 'package:path/path.dart' as path;
import 'package:file_picker/file_picker.dart' show PlatformFile;
import 'package:xml/xml.dart' show XmlElement;
import '../../authority.dart'
    show NodeType, StatusType, SeeRefType, DateType, TreeNode, Ref, Counter;
import 'paragraph.dart';
import 'bindings.dart';
import 'tree.dart';

// this dir is created and cleared in main
final outputDir = path.join(Directory.systemTemp.path, "AuthorityEditor");

final stylesheetsDir = path.join(
  path.dirname(Platform.resolvedExecutable),
  "data",
  "flutter_assets",
  "assets",
  "stylesheets",
);

class Session {
  late Bindings _bindings;

  // singleton
  Session._() {
    _bindings = Bindings();
  }
  static final Session _instance = Session._();
  factory Session() => _instance;

  int load(PlatformFile file) {
    if (file.path == null) return -1;
    final Pointer<Utf8> p = file.path!.toNativeUtf8();
    final int result = _bindings.load(p);
    malloc.free(p);
    return result;
  }

  void unload(int index) {
    return _bindings.unload(index);
  }

  bool save(int index, String path) {
    final Pointer<Utf8> p = path.toNativeUtf8();
    final success = _bindings.save(index, p);
    malloc.free(p);
    return success;
  }

  int empty() => _bindings.empty();

  List<TreeNode> tree(int index, Counter ctr) {
    final payload = _bindings.tree(index);
    return asTree(payload.data.asTypedList(payload.length), ctr);
  }

  bool valid(int index) => _bindings.valid(index);

  bool edit(int index, String stylesheet) {
    final stylesheetAbs = path.join(stylesheetsDir, stylesheet);
    final Pointer<Utf8> s = stylesheetAbs.toNativeUtf8();
    final bool result = _bindings.edit(index, s);
    malloc.free(s);
    return result;
  }

  void docx(int index, int typ, String outputdir, String outputname) {
    final Pointer<Utf8> s = stylesheetsDir.toNativeUtf8();
    final Pointer<Utf8> d = outputdir.toNativeUtf8();
    final Pointer<Utf8> o = outputname.toNativeUtf8();
    _bindings.docx(index, typ, s, d, o);
    malloc.free(s);
    malloc.free(d);
    malloc.free(o);
  }

  void transform(int index, String stylesheet, String outpath) {
    final stylesheetAbs = path.join(stylesheetsDir, stylesheet);
    final Pointer<Utf8> s = stylesheetAbs.toNativeUtf8();
    final Pointer<Utf8> o = outpath.toNativeUtf8();
    _bindings.transform(index, s, o);
    malloc.free(s);
    malloc.free(o);
  }

  // pretty argument ignored by native binding, always pretty
  String asString(int index, bool pretty) {
    final messageUtf8 = _bindings.asStr(index);
    final message = messageUtf8.toDartString();
    _bindings.freeStr(messageUtf8);
    return message;
  }

  void setCurrent(int index, Ref ref) =>
      _bindings.setCurrent(index, ref.$1.index, ref.$2);

  void dropNode(int index, Ref ref) =>
      _bindings.dropNode(index, ref.$1.index, ref.$2);

  void copy(int index, Ref ref) => _bindings.copy(index, ref.$1.index, ref.$2);

  void pasteChild(int index, Ref ref) =>
      _bindings.pasteChild(index, ref.$1.index, ref.$2);

  void pasteSibling(int index, Ref ref) =>
      _bindings.pasteSibling(index, ref.$1.index, ref.$2);

  void addChild(int index, Ref ref, NodeType nt) =>
      _bindings.addChild(index, nt.index, ref.$1.index, ref.$2);

  void addSibling(int index, Ref ref, NodeType nt) =>
      _bindings.addSibling(index, nt.index, ref.$1.index, ref.$2);

  bool moveUp(int index, Ref ref) =>
      _bindings.moveUp(index, ref.$1.index, ref.$2);

  bool moveDown(int index, Ref ref) =>
      _bindings.moveDown(index, ref.$1.index, ref.$2);

  NodeType getType(int index) => NodeType.values[_bindings.getType(index)];

  String? get(int index, String name) {
    final Pointer<Utf8> n = name.toNativeUtf8();
    final resultUtf8 = _bindings.get(index, n);
    malloc.free(n);
    if (resultUtf8 == nullptr) return null;
    final result = resultUtf8.toDartString();
    _bindings.freeStr(resultUtf8);
    return result;
  }

  String? getDate(int index, DateType dt) {
    final resultUtf8 = _bindings.getDate(index, dt.index);
    if (resultUtf8 == nullptr) return null;
    final result = resultUtf8.toDartString();
    _bindings.freeStr(resultUtf8);
    return result;
  }

  bool getCirca(int index, DateType dt) => _bindings.getCirca(index, dt.index);

  void set(int index, String name, String? value) {
    final Pointer<Utf8> n = name.toNativeUtf8();
    if (value == null) {
      _bindings.set(index, n, nullptr);
    } else {
      final Pointer<Utf8> v = value.toNativeUtf8();
      _bindings.set(index, n, v);
      malloc.free(v);
    }
    malloc.free(n);
  }

  void setDate(int index, DateType dt, String? value) {
    if (value == null) {
      _bindings.setDate(index, dt.index, nullptr);
    } else {
      final Pointer<Utf8> v = value.toNativeUtf8();
      _bindings.setDate(index, dt.index, v);
      malloc.free(v);
    }
  }

  void setCirca(int index, DateType dt, bool value) =>
      _bindings.setCirca(index, dt.index, value);

  List<XmlElement>? getParagraphs(int index, String name) {
    final Pointer<Utf8> n = name.toNativeUtf8();
    final payload = _bindings.getParagraphs(index, n);
    malloc.free(n);
    if (payload.length == 0) return null;
    final paras = deserialiseParagraphs(
      payload.data.asTypedList(payload.length),
    );
    _bindings.freePayload(payload.length, payload.data);
    return paras;
  }

  void setParagraphs(int index, String name, List<XmlElement>? paras) {
    final Pointer<Utf8> n = name.toNativeUtf8();
    final byts = serialiseParagraphs(paras);
    if (byts == null) {
      _bindings.setParagraphs(index, n, 0, nullptr);
    } else {
      final Pointer<Uint8> p = calloc<Uint8>(byts.length);
      final Uint8List view = p.asTypedList(byts.length);
      view.setAll(0, byts);
      _bindings.setParagraphs(index, n, byts.length, p);
      malloc.free(p);
    }
    malloc.free(n);
  }

  int multiLen(int index, String name) {
    final Pointer<Utf8> n = name.toNativeUtf8();
    final ret = _bindings.multiLen(index, n);
    malloc.free(n);
    return ret;
  }

  bool multiEmpty(int index, String name, int idx) {
    final Pointer<Utf8> n = name.toNativeUtf8();
    final ret = _bindings.multiEmpty(index, n, idx);
    malloc.free(n);
    return ret;
  }

  int multiAdd(int index, String name, String? sub) {
    final Pointer<Utf8> n = name.toNativeUtf8();
    final Pointer<Utf8> s = (sub == null) ? nullptr : sub.toNativeUtf8();
    int ret = _bindings.multiAdd(index, n, s);
    malloc.free(n);
    malloc.free(s);
    return ret;
  }

  void multiAddSeeRef(int index, SeeRefType srt) =>
      _bindings.multiAddSeeRef(index, srt.index);

  void multiDrop(int index, String name, int idx) {
    final Pointer<Utf8> n = name.toNativeUtf8();
    _bindings.multiDrop(index, n, idx);
    malloc.free(n);
  }

  void multiUp(int index, String name, int idx) {
    final Pointer<Utf8> n = name.toNativeUtf8();
    _bindings.multiUp(index, n, idx);
    malloc.free(n);
  }

  void multiDown(int index, String name, int idx) {
    final Pointer<Utf8> n = name.toNativeUtf8();
    _bindings.multiDown(index, n, idx);
    malloc.free(n);
  }

  void multiSet(int index, String name, int idx, String? sub, String? val) {
    final Pointer<Utf8> n = name.toNativeUtf8();
    final Pointer<Utf8> s = (sub == null) ? nullptr : sub.toNativeUtf8();
    final Pointer<Utf8> v = (val == null) ? nullptr : val.toNativeUtf8();
    _bindings.multiSet(index, n, idx, s, v);
    malloc.free(n);
    malloc.free(s);
    malloc.free(v);
  }

  String? multiGet(int index, String name, int idx, String? sub) {
    final Pointer<Utf8> n = name.toNativeUtf8();
    final Pointer<Utf8> s = (sub == null) ? nullptr : sub.toNativeUtf8();
    final resultUtf8 = _bindings.multiGet(index, n, idx, s);
    malloc.free(n);
    malloc.free(s);
    if (resultUtf8 == nullptr) return null;
    final result = resultUtf8.toDartString();
    _bindings.freeStr(resultUtf8);
    return result;
  }

  List<XmlElement>? multiGetParagraphs(
    int index,
    String name,
    int idx,
    String? sub,
  ) {
    final Pointer<Utf8> n = name.toNativeUtf8();
    final Pointer<Utf8> s = (sub == null) ? nullptr : sub.toNativeUtf8();
    final payload = _bindings.multiGetParagraphs(index, n, idx, s);
    malloc.free(n);
    malloc.free(s);
    if (payload.length == 0) return null;
    final paras = deserialiseParagraphs(
      payload.data.asTypedList(payload.length),
    );
    _bindings.freePayload(payload.length, payload.data);
    return paras;
  }

  void multiSetParagraphs(
    int index,
    String name,
    int idx,
    String? sub,
    List<XmlElement>? paras,
  ) {
    final Pointer<Utf8> n = name.toNativeUtf8();
    final Pointer<Utf8> s = (sub == null) ? nullptr : sub.toNativeUtf8();
    final byts = serialiseParagraphs(paras);
    if (byts == null) {
      _bindings.multiSetParagraphs(index, n, idx, s, 0, nullptr);
    } else {
      final Pointer<Uint8> p = calloc<Uint8>(byts.length);
      final Uint8List view = p.asTypedList(byts.length);
      view.setAll(0, byts);
      _bindings.multiSetParagraphs(index, n, idx, s, byts.length, p);
      malloc.free(p);
    }
    malloc.free(n);
    malloc.free(s);
  }

  StatusType multiStatusType(int index, int idx) =>
      StatusType.values[_bindings.multiStatusType(index, idx)];

  SeeRefType multiSeeRefType(int index, int idx) =>
      SeeRefType.values[_bindings.multiSeeRefType(index, idx)];

  int termsRefLen(int index, String name, int idx) {
    final Pointer<Utf8> n = name.toNativeUtf8();
    final ret = _bindings.termsRefLen(index, n, idx);
    malloc.free(n);
    return ret;
  }

  void termsRefAdd(int index, String name, int idx) {
    final Pointer<Utf8> n = name.toNativeUtf8();
    _bindings.termsRefAdd(index, n, idx);
    malloc.free(n);
  }

  String? termsRefGet(int index, String name, int idx, int tidx) {
    final Pointer<Utf8> n = name.toNativeUtf8();
    final resultUtf8 = _bindings.termsRefGet(index, n, idx, tidx);
    malloc.free(n);
    if (resultUtf8 == nullptr) return null;
    final result = resultUtf8.toDartString();
    _bindings.freeStr(resultUtf8);
    return result;
  }

  void termsRefSet(int index, String name, int idx, int tidx, String? val) {
    final Pointer<Utf8> n = name.toNativeUtf8();
    final Pointer<Utf8> v = (val == null) ? nullptr : val.toNativeUtf8();
    _bindings.termsRefSet(index, n, idx, tidx, v);
    malloc.free(n);
    malloc.free(v);
  }
}
