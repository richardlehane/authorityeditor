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

  void multiAdd(String element, String? sub) {
    state.multiAdd(element, sub);
    ref.notifyListeners();
  }

  void multiSet(String element, int index, String? sub, String? val) {
    state.multiSet(element, index, sub, val);
    ref.notifyListeners();
  }
}
