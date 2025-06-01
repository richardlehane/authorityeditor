import 'package:fluent_ui/fluent_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:xml/xml.dart';

part 'documents_provider.g.dart';

const String blank = '''
<?xml version="1.0" encoding="UTF-8"?>
<Authority xmlns="http://www.records.nsw.gov.au/schemas/RDA">
	<Term itemno="1.0.0" type="function">
    <Term itemno="1.1.0" type="activity">
      <Class itemno="1.1.1" />
		</Term>
	</Term>
</Authority>
''';

enum NodeType { classType, termType }

enum DocumentView {
  editView,
  sourceView;

  @override
  String toString() {
    switch (this) {
      case DocumentView.editView:
        return "edit";
      case DocumentView.sourceView:
        return "source";
    }
  }
}

/// Model representing a document and its structure
class DocumentModel {
  String title;
  String path;
  List<TreeViewItem>? treeItems;
  int selectedItemIndex;
  DocumentView view = DocumentView.editView;
  XmlDocument? document;

  XmlElement? currentNode() {
    return nth(document, selectedItemIndex);
  }

  DocumentModel({
    required this.title,
    this.path = "",
    this.treeItems,
    this.document,
    this.selectedItemIndex = 0,
  });

  /// Create a new empty document model with default structure
  factory DocumentModel.empty({String title = 'Untitled'}) {
    final doc = XmlDocument.parse(blank);
    return DocumentModel(
      title: title,
      treeItems: addChildren(termsClasses(doc.rootElement), Counter(0)),
      document: doc,
    );
  }

  factory DocumentModel.load(PlatformFile f) {
    if (f.bytes == null) {
      return DocumentModel.empty(title: f.name);
    }
    final doc = XmlDocument.parse(String.fromCharCodes(f.bytes!));
    return DocumentModel(
      title: f.name,
      treeItems: addChildren(termsClasses(doc.rootElement), Counter(0)),
      document: doc,
    );
  }

  @override
  String toString() {
    if (document != null) {
      return document!.toXmlString(pretty: true, indent: '\t');
    }
    return "";
  }

  void refreshTree() {
    treeItems = addChildren(
      termsClasses(document!.rootElement),
      Counter(selectedItemIndex),
    );
  }

  void addChild(int n, NodeType nt) {
    XmlElement? el = nth(document, n);
    if (el == null) {
      return;
    }
    el.children.add(
      XmlElement(XmlName((nt == NodeType.termType) ? "Term" : "Class")),
    );
    refreshTree();
  }
}

class Counter {
  int count = -1;
  int selected = 0;

  Counter(this.selected);

  int next() {
    count++;
    return count;
  }

  bool isSelected() {
    return selected == count;
  }
}

List<TreeViewItem> addChildren(List<XmlElement> list, Counter ctr) {
  return list.map((item) {
    NodeType nt =
        (item.name.local == 'Term') ? NodeType.termType : NodeType.classType;
    return TreeViewItem(
      leading:
          (nt == NodeType.termType)
              ? Icon(FluentIcons.fabric_folder)
              : Icon(FluentIcons.page),
      content: Text(title(item)),
      value: (nt, ctr.next()),
      children: addChildren(termsClasses(item), ctr),
      selected: ctr.isSelected(),
    );
  }).toList();
}

String title(XmlElement el) {
  String? itemno = el.getAttribute("itemno");
  XmlElement? t =
      (el.name.local == 'Class')
          ? el.getElement('ClassTitle')
          : el.getElement('TermTitle');
  return (itemno != null)
      ? (t != null)
          ? "$itemno ${t.innerText}"
          : itemno
      : (t != null)
      ? t.innerText
      : '';
}

List<XmlElement> termsClasses(XmlElement el) {
  if (el.name.local == 'Class') {
    return [];
  }
  return el.childElements
      .where((e) => e.name.local == 'Term' || e.name.local == 'Class')
      .toList();
}

XmlElement? nth(XmlDocument? doc, int n) {
  int idx = -1;
  XmlElement? descend(XmlElement el) {
    for (XmlElement child in el.childElements.where(
      (e) => e.name.local == 'Term' || e.name.local == 'Class',
    )) {
      idx++;
      if (idx == n) {
        return child;
      }
      if (child.name.local == 'Term') {
        var ret = descend(child);
        if (ret != null) {
          return ret;
        }
      }
    }
    return null;
  }

  if (doc == null) {
    return null;
  }
  return descend(doc.rootElement);
}

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

  DocumentModel current() {
    return state.documents[state.current];
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

  void selectionChanged(int index) {
    state.documents[state.current].selectedItemIndex = index;
    ref.notifyListeners();
  }

  void viewChanged(String view) {
    switch (view) {
      case "source":
        state.documents[state.current].view = DocumentView.sourceView;
      default:
        state.documents[state.current].view = DocumentView.editView;
    }
    ref.notifyListeners();
  }

  void addChild(int n, NodeType nt) {
    state.documents[state.current].addChild(n, nt);
    ref.notifyListeners();
  }
}
