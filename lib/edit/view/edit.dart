import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authority/home/provider/documents_provider.dart';
import 'package:authority/edit/widgets/document_tree.dart';

class EditPage extends ConsumerWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final documents = ref.watch(documentsProvider);
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
          child: Container(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Document: ${documents.documents[documents.current].title}',
                    style: FluentTheme.of(context).typography.subtitle,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Selected item index: ${documents.documents[documents.current].selectedItemIndex}',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
