import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:authorityeditor/home/provider/documents_provider.dart';
import 'package:authority/authority.dart' show CurrentNode;

part 'node_provider.g.dart';

@riverpod
class Node extends _$Node {
  @override
  CurrentNode build() {
    final documents = ref.watch(documentsProvider);
    return documents.documents[documents.current].current();
  }
}
