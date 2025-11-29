import 'package:fluent_ui/fluent_ui.dart'
    show Widget, FluentIcons, Icon, SizedBox, Text, TreeViewItem;
import 'package:flutter/material.dart';
import 'node.dart' show NodeType;

typedef Ref = (NodeType, int);

enum TreeOp { drop, child, sibling, up, down, relabel }

class TreeNode {
  Ref ref = (NodeType.none, 0);
  String? itemno;
  String? title;
  List<TreeNode>? children;

  TreeNode(this.ref, this.itemno, this.title, this.children);

  bool equals(TreeNode n) {
    if (ref != n.ref) return false;
    if (itemno != n.itemno) return false;
    if (title != n.title) return false;
    if (children?.length != n.children?.length) return false;
    if (children == null && n.children == null) return true;
    for (int i = 0; i < children!.length; i++) {
      if (!children![i].equals(n.children![i])) return false;
    }
    return true;
  }
}

class Counter {
  int count = -1;
  NodeType thisNt = NodeType.rootType;
  Ref selected;

  Counter([this.selected = (NodeType.termType, 0)]);

  int next(NodeType nt) {
    if (!thisNt.like(nt)) count = -1;
    thisNt = nt;
    count++;
    return count;
  }

  bool isSelected() {
    return thisNt == selected.$1 && count == selected.$2;
  }
}

bool _shouldExpand(List<TreeNode> nodes) {
  const num = 20;
  int i = 0;
  for (final node in nodes) {
    i++;
    i += node.children?.length ?? 0;
    if (i > num) return false;
  }
  return true;
}

void unmarkSelected(List<TreeViewItem>? tree, Ref ref) {
  if (tree == null) return;
  for (var i = 0; i < tree.length; i++) {
    final element = tree[i];
    if (!ref.$1.like(element.value.$1)) continue;
    if (element.value == ref) {
      element.selected = false;
      element.expanded = false;
      return;
    }
    if (i == tree.length - 1 || tree[i + 1].value.$2 > ref.$2) {
      element.expanded = false;
      return unmarkSelected(element.children, ref);
    }
  }
}

void markSelected(List<TreeViewItem>? tree, Ref ref) {
  if (tree == null) return;
  for (var i = 0; i < tree.length; i++) {
    final element = tree[i];
    if (!ref.$1.like(element.value.$1)) continue;
    if (element.value == ref) {
      element.selected = true;
      return;
    }
    if (i == tree.length - 1 || tree[i + 1].value.$2 > ref.$2) {
      element.expanded = true;
      return markSelected(element.children, ref);
    }
  }
}

int termClassLen(List<TreeViewItem>? tree) {
  if (tree == null) return 0;
  if (tree.length < 3) return 0;
  var ret = 0;
  tree.getRange(2, tree.length).forEach((i) => ret += _count(i));
  return ret;
}

int _count(TreeViewItem item) {
  var ret = 1;
  for (final i in item.children) {
    ret += _count(i);
  }
  return ret;
}

List<TreeViewItem> treeFrom(List<TreeNode> nodes, Ref selected) {
  final expanded = _shouldExpand(nodes);
  return List<TreeViewItem>.generate(
    nodes.length,
    (int i) => makeItem(
      expanded,
      selected,
      nodes[i].ref,
      nodes[i].itemno,
      nodes[i].title,
      nodes[i].children,
    ),
  );
}

Widget makeLabel(String? itemno, String? title, NodeType nt) {
  final label =
      (itemno == null && title == null)
          ? null
          : (itemno == null)
          ? title
          : (title == null)
          ? itemno
          : (nt == NodeType.termType)
          ? title
          : "$itemno $title";
  return (label == null) ? SizedBox() : Text(label);
}

