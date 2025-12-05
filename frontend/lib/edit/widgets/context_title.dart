import 'package:authorityeditor/edit/provider/tree_provider.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authorityeditor/edit/provider/node_provider.dart';

class ContextTitle extends ConsumerStatefulWidget {
  const ContextTitle({super.key});

  @override
  ConsumerState<ContextTitle> createState() => _ContextTitleState();
}

class _ContextTitleState extends ConsumerState<ContextTitle> {
  final TextEditingController titleController = TextEditingController();
  bool titleChanged = false;

  @override
  void initState() {
    titleController.text = ref.read(nodeProvider).get("ContextTitle") ?? "";
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapOutside: (PointerDownEvent ev) {
        if (titleChanged) {
          final node = ref.read(nodeProvider);
          String? titleTxt = titleController.text;
          if (titleTxt.isEmpty) titleTxt = null;
          if (titleChanged) {
            node.set("ContextTitle", titleTxt);
          }
          ref.read(treeProvider.notifier).relabel(node.ref, null, titleTxt);
          titleChanged = false;
        }
      },
      child: InfoLabel(
        label: "Title",
        child: TextBox(
          controller: titleController,
          onChanged: (value) => titleChanged = true,
        ),
      ),
    );
  }
}
