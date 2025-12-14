import 'package:fluent_ui/fluent_ui.dart'
    show Widget, FluentIcons, Icon, SizedBox, Text, TreeViewItem;
import 'package:flutter/material.dart';
import 'node.dart' show NodeType;

typedef Ref = (NodeType, int);

enum TreeOp { child, sibling, up, down }

class TreeNode {
  Ref ref = (NodeType.none, 0);
  String? itemno;
  String? title;
  List<TreeNode>? children;

  TreeNode(this.ref, this.itemno, this.title, this.children);

  TreeNode.ref(this.ref);

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

// called in review view on select & swap to edit view
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

// called in review view on select & swap to edit view
void markSelected(List<TreeViewItem>? tree, Ref ref) {
  if (tree == null) return;
  for (var i = 0; i < tree.length; i++) {
    final element = tree[i];
    if (!ref.$1.like(element.value.$1)) continue;
    if (element.value.$2 == ref.$2) {
      element.selected = true;
      return;
    }
    if (i == tree.length - 1 || tree[i + 1].value.$2 > ref.$2) {
      element.expanded = true;
      return markSelected(element.children, ref);
    }
  }
}

// called in review view for list builder
int termClassLen(List<TreeViewItem>? tree) {
  if (tree == null) return 0;
  var ret = 0;
  for (final item in tree) {
    if ((item.value.$1 as NodeType).like(NodeType.termType)) {
      ret += _count(item);
    }
  }
  return ret;
}

int _count(TreeViewItem item) {
  var ret = 1;
  for (final i in item.children) {
    ret += _count(i);
  }
  return ret;
}

// converts the tree nodes provided by the XML backends to a tree view
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

// traverses the Tree View to find the ref currently marked as selected in the tree
// called in document.dart when setting current after adding child or sibling
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

TreeViewItem _copyItemWithoutChildren(TreeViewItem old) {
  return TreeViewItem(
    leading: old.leading,
    content: old.content,
    value: old.value,
  );
}

// TODO: explore whether can just directly copy fields here, rather than recreating them??
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
    int index = ctr.next(old[i].value.$1);
    bool selected = ctr.isSelected();
    if (old[i].value == ref) {
      if (up) {
        i--;
      } else {
        i++;
      }
    } else if (up && i < old.length - 1 && old[i + 1].value == ref) {
      i++;
    } else if (!up && i > 0 && old[i - 1].value == ref) {
      i--;
    }

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

void relabelInPlace(
  List<TreeViewItem> list,
  Ref ref,
  String? itemno,
  String? title,
) {
  int? prev; // terms only
  for (var i = 0; i < list.length; i++) {
    final item = list[i];
    // mutate this item only
    if (item.value == ref) {
      list[i] = TreeViewItem(
        leading: item.leading,
        content: makeLabel(itemno, title, ref.$1),
        value: item.value,
        selected: item.selected,
        expanded: item.expanded,
        children: item.children,
      );
    }
    if (!(item.value.$1 as NodeType).like(ref.$1)) {
      continue;
    }
    if (item.value.$1 == NodeType.termType && item.value.$2 < ref.$2) {
      prev = i;
    }
    if (item.value.$2 > ref.$2 || i == list.length - 1) {
      if (prev != null) {
        relabelInPlace(list[prev].children, ref, itemno, title);
      }
      return;
    }
  }
}

// return true if the node we are dropping is selected
bool dropInPlace(List<TreeViewItem>? list, Ref ref) {
  if (list == null) {
    return false;
  }
  for (var i = 0; i < list.length; i++) {
    if (!(list[i].value.$1 as NodeType).like(ref.$1)) {
      continue;
    }
    // mutate this item only
    if (list[i].value == ref) {
      final ret = list[i].selected ?? false;
      list.removeAt(i);
      return ret;
    }
    if (i == list.length - 1 || list[i + 1].value.$2 > ref.$2) {
      return dropInPlace(list[i + 1].children, ref);
    }
  }
  return false;
}

TreeViewItem? getItem(List<TreeViewItem> list, Ref ref) {
  TreeViewItem? prev; // terms only
  for (var i = 0; i < list.length; i++) {
    final item = list[i];
    if (item.value == ref) return item;
    if (!(item.value.$1 as NodeType).like(ref.$1)) {
      continue;
    }
    if (item.value.$1 == NodeType.termType && item.value.$2 < ref.$2) {
      prev = item;
    }
    if (item.value.$2 > ref.$2 || i == list.length - 1) {
      return (prev != null) ? getItem(prev.children, ref) : null;
    }
  }
  return null;
}

// TODO: implement!
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
  }
}

List<TreeViewItem>? flatten(List<TreeViewItem>? tree) {
  if (tree == null || tree.length < 3) return null;
  final List<TreeViewItem> ret = [];
  for (final item in tree) {
    if ((item.value.$1 as NodeType).like(NodeType.termType)) {
      _append(ret, item);
    }
  }
  return ret;
}

void _append(List<TreeViewItem> ret, TreeViewItem item) {
  ret.add(_copyItemWithoutChildren(item));
  for (final i in item.children) {
    _append(ret, i);
  }
}

List<Ref> getDescendants(List<TreeViewItem>? tree, Ref ref) {
  final List<Ref> ret = [];
  final item = treeNth(ref, tree);
  if (item != null) {
    for (final item in item.children) {
      _appendRef(ret, item);
    }
  }
  return ret;
}

void _appendRef(List<Ref> ret, TreeViewItem item) {
  ret.add(item.value as Ref);
  for (final i in item.children) {
    _appendRef(ret, i);
  }
}
