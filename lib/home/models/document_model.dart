import 'package:fluent_ui/fluent_ui.dart';
import 'package:xml/xml.dart';
import 'package:file_picker/file_picker.dart';
//import 'package:path/path.dart' as p;

/// Model representing a document and its structure
class DocumentModel {
  String title;
  String path;
  List<TreeViewItem>? treeItems;
  int selectedItemIndex;
  XmlDocument? document;

  DocumentModel({
    required this.title,
    this.path = "",
    this.treeItems,
    this.selectedItemIndex = 0,
  });

  /// Create a new empty document model with default structure
  factory DocumentModel.empty({String title = 'Untitled'}) {
    return DocumentModel(
      title: title,
      treeItems: [
        TreeViewItem(
          content: const Text('Term 1'),
          value: 0,
          children: [
            TreeViewItem(
              content: const Text('Term 2'),
              value: 1,
              children: [
                TreeViewItem(content: const Text('Class 1'), value: 2),
              ],
            ),
          ],
        ),
      ],
    );
  }

  factory DocumentModel.load(PlatformFile f) {
    DocumentModel doc = DocumentModel.empty(title: f.name);
    if (f.bytes == null) {
      return doc;
    }
    doc.document = XmlDocument.parse(String.fromCharCodes(f.bytes!));
    if (doc.document != null) {
      doc.treeItems = addChildren(
        termsClasses(doc.document!.rootElement),
        Counter(),
      );
    }
    return doc;
  }
}

class Counter {
  int count = -1;
  int next() {
    count++;
    return count;
  }
}

List<TreeViewItem> addChildren(List<XmlElement> list, Counter ctr) {
  return list
      .map(
        (item) => TreeViewItem(
          leading:
              (item.name.toString() == 'Term')
                  ? Icon(FluentIcons.fabric_folder)
                  : Icon(FluentIcons.page),
          content: Text(title(item)),
          value: ctr.next(),
          children: addChildren(termsClasses(item), ctr),
        ),
      )
      .toList();
}

String title(XmlElement el) {
  String? itemno = el.getAttribute("itemno");
  XmlElement? t =
      (el.name.toString() == 'Class')
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
  if (el.name.toString() == 'Class') {
    return [];
  }
  return el.children
      .whereType<XmlElement>()
      .where((e) => e.name.toString() == 'Term' || e.name.toString() == 'Class')
      .toList();
}

XmlElement? nth(XmlDocument doc, int n) {
  int idx = 0;
  XmlElement el = doc.rootElement;
  while (idx < n) {}
  XmlElement? descend(XmlElement el) {}
}
