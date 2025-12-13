import 'package:authorityeditor/home/provider/documents_provider.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authorityeditor/edit/provider/tree_provider.dart';

import 'package:authorityeditor/authority/authority.dart' show NodeType;
import 'package:authorityeditor/edit/widgets/document_tree.dart' show Movement;

Widget Function(BuildContext) contextBuilder(
  (NodeType, int) value,
  Movement move,
  int children,
  NodeType? clipboard,
  WidgetRef ref,
) {
  // For top level context menu, only option is to add context
  if (value.$1 == NodeType.none) {
    return (context) {
      return MenuFlyout(
        items: [
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
          if (clipboard == NodeType.contextType)
            MenuFlyoutItem(
              leading: const Icon(FluentIcons.paste),
              text: const Text('Paste context'),
              onPressed: () {
                ref.read(treeProvider.notifier).pasteChild((
                  NodeType.rootType,
                  0,
                ));
              },
            ),
        ],
      );
    };
  }
  List<MenuFlyoutItem> items = switch (value.$1) {
    NodeType.termType => [
      MenuFlyoutItem(
        leading: const Icon(FluentIcons.fabric_new_folder),
        text: const Text('Add child term'),
        onPressed: () {
          ref.read(treeProvider.notifier).addChild(value, NodeType.termType);
        },
      ),
      MenuFlyoutItem(
        leading: const Icon(FluentIcons.fabric_new_folder),
        text: const Text('Add sibling term'),
        onPressed: () {
          ref.read(treeProvider.notifier).addSibling(value, NodeType.termType);
        },
      ),
      MenuFlyoutItem(
        leading: const Icon(FluentIcons.page_add),
        text: const Text('Add child class'),
        onPressed: () {
          ref.read(treeProvider.notifier).addChild(value, NodeType.classType);
        },
      ),
      MenuFlyoutItem(
        leading: const Icon(FluentIcons.page_add),
        text: const Text('Add sibling class'),
        onPressed: () {
          ref.read(treeProvider.notifier).addSibling(value, NodeType.classType);
        },
      ),
    ],
    NodeType.classType => [
      MenuFlyoutItem(
        leading: const Icon(FluentIcons.fabric_new_folder),
        text: const Text('Add sibling term'),
        onPressed: () {
          ref.read(treeProvider.notifier).addSibling(value, NodeType.termType);
        },
      ),

      MenuFlyoutItem(
        leading: const Icon(FluentIcons.page_add),
        text: const Text('Add sibling class'),
        onPressed: () {
          ref.read(treeProvider.notifier).addSibling(value, NodeType.classType);
        },
      ),
    ],
    _ => [
      MenuFlyoutItem(
        leading: const Icon(FluentIcons.fabric_new_folder),
        text: const Text('Add sibling context'),
        onPressed: () {
          ref
              .read(treeProvider.notifier)
              .addSibling(value, NodeType.contextType);
        },
      ),
    ],
  };
  if (clipboard != null) {
    if (value.$1 == NodeType.termType && clipboard != NodeType.contextType) {
      items.add(
        MenuFlyoutItem(
          leading: const Icon(FluentIcons.paste),
          text: const Text('Paste child'),
          onPressed: () {
            ref.read(treeProvider.notifier).pasteChild(value);
          },
        ),
      );
    }
    if (clipboard.like(value.$1)) {
      items.add(
        MenuFlyoutItem(
          leading: const Icon(FluentIcons.paste),
          text: const Text('Paste sibling'),
          onPressed: () {
            ref.read(treeProvider.notifier).pasteSibling(value);
          },
        ),
      );
    }
  }
  items.add(
    MenuFlyoutItem(
      leading: const Icon(FluentIcons.cut),
      text: const Text('Cut'),
      onPressed: () {
        ref.read(documentsProvider.notifier).copyNode(value);
        ref.read(treeProvider.notifier).dropNode(value);
      },
    ),
  );
  items.add(
    MenuFlyoutItem(
      leading: const Icon(FluentIcons.copy),
      text: const Text('Copy'),
      onPressed: () {
        ref.read(documentsProvider.notifier).copyNode(value);
      },
    ),
  );
  if (move.moveUp()) {
    items.add(
      MenuFlyoutItem(
        leading: const Icon(FluentIcons.up),
        text: const Text('Move up'),
        onPressed: () {
          ref.read(treeProvider.notifier).moveUp(value);
        },
      ),
    );
  }
  if (move.moveDown()) {
    items.add(
      MenuFlyoutItem(
        leading: const Icon(FluentIcons.down),
        text: const Text('Move down'),
        onPressed: () {
          ref.read(treeProvider.notifier).moveDown(value);
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
