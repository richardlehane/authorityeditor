// import 'package:fluent_ui/fluent_ui.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:siplicity/workspace/provider/workspace_provider.dart';

// Widget Function(BuildContext) contextBuilder(
//     int value, int parent, int children, WidgetRef ref) {
//   List<MenuFlyoutItem> items = [
//     MenuFlyoutItem(
//       leading: const Icon(FluentIcons.fabric_new_folder),
//       text: const Text('Add parent'),
//       onPressed: () {
//         ref.read(outputRecordsProvider.notifier).addParent(value);
//       },
//     ),
//   ];
//   if (parent > 2) {
//     items.add(MenuFlyoutItem(
//       leading: const Icon(FluentIcons.grouped_ascending),
//       text: const Text('Move up'),
//       onPressed: () {
//         ref.read(outputRecordsProvider.notifier).moveUp(value);
//       },
//     ));
//   }
//   items.add(MenuFlyoutItem(
//     leading: const Icon(FluentIcons.grouped_descending),
//     text: const Text('Move Down'),
//     onPressed: () {
//       ref.read(outputRecordsProvider.notifier).moveDown(value);
//     },
//   ));
//   if (children > 0) {
//     items.add(MenuFlyoutItem(
//       leading: const Icon(FluentIcons.delete_rows_mirrored),
//       text: const Text('Flatten'),
//       onPressed: () {
//         ref.read(outputRecordsProvider.notifier).flatten(value);
//       },
//     ));
//   }

//   return (context) {
//     return MenuFlyout(items: items);
//   };
// }
