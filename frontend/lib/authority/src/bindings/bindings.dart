import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'dart:io' show Directory;
import 'package:path/path.dart' as path;

final libraryPath = path.join(Directory.current.path, 'authority.dll');

final class Payload extends Struct {
  @Int32()
  external int length;
  external Pointer<Uint8> data;
}

typedef FreeStrNative = Void Function(Pointer<Utf8>);
typedef FreeStr = void Function(Pointer<Utf8>);
typedef ValidNative = Bool Function(Uint8);
typedef Valid = bool Function(int);
typedef TransformNative = Void Function(Uint8, Pointer<Utf8>, Pointer<Utf8>);
typedef Transform = void Function(int, Pointer<Utf8>, Pointer<Utf8>);
typedef EditNative = Bool Function(Uint8, Pointer<Utf8>);
typedef Edit = bool Function(int, Pointer<Utf8>);
typedef EmptyNative = Uint8 Function();
typedef Empty = int Function();
typedef LoadNative = Uint8 Function(Pointer<Utf8>);
typedef Load = int Function(Pointer<Utf8>);
typedef TreeNative = Payload Function(Uint8);
typedef Tree = Payload Function(int);
typedef AsStrNative = Pointer<Utf8> Function(Uint8);
typedef AsStr = Pointer<Utf8> Function(int);
typedef SetCurrentNative = Void Function(Uint8, Uint8, Uint16);
typedef SetCurrent = void Function(int, int, int);
typedef DropNodeNative = Void Function(Uint8, Uint8, Uint16);
typedef DropNode = void Function(int, int, int);
typedef AddChildNative = Void Function(Uint8, Uint8, Uint8, Uint16);
typedef AddChild = void Function(int, int, int, int);
typedef AddSiblingNative = Void Function(Uint8, Uint8, Uint8, Uint16);
typedef AddSibling = void Function(int, int, int, int);
typedef MoveUpNative = Bool Function(Uint8, Uint8, Uint16);
typedef MoveUp = bool Function(int, int, int);
typedef MoveDownNative = Bool Function(Uint8, Uint8, Uint16);
typedef MoveDown = bool Function(int, int, int);
typedef GetTypeNative = Uint8 Function(Uint8);
typedef GetType = int Function(int);
typedef GetNative = Pointer<Utf8> Function(Uint8, Pointer<Utf8>);
typedef Get = Pointer<Utf8> Function(int, Pointer<Utf8>);
typedef GetDateNative = Pointer<Utf8> Function(Uint8, Uint8);
typedef GetDate = Pointer<Utf8> Function(int, int);
typedef GetCircaNative = Bool Function(Uint8, Uint8);
typedef GetCirca = bool Function(int, int);
typedef SetNative = Void Function(Uint8, Pointer<Utf8>, Pointer<Utf8>);
typedef Set = void Function(int, Pointer<Utf8>, Pointer<Utf8>);
typedef SetDateNative = Void Function(Uint8, Uint8, Pointer<Utf8>);
typedef SetDate = void Function(int, int, Pointer<Utf8>);
typedef SetCircaNative = Void Function(Uint8, Uint8, Bool);
typedef SetCirca = void Function(int, int, bool);
typedef GetParagraphsNative = Payload Function(Uint8, Pointer<Utf8>);
typedef GetParagraphs = Payload Function(int, Pointer<Utf8>);
typedef SetParagraphsNative =
    Void Function(Uint8, Pointer<Utf8>, Uint16, Pointer<Utf8>);
typedef SetParagraphs = void Function(int, Pointer<Utf8>, int, Pointer<Utf8>);
typedef MultiLenNative = Uint16 Function(Uint8, Pointer<Utf8>);
typedef MultiLen = int Function(int, Pointer<Utf8>);
typedef MultiEmptyNative = Bool Function(Uint8, Pointer<Utf8>, Uint16);
typedef MultiEmpty = bool Function(int, Pointer<Utf8>, int);
typedef MultiStatusTypeNative = Uint8 Function(Uint8, Uint16);
typedef MultiStatusType = int Function(int, int);
typedef MultiSeeRefTypeNative = Uint8 Function(Uint8, Uint16);
typedef MultiSeeRefType = int Function(int, int);
typedef MultiAddNative = Uint16 Function(Uint8, Pointer<Utf8>, Pointer<Utf8>);
typedef MultiAdd = int Function(int, Pointer<Utf8>, Pointer<Utf8>);
typedef MultiAddSeeRefNative = Void Function(Uint8, Uint8);
typedef MultiAddSeeRef = void Function(int, int);
typedef MultiDropNative = Void Function(Uint8, Pointer<Utf8>, Uint16);
typedef MultiDrop = void Function(int, Pointer<Utf8>, int);
typedef MultiUpNative = Void Function(Uint8, Pointer<Utf8>, Uint16);
typedef MultiUp = void Function(int, Pointer<Utf8>, int);
typedef MultiDownNative = Void Function(Uint8, Pointer<Utf8>, Uint16);
typedef MultiDown = void Function(int, Pointer<Utf8>, int);
typedef MultiGetNative =
    Pointer<Utf8> Function(Uint8, Pointer<Utf8>, Uint16, Pointer<Utf8>);
