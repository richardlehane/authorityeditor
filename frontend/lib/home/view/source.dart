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
      child: SourceTextWidget(
        content: documents.documents[documents.current].toString(),
      ),
    );
  }
}

class SourceTextWidget extends StatefulWidget {
  final String? content;

  const SourceTextWidget({super.key, required this.content});

  @override
  State<SourceTextWidget> createState() => _SourceTextWidgetState();
}

class _SourceTextWidgetState extends State<SourceTextWidget> {
  late TextEditingController twcontroller;

  @override
  void initState() {
    super.initState();
    twcontroller = TextEditingController(text: widget.content);
  }

  @override
  void dispose() {
    twcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextBox(controller: twcontroller, maxLines: null);
  }
}
