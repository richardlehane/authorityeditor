import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:authorityeditor/home/provider/documents_provider.dart';
import 'package:xml/xml.dart';

part 'node_provider.g.dart';

enum NodeType { classType, termType }

class CurrNode {
  NodeType typ;
  XmlElement? el;

  CurrNode(this.typ, this.el);
  String title() {
    if (el == null) {
      return "";
    }
    XmlElement? t;
    if (typ == NodeType.classType) {
      t = el!.getElement('ClassTitle');
    } else {
      t = el!.getElement('TermTitle');
    }
    if (t != null) {
      return t.innerText;
    }
    return "";
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
      if (curr.name.toString() == "Term") {
        nt = NodeType.termType;
      }
      return CurrNode(NodeType.classType, curr);
    }
    return CurrNode(nt, null);
  }
}
