import 'package:authorityeditor/edit/provider/tree_provider.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authorityeditor/edit/provider/node_provider.dart';

class NodeTitle extends ConsumerStatefulWidget {
  final bool term;
  const NodeTitle({super.key, this.term = true});

  @override
  ConsumerState<NodeTitle> createState() => _NodeTitleState();
}

class _NodeTitleState extends ConsumerState<NodeTitle> {
  final TextEditingController itemnoController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  bool itemnoChanged = false;
  bool titleChanged = false;

  @override
  void initState() {
    itemnoController.text = ref.read(nodeProvider).get("itemno") ?? "";
    titleController.text =
        ref
            .read(nodeProvider)
            .get((widget.term) ? "TermTitle" : "ClassTitle") ??
        "";
    super.initState();
  }

  @override
  void dispose() {
    itemnoController.dispose();
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapOutside: (PointerDownEvent ev) {
        if (itemnoChanged || titleChanged) {
          final node = ref.read(nodeProvider);
          String? itemnoTxt = itemnoController.text;
          String? titleTxt = titleController.text;
          if (itemnoTxt.isEmpty) itemnoTxt = null;
          if (titleTxt.isEmpty) titleTxt = null;
          if (itemnoChanged) ref.read(nodeProvider).set("itemno", itemnoTxt);
          if (titleChanged) {
            node.set((widget.term) ? "TermTitle" : "ClassTitle", titleTxt);
          }
          ref
              .read(treeProvider.notifier)
              .relabel(node.ref, itemnoTxt, titleTxt);
          itemnoChanged = false;
          titleChanged = false;
        }
      },
      child: Row(
        children: [
          SizedBox(
            width: 100.0,
            child: InfoLabel(
              label: "Number",
              child: TextBox(
                placeholder: "0.0.0",
                controller: itemnoController,
                onChanged: (value) => itemnoChanged = true,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: InfoLabel(
                label: "Title",
                child: TextBox(
                  placeholder:
                      (widget.term) ? null : "Not recommended for classes",
                  controller: titleController,
                  onChanged: (value) => titleChanged = true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