typedef MultiGet =
    Pointer<Utf8> Function(int, Pointer<Utf8>, int, Pointer<Utf8>);
typedef MultiSetNative =
    Void Function(Uint8, Pointer<Utf8>, Uint16, Pointer<Utf8>, Pointer<Utf8>);
typedef MultiSet =
    void Function(int, Pointer<Utf8>, int, Pointer<Utf8>, Pointer<Utf8>);
typedef MultiGetParagraphsNative =
    Payload Function(Uint8, Pointer<Utf8>, Uint16, Pointer<Utf8>);
typedef MultiGetParagraphs =
    Payload Function(int, Pointer<Utf8>, int, Pointer<Utf8>);
typedef MultiSetParagraphsNative =
    Void Function(
      Uint8,
      Pointer<Utf8>,
      Uint16,
      Pointer<Utf8>,
      Uint16,
      Pointer<Utf8>,
    );
typedef MultiSetParagraphs =
    void Function(int, Pointer<Utf8>, int, Pointer<Utf8>, int, Pointer<Utf8>);
typedef TermsRefLenNative = Uint16 Function(Uint8, Pointer<Utf8>, Uint16);
typedef TermsRefLen = int Function(int, Pointer<Utf8>, int);
typedef TermsRefAddNative = Void Function(Uint8, Pointer<Utf8>, Uint16);
typedef TermsRefAdd = void Function(int, Pointer<Utf8>, int);
typedef TermsRefGetNative =
    Pointer<Utf8> Function(Uint8, Pointer<Utf8>, Uint16, Uint16);
typedef TermsRefGet = Pointer<Utf8> Function(int, Pointer<Utf8>, int, int);
typedef TermsRefSetNative =
    Void Function(Uint8, Pointer<Utf8>, Uint16, Uint16, Pointer<Utf8>);
typedef TermsRefSet =
    void Function(int, Pointer<Utf8>, int, int, Pointer<Utf8>);

final class Bindings {
  late FreeStr freeStr;
  late Valid valid;
  late Transform transform;
  late Edit edit;
  late AsStr asStr;
  late Empty empty;
  late Load load;
  late Tree tree;
  late SetCurrent setCurrent;
  late DropNode dropNode;
  late AddChild addChild;
  late AddSibling addSibling;
  late MoveUp moveUp;
  late MoveDown moveDown;
  late GetType getType;
  late Get get;
  late GetDate getDate;
  late GetCirca getCirca;
  late Set set;
  late SetDate setDate;
  late SetCirca setCirca;
  late GetParagraphs getParagraphs;
  late SetParagraphs setParagraphs;
  late MultiLen multiLen;
  late MultiEmpty multiEmpty;
  late MultiStatusType multiStatusType;
  late MultiSeeRefType multiSeeRefType;
  late MultiAdd multiAdd;
  late MultiAddSeeRef multiAddSeeRef;
  late MultiDrop multiDrop;
  late MultiUp multiUp;
  late MultiDown multiDown;
  late MultiGet multiGet;
  late MultiSet multiSet;
  late MultiGetParagraphs multiGetParagraphs;
  late MultiSetParagraphs multiSetParagraphs;
  late TermsRefLen termsRefLen;
  late TermsRefAdd termsRefAdd;
  late TermsRefSet termsRefSet;
  late TermsRefGet termsRefGet;

