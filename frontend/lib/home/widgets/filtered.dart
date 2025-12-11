import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authorityeditor/home/provider/documents_provider.dart';

class Filtered extends ConsumerWidget {
  final ConsumerWidget body;
  const Filtered({super.key, required this.body});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final documents = ref.watch(documentsProvider);
    final query = documents.documents[documents.current].query;
    if (query == null) return body;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(5.0),
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(border: BoxBorder.all(width: 0.5)),
          child: Row(
            children: [
              IconButton(
                icon: Icon(FluentIcons.delete),
                onPressed: () {
                  ref.read(documentsProvider.notifier).clearFilter();
                },
              ),
              const Text(
                "Filtered: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(query.toString()),
            ],
          ),
        ),
        Expanded(child: body),
      ],
    );
  }
}
