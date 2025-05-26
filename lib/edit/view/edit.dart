import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authorityeditor/edit/widgets/document_tree.dart';
import 'package:authorityeditor/edit/view/term.dart';

class EditPage extends ConsumerWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        // Left column with tree
        SizedBox(width: 250, child: DocumentTree()),
        // Divider
        const SizedBox(
          width: 1,
          child: Divider(direction: Axis.vertical, size: 1),
        ),
        // Right column with content
        Expanded(child: TermView()),
      ],
    );
  }
}
