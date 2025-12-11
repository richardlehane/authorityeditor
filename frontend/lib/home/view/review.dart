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
    final tree = documents.documents[documents.current].treeItems;
    final len = termClassLen(tree);
    final filtered = documents.documents[documents.current].query != null;
    final double height =
        MediaQuery.sizeOf(context).height - ((filtered) ? 156.5 : 108.5);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.grey[20],
            border: Border(bottom: BorderSide(color: Colors.grey[80])),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: const Text(
                  "Number",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 2,
                child: const Text(
                  "Title",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 3,
                child: const Text(
                  "Description",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 2,
                child: const Text(
                  "Disposal",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 3,
                child: const Text(
                  "Justification",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 2,
                child: const Text(
                  "Comments",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height,
          child: ListView.builder(
            itemCount: len,
            itemBuilder: (context, index) {
              final ti =
                  filtered
                      ? tree![index] // can't be null if we have an index
                      : treeNth((NodeType.termType, index), tree);
              if (ti == null) return Row();
              final node = documents.documents[documents.current].asCurrent(
                ti.value,
              );
              return GestureDetector(
                onDoubleTap: () {
                  unmarkSelected(
                    documents.documents[documents.current].treeItems,
                    documents.documents[documents.current].selected,
                  );
                  markSelected(
                    documents.documents[documents.current].treeItems,
                    ti.value,
                  );
                  documents.documents[documents.current].selected = ti.value;
                  ref.read(documentsProvider.notifier).viewChanged("edit");
                },
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        (ti.value.$1 == NodeType.termType)
                            ? Colors.grey[20]
                            : Colors.grey[10],
                    border: Border(bottom: BorderSide(color: Colors.grey[40])),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsetsGeometry.all(5.0),
                          child: Text(node.get("itemno") ?? ""),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsetsGeometry.all(5.0),
                          child: RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: node.title(ti.value.$1),
                            ),
                            maxLines: null,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsetsGeometry.all(5.0),
                          child: RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: node.description(ti.value.$1),
                            ),
                            maxLines: null,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsetsGeometry.all(5.0),
                          child: RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: node.disposals(ti.value.$1),
                            ),
                            maxLines: null,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsetsGeometry.all(5.0),
                          child: RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: node.justification(ti.value.$1),
                            ),
                            maxLines: null,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsetsGeometry.all(5.0),
                          child: RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: node.comments(),
                            ),
                            maxLines: null,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
