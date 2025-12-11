import 'dart:typed_data';
import 'dart:convert';
import '../../authority.dart' show TreeNode, NodeType, Counter;

// data is num_context,num_termclasses, contextentries, termclass entries
// Each context entry is len,text
// Each termclass entry is [node_type, itemno_len, itemno_chars, title_len, title_chars, (if term!) num_children], (if term!)children.

class Index {
  int i;
  Index(this.i);
  void advance(int j) => i += j;
  void increment() => i++;
}

List<TreeNode> asTree(Uint8List list, Counter ctr) {
  if (list.isEmpty) return [];
  ctr.next(NodeType.rootType);
  final int contextCount = list[0];
  final int tcCount = list[1]; // num of terms/classes
  List<String?> contextTitles = List.filled(contextCount, null);
  Index idx = Index(2);
  for (var i = 0; i < contextCount; i++) {
    int l = list[idx.i];
    if (l > 0) {
      contextTitles[i] = utf8.decode(list.sublist(idx.i + 1, idx.i + 1 + l));
    }
    idx.advance(l + 1);
  }
  List<TreeNode> ret = [
    TreeNode((NodeType.rootType, 0), null, "Details", []),
    TreeNode(
      (NodeType.none, 0),
      null,
      "Context",
      contextTitles
          .map(
            (title) => TreeNode(
              (NodeType.contextType, ctr.next(NodeType.contextType)),
              null,
              title,
              [],
            ),
          )
          .toList(),
    ),
  ];
  ret.addAll(_addTermsClasses(list, ctr, idx, tcCount));
  return ret;
}

List<TreeNode> _addTermsClasses(
  Uint8List list,
  Counter ctr,
  Index idx,
  int len,
) {
  List<TreeNode> ret = [];
  for (var i = 0; i < len; i++) {
    final nt = NodeType.values[list[idx.i]];
    idx.increment();
    int l = list[idx.i];
    final String? itemno =
        (l == 0) ? null : utf8.decode(list.sublist(idx.i + 1, idx.i + 1 + l));
    idx.advance(1 + l);
    l = list[idx.i];
    final String? title =
        (l == 0) ? null : utf8.decode(list.sublist(idx.i + 1, idx.i + 1 + l));
    idx.advance(1 + l);
    if (nt == NodeType.classType) {
      ret.add(TreeNode((nt, ctr.next(nt)), itemno, title, []));
    } else {
      final int children = list[idx.i];
      idx.increment();
      ret.add(
        TreeNode(
          (nt, ctr.next(nt)),
          itemno,
          title,
          _addTermsClasses(list, ctr, idx, children),
        ),
      );
    }
  }
  return ret;
}
