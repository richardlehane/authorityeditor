import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:authorityeditor/home/provider/documents_provider.dart';
import 'package:authority/authority.dart' as authority show CurrentNode, Ref;

part 'node_provider.g.dart';

@riverpod
class Node extends _$Node {
  @override
  authority.CurrentNode build() {
    final documents = ref.watch(documentsProvider);
    return documents.documents[documents.current].current();
  }

  void selectionChanged(authority.Ref aref) {
    final docs = ref.read(documentsProvider);
    docs.documents[docs.current].setCurrent(aref);
    state = docs.documents[docs.current].current();
  }

  void multiAdd(String element, String? sub) {
    state.multiAdd(element, sub);
    ref.notifyListeners();
  }

  void multiSet(String element, int index, String? sub, String? val) {
    state.multiSet(element, index, sub, val);
    ref.notifyListeners();
  }

  void multiDrop(String element, int index) {
    state.multiDrop(element, index);
    ref.notifyListeners();
  }

  void multiUp(String element, int index) {
    state.multiUp(element, index);
    ref.notifyListeners();
  }

  void multiDown(String element, int index) {
    state.multiDown(element, index);
    ref.notifyListeners();
  }
}
