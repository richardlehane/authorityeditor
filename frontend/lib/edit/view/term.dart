import 'package:authorityeditor/edit/provider/node_provider.dart';
import 'package:authorityeditor/edit/widgets/markup/markup.dart';
import 'package:authorityeditor/edit/widgets/title.dart';
import 'package:authorityeditor/edit/widgets/typecombo.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/multi/comments.dart';
import '../widgets/multi/id.dart';
import '../widgets/multi/linkedto.dart';
import '../widgets/multi/status.dart';
import '../widgets/multi/seeref.dart';
import '../widgets/daterange.dart';

class TermView extends ConsumerWidget {
  const TermView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentNode = ref.watch(nodeProvider);
    final updated = currentNode.get("update");
    return Column(
      children: [
        Row(
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
                  style: TextStyle(color: Colors.grey[90], fontSize: 10.0),
                ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: InfoLabel(label: 'Type', child: TypeCombo()),
              ),
              Expanded(child: NodeTitle()),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.0),
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
        Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: SeeReference(),
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
