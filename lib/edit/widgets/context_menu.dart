import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authorityeditor/edit/provider/tree_provider.dart';

import 'package:authority/authority.dart' show NodeType;

Widget Function(BuildContext) contextBuilder(
  (NodeType, int) value,
  //(NodeType, int) parent,
  int children,
  WidgetRef ref,
) {
  List<MenuFlyoutItem> items = [];
  if (value.$1 == NodeType.termType) {
    items.add(
      MenuFlyoutItem(
        leading: const Icon(FluentIcons.fabric_new_folder),
        text: const Text('Add child term'),
        onPressed: () {
          ref.read(treeProvider.notifier).addChild(value, NodeType.termType);
        },
      ),
    );
    items.add(
      MenuFlyoutItem(
        leading: const Icon(FluentIcons.fabric_new_folder),
        text: const Text('Add sibling term'),
        onPressed: () {
          ref.read(treeProvider.notifier).addSibling(value, NodeType.termType);
        },
      ),
    );
    items.add(
      MenuFlyoutItem(
        leading: const Icon(FluentIcons.page_add),
        text: const Text('Add child class'),
        onPressed: () {
          ref.read(treeProvider.notifier).addChild(value, NodeType.classType);
        },
      ),
    );
    items.add(
      MenuFlyoutItem(
        leading: const Icon(FluentIcons.page_add),
        text: const Text('Add sibling class'),
        onPressed: () {
          ref.read(treeProvider.notifier).addSibling(value, NodeType.classType);
        },
      ),
    );
  } else if (value.$1 == NodeType.classType) {
    items.add(
      MenuFlyoutItem(
        leading: const Icon(FluentIcons.page_add),
        text: const Text('Add sibling class'),
        onPressed: () {
          ref.read(treeProvider.notifier).addSibling(value, NodeType.classType);
        },
      ),
    );
  }
  if (value.$1 == NodeType.none) {
    items.add(
      MenuFlyoutItem(
        leading: const Icon(FluentIcons.page_add),
        text: const Text('Add Context'),
        onPressed: () {
          ref.read(treeProvider.notifier).addChild((
            NodeType.rootType,
            0,
          ), NodeType.contextType);
        },
      ),
    );
  }
  items.add(
    MenuFlyoutItem(
      leading: const Icon(FluentIcons.delete),
      text: const Text('Delete'),
      onPressed: () {
        ref.read(treeProvider.notifier).dropNode(value);
      },
    ),
  );
  // if (parent > 2) {
  //   items.add(
  //     MenuFlyoutItem(
  //       leading: const Icon(FluentIcons.grouped_ascending),
  //       text: const Text('Move up'),
  //       onPressed: () {
  //         ref.read(outputRecordsProvider.notifier).moveUp(value);
  //       },
  //     ),
  //   );
  // }
  // items.add(
  //   MenuFlyoutItem(
  //     leading: const Icon(FluentIcons.grouped_descending),
  //     text: const Text('Move Down'),
  //     onPressed: () {
  //       ref.read(outputRecordsProvider.notifier).moveDown(value);
  //     },
  //   ),
  // );

  return (context) {
    return MenuFlyout(items: items);
  };
}
