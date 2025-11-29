import 'package:authorityeditor/authority/src/tree.dart';
import 'package:fluent_ui/fluent_ui.dart' show TreeViewItem;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:authorityeditor/home/provider/documents_provider.dart';
import 'package:authorityeditor/edit/provider/node_provider.dart';
import 'package:authorityeditor/authority/authority.dart'
    as authority
    show Ref, NodeType;

part 'tree_provider.g.dart';

@riverpod
class Tree extends _$Tree {
  @override
  List<TreeViewItem> build() {
    final documents = ref.watch(documentsProvider);
    return documents.documents[documents.current].treeItems ?? [];
  }

  void addChild(authority.Ref aref, authority.NodeType nt) {
    final documents = ref.read(documentsProvider);
    documents.documents[documents.current].addChild(aref, nt);
    ref.read(nodeProvider.notifier).refresh();
    state = documents.documents[documents.current].treeItems ?? [];
  }

  void addSibling(authority.Ref aref, authority.NodeType nt) {
    final documents = ref.read(documentsProvider);
    documents.documents[documents.current].addSibling(aref, nt);
    ref.read(nodeProvider.notifier).refresh();
    state = documents.documents[documents.current].treeItems ?? [];
  }

  void relabel(authority.Ref aref, String? itemno, String? title) {
    final documents = ref.read(documentsProvider);
    documents.documents[documents.current].relabel(aref, itemno, title);
    state = documents.documents[documents.current].treeItems ?? [];
  }

  void dropNode(authority.Ref aref) {
    final documents = ref.read(documentsProvider);
    documents.documents[documents.current].dropNode(aref);
    ref.read(nodeProvider.notifier).refresh();
    state = documents.documents[documents.current].treeItems ?? [];
  }
}