  Bindings() {
    final DynamicLibrary _dylib = DynamicLibrary.open(libraryPath);
    this.freeStr = _dylib.lookupFunction<FreeStrNative, FreeStr>('freeStr');
    this.valid = _dylib.lookupFunction<ValidNative, Valid>('valid');
    this.transform = _dylib.lookupFunction<TransformNative, Transform>(
      'transform',
    );
    this.edit = _dylib.lookupFunction<EditNative, Edit>('edit');
    this.empty = _dylib.lookupFunction<EmptyNative, Empty>('empty');
    this.load = _dylib.lookupFunction<LoadNative, Load>('load');
    this.asStr = _dylib.lookupFunction<AsStrNative, AsStr>('asStr');
    this.tree = _dylib.lookupFunction<TreeNative, Tree>('tree');
    this.setCurrent = _dylib.lookupFunction<SetCurrentNative, SetCurrent>(
      'setCurrent',
    );
    this.dropNode = _dylib.lookupFunction<DropNodeNative, DropNode>('dropNode');
    this.addChild = _dylib.lookupFunction<AddChildNative, AddChild>('addChild');
    this.addSibling = _dylib.lookupFunction<AddSiblingNative, AddSibling>(
      'addSibling',
    );
    this.moveUp = _dylib.lookupFunction<MoveUpNative, MoveUp>('moveUp');
    this.moveDown = _dylib.lookupFunction<MoveDownNative, MoveDown>('moveDown');
    this.getType = _dylib.lookupFunction<GetTypeNative, GetType>('getType');
    this.get = _dylib.lookupFunction<GetNative, Get>('get');
    this.getDate = _dylib.lookupFunction<GetDateNative, GetDate>('getDate');
    this.getCirca = _dylib.lookupFunction<GetCircaNative, GetCirca>('getCirca');
    this.set = _dylib.lookupFunction<SetNative, Set>('set');
    this.setDate = _dylib.lookupFunction<SetDateNative, SetDate>('setDate');
    this.setCirca = _dylib.lookupFunction<SetCircaNative, SetCirca>('setCirca');
    this.getParagraphs = _dylib
        .lookupFunction<GetParagraphsNative, GetParagraphs>('getParagraphs');
    this.setParagraphs = _dylib
        .lookupFunction<SetParagraphsNative, SetParagraphs>('setParagraphs');
    this.multiLen = _dylib.lookupFunction<MultiLenNative, MultiLen>('multiLen');
    this.multiEmpty = _dylib.lookupFunction<MultiEmptyNative, MultiEmpty>(
      'multiEmpty',
    );
    this.multiStatusType = _dylib
        .lookupFunction<MultiStatusTypeNative, MultiStatusType>(
          'multiStatusType',
        );
    this.multiSeeRefType = _dylib
        .lookupFunction<MultiSeeRefTypeNative, MultiSeeRefType>(
          'multiSeeRefType',
        );
    this.multiAdd = _dylib.lookupFunction<MultiAddNative, MultiAdd>('multiAdd');
    this.multiAddSeeRef = _dylib
        .lookupFunction<MultiAddSeeRefNative, MultiAddSeeRef>('multiAddSeeRef');
    this.multiDrop = _dylib.lookupFunction<MultiDropNative, MultiDrop>(
      'multiDrop',
    );
    this.multiUp = _dylib.lookupFunction<MultiUpNative, MultiUp>('multiUp');
    this.multiDown = _dylib.lookupFunction<MultiDownNative, MultiDown>(
      'multiDown',
    );
    this.multiGet = _dylib.lookupFunction<MultiGetNative, MultiGet>('multiGet');
    this.multiSet = _dylib.lookupFunction<MultiSetNative, MultiSet>('multiSet');
    this.multiGetParagraphs = _dylib
        .lookupFunction<MultiGetParagraphsNative, MultiGetParagraphs>(
          'multiGetParagraphs',
        );
    this.multiSetParagraphs = _dylib
        .lookupFunction<MultiSetParagraphsNative, MultiSetParagraphs>(
          'multiSetParagraphs',
        );
    this.termsRefLen = _dylib.lookupFunction<TermsRefLenNative, TermsRefLen>(
      'termsRefLen',
    );
    this.termsRefAdd = _dylib.lookupFunction<TermsRefAddNative, TermsRefAdd>(
      'termsRefAdd',
    );
    this.termsRefGet = _dylib.lookupFunction<TermsRefGetNative, TermsRefGet>(
      'termsRefGet',
    );
    this.termsRefSet = _dylib.lookupFunction<TermsRefSetNative, TermsRefSet>(
      'termsRefSet',
    );
  }
}
