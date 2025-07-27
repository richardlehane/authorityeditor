import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authorityeditor/home/provider/documents_provider.dart';

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
          ref
              .read(documentsProvider.notifier)
              .addChild(value.$2, NodeType.termType);
        },
      ),
    );
    items.add(
      MenuFlyoutItem(
        leading: const Icon(FluentIcons.fabric_new_folder),
        text: const Text('Add sibling term'),
        onPressed: () {
          ref
              .read(documentsProvider.notifier)
              .addSibling(value.$2, NodeType.termType);
        },
      ),
    );
    items.add(
      MenuFlyoutItem(
        leading: const Icon(FluentIcons.page_add),
        text: const Text('Add child class'),
        onPressed: () {
          ref
              .read(documentsProvider.notifier)
              .addChild(value.$2, NodeType.classType);
        },
      ),
    );
    items.add(
      MenuFlyoutItem(
        leading: const Icon(FluentIcons.page_add),
        text: const Text('Add sibling class'),
        onPressed: () {
          ref
              .read(documentsProvider.notifier)
              .addSibling(value.$2, NodeType.classType);
        },
      ),
    );
  } else if (value.$1 == NodeType.classType) {
    items.add(
      MenuFlyoutItem(
        leading: const Icon(FluentIcons.page_add),
        text: const Text('Add sibling class'),
        onPressed: () {
          ref
              .read(documentsProvider.notifier)
              .addSibling(value.$2, NodeType.classType);
        },
      ),
    );
  }
  items.add(
    MenuFlyoutItem(
      leading: const Icon(FluentIcons.delete),
      text: const Text('Delete'),
      onPressed: () {
        ref.read(documentsProvider.notifier).dropElement(value.$2);
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
