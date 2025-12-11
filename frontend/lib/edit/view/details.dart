import 'package:authorityeditor/edit/widgets/multi/linkedto.dart';
import 'package:authorityeditor/edit/widgets/simple.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/multi/id.dart';
import '../widgets/multi/comments.dart';
import '../widgets/multi/status.dart';
import '../widgets/daterange.dart';

class DetailsView extends ConsumerWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Center(
          child: Text(
            "Authority details",
            style: FluentTheme.of(context).typography.subtitle,
          ),
        ),

        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: SimpleText(label: "Title", name: "AuthorityTitle"),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              Expanded(child: SimpleText(label: "Scope", name: "Scope")),
              Padding(padding: EdgeInsets.only(left: 5.0), child: DateRange()),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Ids(),
        ),
        const Divider(),
        Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Status(),
        ),
        const Divider(),
        Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: LinkedTo(),
        ),
        const Divider(),
        Padding(padding: EdgeInsets.only(top: 10.0), child: Comments()),
      ],
    );
  }
}