TreeViewItem makeItem(
  bool expanded,
  Ref selected,
  Ref ref,
  String? itemno,
  String? title,
  List<TreeNode>? list,
) {
  return TreeViewItem(
    leading: switch (ref.$1) {
      NodeType.termType => Icon(
        FluentIcons.fabric_folder,
        color: Colors.deepOrangeAccent,
      ),
      NodeType.classType => Icon(FluentIcons.page, color: Colors.blueGrey),
      NodeType.contextType => Icon(FluentIcons.page_list, color: Colors.teal),
      _ => null,
    },
    selected: selected == ref,
    content: makeLabel(itemno, title, ref.$1),
    value: ref,
    children: (list == null) ? [] : treeFrom(list, selected),
    expanded: expanded,
  );
}

Ref? getSelected(List<TreeViewItem>? list) {
  if (list == null) return null;
  for (final element in list) {
    if (element.selected ?? false) return element.value;
    final cref = getSelected(element.children);
    if (cref != null) return cref;
  }
  return null;
}

TreeViewItem? treeNth(Ref ref, List<TreeViewItem>? list) {
  if (list == null || list.isEmpty) return null;
  TreeViewItem? prev;
  for (final element in list) {
    if (!ref.$1.like(element.value.$1)) continue;
    if (element.value.$2 == ref.$2) {
      return element;
    }
    if (element.value.$2 > ref.$2) {
      if (prev != null) {
        final TreeViewItem? el = treeNth(ref, prev.children);
        if (el != null) {
          return el;
        }
      } else {
        return null;
      }
    }
    prev = element;
  }
  return treeNth(ref, list[list.length - 1].children);
}

int treeDescendants(TreeViewItem item) {
  int tally = item.children.length;
  for (final element in item.children) {
    tally += treeDescendants(element);
  }
  return tally;
}

bool _treeContains(List<TreeViewItem> list, Ref ref) {
  for (final element in list) {
    if (element.value == ref) return true;
  }
  return false;
}

TreeViewItem _copyItemWithChildren(
  TreeViewItem old,
  List<TreeViewItem> list, {
  int? index,
  bool? selected,
  bool expand = false,
}) {
  return TreeViewItem(
    leading: switch (old.value.$1) {
      NodeType.termType => Icon(
        FluentIcons.fabric_folder,
        color: Colors.deepOrangeAccent,
      ),
      NodeType.classType => Icon(FluentIcons.page, color: Colors.blueGrey),
      NodeType.contextType => Icon(FluentIcons.page_list, color: Colors.teal),
      _ => null,
    },
    content:
        (old.content is Text) ? Text((old.content as Text).data!) : SizedBox(),
    value: (index == null) ? old.value : (old.value.$1, index),
    selected: (selected == null) ? old.selected : selected,
    expanded: (expand) ? true : old.expanded,
    children: list,
  );
}

TreeViewItem Function(int i) _moveGenerator(
  List<TreeViewItem> old,
  Ref ref,
  Counter ctr,
  bool up,
) {
  return (int i) {
    if (up) {
      if (old[i].value.$1.like(ref.$1)) {
        if (up && i < old.length - 1 && old[i].value == ref) {
          i++;
        } else if (old[i].value == ref) {
          if (up) {
            if (i > 0) i--;
          } else {
            if (i < old.length - 1) i++;
          }
        } else if (!up && i > 0 && old[i - 1].value == ref) {
          i--;
        }
      }
    }
    int index = ctr.next(old[i].value.$1);
    bool selected = ctr.isSelected();
    return _copyItemWithChildren(
      old[i],
      List.generate(
        old[i].children.length,
        _moveGenerator(old[i].children, ref, ctr, up),
      ),
      index: index,
      selected: selected,
    );
  };
}

TreeViewItem Function(int i) _siblingGenerator(
  List<TreeViewItem> old,
  Ref ref,
  Counter ctr,
  NodeType nt,
) {
  bool next = false;
  bool decrement = false;

  return (int i) {
    if (next) {
      next = false;
      decrement = true;
      final ti = makeItem(
        true,
        ctr.selected,
        (nt, ctr.next(nt)),
        null,
        null,
        [],
      );
      ti.selected = true;
      return ti;
    }
    if (decrement) {
      i--;
    } else if (old[i].value == ref) {
      next = true;
    }
    int index = ctr.next(old[i].value.$1);
    return _copyItemWithChildren(
      old[i],
      List.generate(
        _treeContains(old[i].children, ref)
            ? old[i].children.length + 1
            : old[i].children.length,
        _siblingGenerator(old[i].children, ref, ctr, nt),
      ),
      index: index,
      selected: false,
    );
  };
}

