import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authorityeditor/home/provider/documents_provider.dart';

class SourcePage extends ConsumerWidget {
  const SourcePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final documents = ref.watch(documentsProvider);
    return SizedBox(
      height: 200.0,
      child: TextBox(
        controller: TextEditingController(
          text: documents.documents[documents.current].toString(),
        ),
        maxLines: null,
      ),
    );
  }
}
