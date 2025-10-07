import 'package:authorityeditor/edit/widgets/multi/linkedto.dart';
import 'package:authorityeditor/edit/widgets/simple.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/multi/id.dart';
import '../widgets/multi/comments.dart';
import '../widgets/multi/status.dart';

class DetailsView extends ConsumerWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  "Authority details",
                  style: FluentTheme.of(context).typography.subtitle,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 10.0, 10.0, 10.0),
                    child: SimpleText(label: "Title", name: "AuthorityTitle"),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 10.0, 10.0, 10.0),
                    child: SimpleText(label: "Scope", name: "Scope"),
                  ),
                ),
              ],
            ),
            Ids(),
            Status(),
            LinkedTo(),
            const Divider(),
            Comments(),
          ],
        ),
      ),
    );
  }
}
