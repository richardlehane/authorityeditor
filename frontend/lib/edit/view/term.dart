import 'package:authorityeditor/edit/provider/node_provider.dart';
import 'package:authorityeditor/edit/widgets/markup/markup.dart';
import 'package:authorityeditor/edit/widgets/title.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/multi/comments.dart';
import '../widgets/multi/id.dart';
import '../widgets/multi/linkedto.dart';
import '../widgets/multi/seeref.dart';

const termTypes = [
  "",
  "function",
  "activity",
  "subfunction",
  "subactivity",
  "series",
  "subject",
];

class TermView extends ConsumerWidget {
  const TermView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentNode = ref.watch(nodeProvider);
    final updated = currentNode.get("update");
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey[10],
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        "Term",
                        style: FluentTheme.of(context).typography.subtitle,
                      ),
                    ),
                  ),
                  (updated == null)
                      ? SizedBox(width: 94.0)
                      : Text(
                        'Updated: $updated',
                        style: TextStyle(
                          color: Colors.grey[90],
                          fontSize: 10.0,
                        ),
                      ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 10.0),
                  child: InfoLabel(
                    label: 'Type',
                    child: ComboBox<String>(
                      value: currentNode.get("type"),
                      items:
                          termTypes.map((e) {
                            return ComboBoxItem(value: e, child: Text(e));
                          }).toList(),
                      onChanged:
                          (String? val) =>
                              currentNode.set("type", (val == null) ? "" : val),
                    ),
                  ),
                ),
                Expanded(child: NodeTitle()),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: InfoLabel(
                label: 'Description',
                child: Markup(
                  paras: currentNode.getParagraphs("TermDescription"),
                  cb:
                      (paras) =>
                          currentNode.setParagraphs("TermDescription", paras),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10.0), child: SeeReference()),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Expander(
                header: Text('ID numbers'),
                content: SizedBox(
                  height: 300.0,
                  width: 380.0,
                  child: Padding(padding: EdgeInsets.all(10.0), child: Ids()),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Expander(
                header: Text('Linked to'),
                content: SizedBox(
                  height: 300.0,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: LinkedTo(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 350.0,
              child: Padding(padding: EdgeInsets.all(10.0), child: Comments()),
            ),
          ],
        ),
      ),
    );
  }
}
