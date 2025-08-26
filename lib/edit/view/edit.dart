import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authorityeditor/edit/provider/node_provider.dart';
import 'package:authorityeditor/edit/widgets/document_tree.dart';
import 'package:authorityeditor/edit/view/term.dart';
import 'package:authorityeditor/edit/view/class.dart';
import 'package:authorityeditor/edit/view/context.dart';
import 'package:authorityeditor/edit/view/details.dart';

import 'package:authority/authority.dart' show NodeType;

class EditPage extends ConsumerWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentnode = ref.watch(nodeProvider);
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
        Expanded(
          child: switch (currentnode.typ()) {
            NodeType.classType => ClassView(),
            NodeType.termType => TermView(),
            NodeType.contextType => ContextView(),
            _ => DetailsView(),
          },
        ),
      ],
    );
  }
}
