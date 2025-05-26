import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:authorityeditor/home/provider/documents_provider.dart';
import 'package:xml/xml.dart';

part 'node_provider.g.dart';

enum NodeType { classType, termType }

class CurrNode {
  NodeType typ;
  XmlElement? el;

  CurrNode(this.typ, this.el);
}

@riverpod
class Node extends _$Node {
  @override
  CurrNode build() {
    //documents.documents[documents.current].
    final documents = ref.watch(documentsProvider);
    return CurrNode(NodeType.classType, null);
  }
}
