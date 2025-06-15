import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:authorityeditor/home/provider/documents_provider.dart';
import 'package:xml/xml.dart';

part 'node_provider.g.dart';

class CurrNode {
  CurrNode(this.typ, this.el, this.reference);
  NodeType typ;
  XmlElement? el;
  (int, int) reference;
  Map<String, bool> updates = {};

  void mark(String name) {
    updates[name] = true;
  }

  String getElement(String name) {
    if (el == null) return "";
    XmlElement? t = el!.getElement(name);
    if (t != null) {
      return t.innerText;
    }
    return "";
  }

  void setElement(String name, String value) {
    if (el == null) return;
    final changed = updates[name] ?? false;
    if (!changed) return;
    updates[name] = false;
    XmlElement? t = el!.getElement(name);
    // delete
    if (value == "") {
      if (t != null) el!.children.remove(t);
      return;
    }
    // update
    if (t != null) {
      t.innerText = value;
      return;
    }
    // insert
    t = XmlElement(XmlName(name), [], [XmlText(value)], false);
    int p = insertPos(el!, typ, name);
    el!.children.insert(p, t);
    return;
  }

  String getAttribute(String name) {
    if (el == null) return "";
    String? a = el!.getAttribute(
      name,
      namespace: "http://www.records.nsw.gov.au/schemas/RDA",
    );
    return (a != null) ? a : "";
  }

  void setAttribute(String name, String value) {
    if (el == null) return;
    final changed = updates[name] ?? false;
    if (!changed) return;
    updates[name] = false;
    String? a = (value == "") ? null : value;
    el!.setAttribute(
      name,
      a,
      namespace: "http://www.records.nsw.gov.au/schemas/RDA",
    );
    return;
  }

  List<XmlElement>? getParagraphs(String name) {
    if (el == null) return null;
    XmlElement? parent = el!.getElement(name);
    if (parent == null) return null;
    return parent.findElements("Paragraph").toList();
  }

  void setParagraphs(String name, List<XmlElement> paras) {
    if (el == null) return;
    XmlElement? parent = el!.getElement(name);
    if (parent == null) {
      // inserting
      parent = XmlElement(XmlName(name), [], paras, false);
      int p = insertPos(el!, typ, name);
      el!.children.insert(p, parent);
      return;
    }
    parent.children.removeWhere(
      (para) =>
          para.nodeType == XmlNodeType.ELEMENT &&
          (para as XmlElement).name.local == "Paragraph",
    );
    parent.children.insertAll(0, paras);
  }
}

@riverpod
class Node extends _$Node {
  @override
  CurrNode build() {
    final documents = ref.watch(documentsProvider);
    XmlElement? curr = documents.documents[documents.current].currentNode();
    NodeType nt = NodeType.classType;
    if (curr != null) {
      if (curr.name.local == "Term") {
        nt = NodeType.termType;
      }
      return CurrNode(nt, curr, (
        documents.current,
        documents.documents[documents.current].selectedItemIndex,
      ));
    }
    return CurrNode(nt, null, (
      documents.current,
      documents.documents[documents.current].selectedItemIndex,
    ));
  }
}

// Constants to maintain element order
// Also, after Comments Term or Class elements can be nested
const termElements = [
  "ID",
  "TermTitle",
  "TermDescription",
  "DateRange",
  "Status",
  "LinkedTo", // multiple
  "Comment", // multiple
];

const classElements = [
  "ID",
  "ClassTitle",
  "ClassDescription",
  "Disposal", // multiple
  "Justification",
  "DateRange",
  "Status",
  "LinkedTo", // multiple
  "Comment", // multiple
];

// determine where to insert a new element
int insertPos(XmlElement el, NodeType typ, String name) {
  int pos = 0;
  List<String> prev = (typ == NodeType.termType) ? termElements : classElements;
  prev = prev.sublist(0, prev.indexOf(name));
  for (var n in el.children) {
    if (n.nodeType != XmlNodeType.ELEMENT ||
        prev.contains((n as XmlElement).name.local)) {
      pos++;
      continue;
    }
    return pos;
  }
  return pos;
}
