import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authorityeditor/home/provider/documents_provider.dart';
import 'package:authorityeditor/edit/widgets/context_menu.dart';

class DocumentTree extends ConsumerWidget {
  DocumentTree({super.key});
  final contextController = FlyoutController();
  final contextAttachKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final documents = ref.watch(documentsProvider);
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 8.0),
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        child: FlyoutTarget(
          controller: contextController,
          key: contextAttachKey,
          child: TreeView(
            items: documents.documents[documents.current].treeItems ?? [],
            selectionMode: TreeViewSelectionMode.single,
            onItemInvoked: (item, reason) async {
              ref
                  .read(documentsProvider.notifier)
                  .selectionChanged(item.value.$2);
            },
            onSecondaryTap: (item, details) async {
              //if (item.value == 2) return;
              final targetContext = contextAttachKey.currentContext;
              if (targetContext == null) return;
              contextController.showFlyout(
                position: details.globalPosition,
                barrierDismissible: true,
                dismissOnPointerMoveAway: false,
                dismissWithEsc: true,
                builder: contextBuilder(
                  item.value,
                  //    item.parent.value,
                  item.children.length,
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
