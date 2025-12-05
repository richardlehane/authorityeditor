import 'package:authorityeditor/edit/provider/node_provider.dart';
import 'package:authorityeditor/edit/widgets/markup/markup.dart';
import 'package:authorityeditor/edit/widgets/context_title.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/multi/source.dart';
import '../widgets/multi/comments.dart';

const contextTypes = ["appraisal report", "background", "issue"];

class ContextView extends ConsumerWidget {
  const ContextView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentNode = ref.watch(nodeProvider);
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  "Context",
                  style: FluentTheme.of(context).typography.subtitle,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 10.0),
                    child: InfoLabel(
                      label: 'Type',
                      child: EditableComboBox<String>(
                        value: currentNode.get("type") ?? "",
                        items:
                            contextTypes.map((e) {
                              return ComboBoxItem(value: e, child: Text(e));
                            }).toList(),
                        onChanged:
                            (String? val) => currentNode.set("type", val),
                        onFieldSubmitted: (text) {
                          currentNode.set("type", text);
                          return text;
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 10.0, 10.0, 10.0),
                    child: ContextTitle(),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: InfoLabel(
                label: 'Description',
                child: Markup(
                  height: 350.0,
                  paras: currentNode.getParagraphs("ContextContent"),
                  cb:
                      (paras) =>
                          currentNode.setParagraphs("ContextContent", paras),
                ),
              ),
            ),
            SizedBox(
              height: 350.0,
              child: Padding(padding: EdgeInsets.all(10.0), child: Source()),
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
