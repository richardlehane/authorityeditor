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
    return SingleChildScrollView(
      child: Container(
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
            NodeTitle(term: false),
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
            SizedBox(
              height: 350.0,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Comments(key: key),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
