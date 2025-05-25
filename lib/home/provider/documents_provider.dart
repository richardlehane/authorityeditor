import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:authorityeditor/home/models/document_model.dart';
import 'package:file_picker/file_picker.dart';

part 'documents_provider.g.dart';

class DocState {
  int current;
  List<DocumentModel> documents;

  DocState({required this.current, required this.documents});
}

@Riverpod(keepAlive: true)
class Documents extends _$Documents {
  @override
  DocState build() {
    return DocState(current: 0, documents: [DocumentModel.empty()]);
  }

  void load(PlatformFile f) {
    state.documents.add(DocumentModel.load(f));
    state.current = state.documents.length - 1;
    ref.notifyListeners();
  }

  void newDocument() {
    state.documents.add(DocumentModel.empty());
    state.current = state.documents.length - 1;
    ref.notifyListeners();
  }

  void drop(int index) {
    if (state.documents.length > 1) {
      if (state.current == state.documents.length - 1) {
        state.current -= 1;
      }
      state.documents.removeAt(index);
      ref.notifyListeners();
    }
  }

  void paneChanged(int pane) {
    state.current = pane;
    ref.notifyListeners();
  }
}
