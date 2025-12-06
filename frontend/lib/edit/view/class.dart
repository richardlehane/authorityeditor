import 'package:authorityeditor/edit/provider/node_provider.dart';
import 'package:authorityeditor/edit/widgets/markup/markup.dart';
import 'package:authorityeditor/edit/widgets/multi/seeref.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authorityeditor/edit/widgets/title.dart';
import '../widgets/multi/disposal.dart';
import '../widgets/multi/id.dart';
import '../widgets/multi/linkedto.dart';
import '../widgets/multi/comments.dart';

class ClassView extends ConsumerWidget {
  const ClassView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final node = ref.watch(nodeProvider);
    final updated = node.get("update");
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
                        "Class",
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
            NodeTitle(key: key, term: false),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: InfoLabel(
                label: 'Description',
                child: Markup(
                  key: key,
                  paras: node.getParagraphs("ClassDescription"),
                  cb: (paras) => node.setParagraphs("ClassDescription", paras),
                ),
              ),
            ),

            Padding(padding: EdgeInsets.all(10.0), child: Disposal(key: key)),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: InfoLabel(
                label: 'Justification',
                child: Markup(
                  key: key,
                  paras: node.getParagraphs("Justification"),
                  cb: (paras) => node.setParagraphs("Justification", paras),
                  justification: true,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Expander(
                header: Text('See references (not recommended for classes)'),
                content: SeeReference(),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10.0),
              child: Expander(
                header: Text('ID numbers'),
                content: SizedBox(
                  height: 300.0,
                  width: 380.0,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Ids(key: key),
                  ),
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
                    child: LinkedTo(key: key),
                  ),
                ),
              ),
            ),

            Padding(padding: EdgeInsets.all(10.0), child: Comments(key: key)),
          ],
        ),
      ),
    );
  }
}
