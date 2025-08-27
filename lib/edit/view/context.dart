import 'package:authorityeditor/edit/provider/node_provider.dart';
import 'package:authorityeditor/edit/widgets/markup/markup.dart';
import 'package:authorityeditor/edit/widgets/simple.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const contextTypes = ["", "supporting documentation"];

class ContextView extends ConsumerWidget {
  const ContextView({super.key});

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
                "Context",
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
                        contextTypes.map((e) {
                          return ComboBoxItem(value: e, child: Text(e));
                        }).toList(),
                    onChanged:
                        (String? val) =>
                            currentNode.set("type", (val == null) ? "" : val),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5.0, 10.0, 10.0, 10.0),
                  child: SimpleText(
                    element: true,
                    label: "Context Title",
                    name: "ContextTitle",
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
                height: 300.0,
                paras: currentNode.getParagraphs("ContextDescription"),
                cb:
                    (paras) =>
                        currentNode.setParagraphs("ContextDescription", paras),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
