import 'dart:convert';
import 'package:uuid/uuid.dart';
import 'package:fast_base58/fast_base58.dart';
import 'package:fluent_ui/fluent_ui.dart' show TreeViewItem;
import 'package:file_picker/file_picker.dart' show PlatformFile;
import 'package:path/path.dart' as p;
import 'dart:typed_data';
import 'session.dart';
import 'node.dart' show CurrentNode, NodeType;
import 'tree.dart';
import 'search.dart';

final uuid = Uuid();

enum View {
  edit,
  review,
  source;

  @override
  String toString() {
    switch (this) {
      case View.edit:
        return "edit";
      case View.review:
        return "review";
      case View.source:
        return "source";
    }
  }
}

class Document {
  String title;
  String? path;
  List<TreeViewItem>? treeItems;
  Search? query;
  int sessionIndex;
  int mutation;
  Ref selected;
  View view = View.edit;

  Document({
    required this.title,
    this.path,
    this.treeItems,
    this.sessionIndex = 0,
    this.mutation = 0,
    this.selected = (NodeType.termType, 0),
  });

  /// Create a new empty document model with default structure
  factory Document.empty({String title = 'Untitled'}) {
    Session sess = Session();
    final sessionIndex = sess.empty();
    return Document(
      title: title,
      treeItems: treeFrom(sess.tree(sessionIndex, Counter()), (
        NodeType.termType,
        0,
      )),
      sessionIndex: sessionIndex,
    );
  }

  factory Document.load(PlatformFile f) {
    Session sess = Session();
    final sessionIndex = sess.load(f);
    return Document(
      title: f.name,
      path: f.path,
      treeItems: treeFrom(sess.tree(sessionIndex, Counter()), (
        NodeType.termType,
        0,
      )),
      sessionIndex: sessionIndex,
    );
  }

  @override
  String toString([bool pretty = true]) {
    return Session().asString(sessionIndex, pretty);
  }

  void unload() {
    Session().unload(sessionIndex);
  }

  bool save() {
    if (path == null) return false;
    return Session().save(sessionIndex, path!);
  }

  bool saveAs(String? sp) {
    if (sp == null) return false;
    if (p.extension(sp).isEmpty) sp += ".xml";
    path = sp;
    return save();
  }

  Uint8List bytes() {
    return utf8.encode(toString(false));
  }

  void rebuildTree() {
    treeItems = treeFrom(Session().tree(sessionIndex, Counter()), selected);
  }

  void edit(String stylesheet) {
    final changed = Session().edit(sessionIndex, stylesheet);
    if (changed) selected = (NodeType.termType, 0);
    query = null; // make sure no filter
    rebuildTree();
    mutation++;
  }

  // Types are:
  // appraisalReport 0,
  // approved 1,
  // comments 2,
  // draft 3,
  // consultation 4,
  // index 5,
  // mapping 6
  String docx(int typ) {
    final filename = Base58Encode(uuid.v1obj().toBytes());
    final outName = "$filename.docx";
    final outFile = p.join(outputDir, outName);
    Session().docx(sessionIndex, typ, outputDir, outName);
    return outFile;
  }

  String transform(String stylesheet, String extension) {
    final filename = Base58Encode(uuid.v1obj().toBytes());
    final outFile = p.join(outputDir, "$filename.$extension");
    Session().transform(sessionIndex, stylesheet, outFile);
    return outFile;
  }

  CurrentNode current() {
    return CurrentNode(sessionIndex, mutation, selected);
  }

  CurrentNode asCurrent(Ref ref) {
    Session().setCurrent(sessionIndex, ref);
    return CurrentNode(sessionIndex, 0, ref);
  }

  void setCurrent(Ref ref) {
    selected = ref;
    Session().setCurrent(sessionIndex, ref);
  }

  void dropNode(Ref ref) {
    Session().dropNode(sessionIndex, ref);
    Ref select =
        (ref.$2 == 0)
            ? (ref.$1 == NodeType.contextType)
                ? (NodeType.rootType, 0)
                : (ref.$1, 0)
            : (ref.$1, ref.$2 - 1);
    treeItems = mutate(treeItems!, TreeOp.drop, ref, ctr: Counter(select));
    setCurrent(getSelectedRef(treeItems, select) ?? select);
    mutation++;
  }

  void copy(Ref ref) {
    Session().copy(sessionIndex, ref);
  }

  void pasteChild(Ref ref) {
    Session().pasteChild(sessionIndex, ref);
    mutation++;
    rebuildTree();
    // todo: select the new node
  }

  void pasteSibling(Ref ref) {
    Session().pasteSibling(sessionIndex, ref);
    mutation++;
    rebuildTree();
    // todo: select the new node
  }

  void addFAC(Ref ref) {
    Session().addChild(sessionIndex, ref, NodeType.termType);
    final lref = getLastNode(treeItems);
    if (lref == null) return;
    final tref = (NodeType.termType, lref.$2 + 1);
    final tn = asCurrent(tref);
    tn.set("type", "function");
    Session().addChild(sessionIndex, tref, NodeType.termType);
    final atref = (NodeType.termType, lref.$2 + 2);
    final an = asCurrent(atref);
    an.set("type", "activity");
    Session().addChild(sessionIndex, atref, NodeType.classType);
    setCurrent(tref);
    rebuildTree();
  }

  void addChild(Ref ref, NodeType nt) {
    Session().addChild(sessionIndex, ref, nt);
    treeItems = mutate(
      treeItems!,
      TreeOp.child,
      (nt == NodeType.contextType) ? (NodeType.none, 0) : ref,
      ctr: Counter(),
      nt: nt,
    );
    mutation++;
    final nref = getSelected(treeItems!) ?? (NodeType.rootType, 0);
    setCurrent(nref);
    if (nt == NodeType.termType) {
      Session().set(sessionIndex, "type", "activity");
    }
  }

  void addSibling(Ref ref, NodeType nt) {
    Session().addSibling(sessionIndex, ref, nt);
    treeItems = mutate(treeItems!, TreeOp.sibling, ref, ctr: Counter(), nt: nt);
    mutation++;
    final nref = getSelected(treeItems!) ?? (NodeType.rootType, 0);
    setCurrent(nref);
    if (nt == NodeType.termType) {
      Session().set(
        sessionIndex,
        "type",
        topLevel(treeItems, nref) ? "function" : "activity",
      );
    }
  }

  void moveUp(Ref ref) {
    Session().moveUp(sessionIndex, ref);
    treeItems = mutate(treeItems!, TreeOp.up, ref, ctr: Counter(selected));
    mutation++;
    final nref = getSelected(treeItems!) ?? (NodeType.rootType, 0);
    setCurrent(nref);
  }

  void moveDown(Ref ref) {
    Session().moveDown(sessionIndex, ref);
    treeItems = mutate(treeItems!, TreeOp.down, ref, ctr: Counter(selected));
    mutation++;
    final nref = getSelected(treeItems!) ?? (NodeType.rootType, 0);
    setCurrent(nref);
  }

  void relabel(Ref ref, String? itemno, String? title) {
    if (treeItems != null) {
      relabelInPlace(treeItems!, ref, itemno, title);
    }
  }

  void expandFrom(Ref ref) {
    if (treeItems != null) {
      expandTreeFrom(treeItems!, ref);
    }
  }

  void expandAll() {
    if (treeItems != null) {
      expandTree(treeItems!);
    }
  }

  void collapseAll() {
    if (treeItems != null) {
      collapseTree(treeItems!);
    }
  }
}
