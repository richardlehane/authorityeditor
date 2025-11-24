import 'package:authorityeditor/authority/src/tree.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authorityeditor/home/provider/documents_provider.dart';
import 'package:authorityeditor/authority/authority.dart';

class ReviewPage extends ConsumerWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final documents = ref.watch(documentsProvider);
    final len = termClassLen(documents.documents[documents.current].treeItems);
    return ListView.builder(
      itemCount: len,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Row(
            children: [
              Expanded(flex: 1, child: Text("Number")),
              Expanded(flex: 2, child: Text("Title")),
              Expanded(flex: 3, child: Text("Description")),
              Expanded(flex: 2, child: Text("Disposal")),
              Expanded(flex: 3, child: Text("Justification")),
              Expanded(flex: 2, child: Text("Comments")),
            ],
          );
        }
        return Row(
          children: [
            Expanded(flex: 1, child: Text("Number")),
            Expanded(flex: 2, child: Text("Title")),
            Expanded(flex: 3, child: Text("Description")),
            Expanded(flex: 2, child: Text("Disposal")),
            Expanded(flex: 3, child: Text("Justification")),
            Expanded(flex: 2, child: Text("Comments")),
          ],
        );
      },
    );
  }
}