TreeViewItem Function(int i) _childGenerator(
  List<TreeViewItem> old,
  Ref ref,
  Counter ctr,
  NodeType nt,
) {
  return (int i) {
    // add child as the last sibling
    if (i == old.length) {
      final ti = makeItem(
        true,
        ctr.selected,
        (nt, ctr.next(nt)),
        null,
        null,
        [],
      );
      ti.selected = true;
      return ti;
    }
    int index = ctr.next(old[i].value.$1);
    return _copyItemWithChildren(
      old[i],
      List.generate(
        (old[i].value == ref)
            ? old[i].children.length + 1
            : old[i].children.length,
        _childGenerator(old[i].children, ref, ctr, nt),
      ),
      index: index,
      selected: false,
      expand: (old[i].value == ref),
    );
  };
}

TreeViewItem Function(int i) _dropGenerator(
  List<TreeViewItem> old,
  Ref ref,
  Counter ctr,
) {
  bool seen = false;

  return (int i) {
    if (old[i].value == ref) seen = true;
    if (seen) i++;
    int index = ctr.next(old[i].value.$1);
    bool selected = ctr.isSelected();
    return _copyItemWithChildren(
      old[i],
      List.generate(
        _treeContains(old[i].children, ref)
            ? old[i].children.length - 1
            : old[i].children.length,
        _dropGenerator(old[i].children, ref, ctr),
      ),
      index: index,
      selected: selected,
    );
  };
}

TreeViewItem Function(int i) _relabelGenerator(
  List<TreeViewItem> old,
  Ref ref,
  String? itemno,
  String? title,
) {
  return (int i) {
    return TreeViewItem(
      leading: switch (old[i].value.$1) {
        NodeType.termType => Icon(
          FluentIcons.fabric_folder,
          color: Colors.deepOrangeAccent,
        ),
        NodeType.classType => Icon(FluentIcons.page, color: Colors.blueGrey),
        NodeType.contextType => Icon(FluentIcons.page_list, color: Colors.teal),
        _ => null,
      },
      content:
          (old[i].value == ref)
              ? makeLabel(itemno, title, ref.$1)
              : (old[i].content is Text)
              ? Text((old[i].content as Text).data!)
              : SizedBox(),
      value: old[i].value,
      selected: old[i].selected,
      expanded: old[i].expanded,
      children: List.generate(
        old[i].children.length,
        _relabelGenerator(old[i].children, ref, itemno, title),
      ),
    );
  };
}

// to do: implement!
List<TreeViewItem> mutate(
  List<TreeViewItem> old,
  TreeOp op,
  Ref ref, {
  Counter? ctr,
  NodeType? nt,
  String? itemno,
  String? title,
  TreeNode? node, // for copy/paste
}) {
  switch (op) {
    case TreeOp.sibling:
      return List.generate(
        _treeContains(old, ref) ? old.length + 1 : old.length,
        _siblingGenerator(old, ref, ctr!, nt!),
      );
    case TreeOp.child:
      return List.generate(old.length, _childGenerator(old, ref, ctr!, nt!));
    case TreeOp.up:
      return List.generate(old.length, _moveGenerator(old, ref, ctr!, true));
    case TreeOp.down:
      return List.generate(old.length, _moveGenerator(old, ref, ctr!, false));
    case TreeOp.relabel:
      return List.generate(
        old.length,
        _relabelGenerator(old, ref, itemno, title),
      );
    default:
      return List.generate(
        _treeContains(old, ref) ? old.length - 1 : old.length,
        _dropGenerator(old, ref, ctr!),
      );
  }
}
