import 'package:authorityeditor/edit/provider/node_provider.dart';
import 'package:authorityeditor/edit/widgets/markup/markup.dart';
import 'package:authorityeditor/edit/widgets/multi/seeref.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authorityeditor/edit/widgets/title.dart';
import '../widgets/multi/disposal.dart';
import '../widgets/multi/id.dart';
import '../widgets/multi/linkedto.dart';
import '../widgets/multi/status.dart';
import '../widgets/multi/comments.dart';
import '../widgets/daterange.dart';

class ClassView extends ConsumerWidget {
  const ClassView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final node = ref.watch(nodeProvider);
    final updated = node.get("update");
    return Column(
      children: [
        Row(
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
                  style: TextStyle(color: Colors.grey[90], fontSize: 10.0),
                ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: NodeTitle(term: false),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: InfoLabel(
            label: 'Description',
            child: Markup(
              paras: node.getParagraphs("ClassDescription"),
              cb: (paras) => node.setParagraphs("ClassDescription", paras),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: SeeReference(
            label: 'See references (not recommended for classes)',
          ),
        ),
        const Divider(),
        Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Disposal(),
        ),
        const Divider(),
        Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: InfoLabel(
            label: 'Justification',
            child: Markup(
              paras: node.getParagraphs("Justification"),
              cb: (paras) => node.setParagraphs("Justification", paras),
              justification: true,
            ),
          ),
        ),
        const Divider(),
        Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: LinkedTo(),
        ),
        const Divider(),
        Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Comments(),
        ),
        Expander(
          header: Text(
            "State Records' use (Date range, ID numbers and Status events)",
          ),
          content: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: DateRange(),
              ),
              const Divider(),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Ids(),
              ),
              const Divider(),
              Padding(padding: EdgeInsets.only(top: 10.0), child: Status()),
            ],
          ),
        ),
      ],
    );
  }
}
