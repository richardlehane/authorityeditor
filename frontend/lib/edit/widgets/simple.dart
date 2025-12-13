import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authorityeditor/edit/provider/node_provider.dart';

class SimpleText extends ConsumerStatefulWidget {
  final String name;
  final String label;
  final String? placeholder;
  const SimpleText({
    super.key,
    required this.label,
    required this.name,
    this.placeholder,
  });

  @override
  ConsumerState<SimpleText> createState() => _SimpleTextState();
}

class _SimpleTextState extends ConsumerState<SimpleText> {
  final TextEditingController controller = TextEditingController();
  bool changed = false;

  @override
  void initState() {
    controller.text = ref.read(nodeProvider).get(widget.name) ?? "";
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapOutside: (PointerDownEvent ev) {
        if (changed) {
          String? val = controller.text;
          if (val.isEmpty) val = null;
          ref.read(nodeProvider).set(widget.name, val);
        }
      },
      child: InfoLabel(
        label: widget.label,
        child: TextBox(
          placeholder: widget.placeholder,
          controller: controller,
          onChanged: (value) => changed = true,
        ),
      ),
    );
  }
}

// class Title extends ConsumerStatefulWidget {
//   final bool term;
//   const Title({super.key, this.term = true});

//   @override
//   ConsumerState<Title> createState() => _TitleState();
// }

// class _TitleState extends ConsumerState<Title> {
//   final TextEditingController itemnoController = TextEditingController();
//   final TextEditingController titleController = TextEditingController();
//   bool itemnoChanged = false;
//   bool titleChanged = false;

//   @override
//   void initState() {
//     itemnoController.text = ref.read(nodeProvider).get("itemno") ?? "";
//     titleController.text =
//         ref
//             .read(nodeProvider)
//             .get((widget.term) ? "TermTitle" : "ClassTitle") ??
//         "";
//     super.initState();
//   }

//   @override
//   void dispose() {
//     itemnoController.dispose();
//     titleController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TapRegion(
//       onTapOutside: (PointerDownEvent ev) {
//         if (itemnoChanged || titleChanged) {
//           final node = ref.read(nodeProvider);
//           String? itemnoTxt = itemnoController.text;
//           String? titleTxt = titleController.text;
//           if (itemnoTxt.isEmpty) itemnoTxt = null;
//           if (titleTxt.isEmpty) titleTxt = null;
//           if (itemnoChanged) ref.read(nodeProvider).set("itemno", itemnoTxt);
//           if (titleChanged) {
//             node.set((widget.term) ? "TermTitle" : "ClassTitle", titleTxt);
//           }
//           ref
//               .read(treeProvider.notifier)
//               .relabel(node.ref, itemnoTxt, titleTxt);
//         }
//       },
//       child: Row(
//         children: [
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
//               child: InfoLabel(
//                 label: "Number",
//                 child: TextBox(
//                   placeholder: "0.0.0",
//                   controller: itemnoController,
//                   onChanged: (value) => itemnoChanged = true,
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 2,
//             child: Padding(
//               padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
//               child: InfoLabel(
//                 label:
//                     (widget.term)
//                         ? "Title"
//                         : "Title (not recommended for classes)",
//                 child: TextBox(
//                   controller: titleController,
//                   onChanged: (value) => titleChanged = true,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
