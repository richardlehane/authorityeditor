import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:authorityeditor/authority/authority.dart'
    as authority
    show Document, View, Search, NodeType, Ref;

part 'documents_provider.g.dart';

class DocState {
  int current;
  List<authority.Document> documents;
  authority.NodeType? clipboard;

  DocState({required this.current, required this.documents});
}

@Riverpod()
class Documents extends _$Documents {
  @override
  DocState build() {
    return DocState(current: 0, documents: [authority.Document.empty()]);
  }

  void reorder(int idxa, int idxb) {
    if (idxb > idxa) idxb--;
    final doca = state.documents[idxa];
    state.documents[idxa] = state.documents[idxb];
    state.documents[idxb] = doca;
    state.current = idxb;
    ref.notifyListeners();
  }

  void load(PlatformFile f) {
    if (state.documents[state.current].path == null &&
        state.documents[state.current].mutation == 0) {
      if (state.documents[state.current].toString().length < 285) {
        state.documents[state.current].unload();
        state.documents.removeAt(state.current);
      }
    }
    state.documents.add(authority.Document.load(f));
    state.current = state.documents.length - 1;
    ref.notifyListeners();
  }

  void newDocument() {
    state.documents.add(authority.Document.empty());
    state.current = state.documents.length - 1;
    ref.notifyListeners();
  }

  void copyNode(authority.Ref aref) {
    state.documents[state.current].copy(aref);
    state.clipboard = aref.$1;
    ref.notifyListeners();
  }

  void drop(int index) {
    if (state.documents.length > 1) {
      if (state.current == state.documents.length - 1) {
        state.current -= 1;
      }
      state.documents[index].unload();
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

  bool applyFilter(authority.Search search) {
    bool matched = false;
    if (search.allTabs) {
      for (final doc in state.documents) {
        final results = search.apply(doc);
        if (results != null && results.isNotEmpty) {
          matched = true;
          results[0].selected = true;
          doc.treeItems = results;
          doc.query = search;
          doc.setCurrent(results[0].value);
        }
      }
    } else {
      final results = search.apply(state.documents[state.current]);
      if (results != null && results.isNotEmpty) {
        matched = true;
        results[0].selected = true;
        state.documents[state.current].treeItems = results;
        state.documents[state.current].query = search;
        state.documents[state.current].setCurrent(results[0].value);
      }
    }
    if (matched) ref.notifyListeners();
    return matched;
  }

  void clearFilter() {
    state.documents[state.current].query = null;
    state.documents[state.current].setCurrent((authority.NodeType.termType, 0));
    state.documents[state.current].rebuildTree();
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
