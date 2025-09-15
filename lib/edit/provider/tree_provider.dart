import 'package:fluent_ui/fluent_ui.dart' show TreeViewItem;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:authorityeditor/home/provider/documents_provider.dart';

part 'tree_provider.g.dart';

@riverpod
class Tree extends _$Tree {
  @override
  List<TreeViewItem> build() {
    final documents = ref.watch(documentsProvider);
    return documents.documents[documents.current].treeItems ?? [];
  }
}
