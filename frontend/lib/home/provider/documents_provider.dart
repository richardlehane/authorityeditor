import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:authorityeditor/authority/authority.dart'
    as authority
    show Document, View;

part 'documents_provider.g.dart';

class DocState {
  int current;
  List<authority.Document> documents;

  DocState({required this.current, required this.documents});
}

@Riverpod(keepAlive: true)
class Documents extends _$Documents {
  @override
  DocState build() {
    return DocState(current: 0, documents: [authority.Document.empty()]);
  }

  void load(PlatformFile f) {
    state.documents.add(authority.Document.load(f));
    state.current = state.documents.length - 1;
    ref.notifyListeners();
  }

  void newDocument() {
    state.documents.add(authority.Document.empty());
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

  void edit(String stylesheet) {
    state.documents[state.current].edit(stylesheet);
    ref.notifyListeners();
  }

  void paneChanged(int pane) {
    state.current = pane;
    ref.notifyListeners();
  }

  void viewChanged(String view) {
    switch (view) {
      case "review":
        state.documents[state.current].view = authority.View.review;
      case "source":
        if (state.documents[state.current].view == authority.View.review) {
          state.documents[state.current].setCurrent(
            state.documents[state.current].selected,
          );
        }
        state.documents[state.current].view = authority.View.source;
      default:
        // reset current
        if (state.documents[state.current].view == authority.View.review) {
          state.documents[state.current].setCurrent(
            state.documents[state.current].selected,
          );
        }
        state.documents[state.current].view = authority.View.edit;
    }
    ref.notifyListeners();
  }
}
