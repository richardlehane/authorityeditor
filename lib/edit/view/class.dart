import 'package:authorityeditor/edit/provider/node_provider.dart';
import 'package:authorityeditor/edit/widgets/markup/markup.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authorityeditor/edit/widgets/simple.dart';
import '../widgets/multi/disposal.dart';

class ClassView extends ConsumerWidget {
  const ClassView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Class",
                style: FluentTheme.of(context).typography.subtitle,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SimpleText(
                    element: false,
                    label: "Number",
                    name: "itemno",
                    placeholder: "0.0.0",
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
                key: ValueKey(ref.read(nodeProvider).reference),
                paras: ref.read(nodeProvider).getParagraphs("ClassDescription"),
                cb:
                    (paras) => ref
                        .read(nodeProvider)
                        .setParagraphs("ClassDescription", paras),
              ),
            ),
          ),
          SizedBox(
            height: 180.0,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Disposal(key: ValueKey(ref.read(nodeProvider).reference)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: InfoLabel(
              label: 'Justification',
              child: Markup(
                key: ValueKey(ref.read(nodeProvider).reference),
                paras: ref.read(nodeProvider).getParagraphs("Justification"),
                cb:
                    (paras) => ref
                        .read(nodeProvider)
                        .setParagraphs("Justification", paras),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Expander(
              header: Text('Additional fields'),
              content: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SimpleText(
                          element: true,
                          label: "Title",
                          name: "ClassTitle",
                          placeholder: "Not recommended for classes",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
