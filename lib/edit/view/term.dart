import 'package:authorityeditor/edit/provider/node_provider.dart';
import 'package:authorityeditor/edit/widgets/markup/markup.dart';
import 'package:authorityeditor/edit/widgets/simple.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Text(
                "Term",
                style: FluentTheme.of(context).typography.subtitle,
              ),
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
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                  child: SimpleText(
                    element: false,
                    label: "Number",
                    name: "itemno",
                    placeholder: "0.0.0",
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5.0, 10.0, 10.0, 10.0),
                  child: SimpleText(
                    element: true,
                    label: "Title",
                    name: "TermTitle",
                    placeholder: "",
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: InfoLabel(
              label: 'Description',
              child: Markup(
                key: ValueKey(currentNode.reference),
                paras: currentNode.getParagraphs("TermDescription"),
                cb:
                    (paras) =>
                        currentNode.setParagraphs("TermDescription", paras),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Expander(
              header: Text('Additional fields'),
              content: Text('Private fields here'),
            ),
          ),
        ],
      ),
    );
  }
}
