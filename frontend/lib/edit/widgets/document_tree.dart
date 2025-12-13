import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authorityeditor/edit/provider/node_provider.dart';
import 'package:authorityeditor/edit/provider/tree_provider.dart';
import 'package:authorityeditor/edit/widgets/context_menu.dart';
import 'package:authorityeditor/authority/authority.dart' show NodeType;

enum Movement {
  none,
  updown,
  up,
  down;

  bool moveUp() {
    return switch (this) {
      updown => true,
      up => true,
      _ => false,
    };
  }

  bool moveDown() {
    return switch (this) {
      updown => true,
      down => true,
      _ => false,
    };
  }
}

Movement canMove(TreeViewItem item, List<TreeViewItem> siblings) {
  bool up = false;
  bool down = false;
  if (siblings.length < 2) return Movement.none;
  if (item.depth == 0) {
    debugPrint("we're at the top\n");
    if (siblings.length < 4) return Movement.none;
    if (siblings[2].value != item.value) up = true;
  } else {
    if (siblings[0].value != item.value) up = true;
  }
  if (siblings[siblings.length - 1].value != item.value) down = true;
  if (up && down) return Movement.updown;
  if (up) return Movement.up;
  if (down) return Movement.down;
  return Movement.none;
}

class DocumentTree extends ConsumerWidget {
  DocumentTree({super.key});
  final contextController = FlyoutController();
  final contextAttachKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final treeItems = ref.watch(treeProvider);
    return Container(
      color: Colors.grey[10],
      padding: const EdgeInsets.only(top: 8.0),
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        child: FlyoutTarget(
          controller: contextController,
          key: contextAttachKey,
          child: TreeView(
            items: treeItems,
            selectionMode: TreeViewSelectionMode.single,
            onItemInvoked: (item, reason) async {
              if (reason != TreeViewItemInvokeReason.pressed) return;
              if (item.value.$1 == NodeType.none) return;
              ref.read(nodeProvider.notifier).selectionChanged(item.value);
            },
            onSecondaryTap: (item, details) async {
              if (item.value.$1 == NodeType.rootType) return;
              if (ref.read(treeProvider.notifier).filtered()) return;
              final targetContext = contextAttachKey.currentContext;
              if (targetContext == null) return;
              final move =
                  (item.value.$1.like(NodeType.termType) ||
                          item.value.$1 != NodeType.contextType)
                      ? canMove(
                        item,
                        (item.depth == 0) ? treeItems : item.parent!.children,
                      )
                      : Movement.none;
              contextController.showFlyout(
                position: details.globalPosition,
                barrierDismissible: true,
                dismissOnPointerMoveAway: false,
                dismissWithEsc: true,
                builder: contextBuilder(
                  item.value,
                  move,
                  item.children.length,
                  ref.read(treeProvider.notifier).clipboard(),
                  ref,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
