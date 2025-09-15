import 'package:authorityeditor/edit/widgets/multi/linkedto.dart';
import 'package:authorityeditor/edit/widgets/simple.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/multi/id.dart';
import '../widgets/multi/comments.dart';

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
                    child: SimpleText(
                      element: true,
                      label: "Title",
                      name: "AuthorityTitle",
                      placeholder: "",
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 10.0, 10.0, 10.0),
                    child: SimpleText(
                      element: true,
                      label: "Scope",
                      name: "Scope",
                      placeholder: "",
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 300.0,
                  width: 380.0,
                  child: Padding(padding: EdgeInsets.all(10.0), child: Ids()),
                ),

                Expanded(
                  child: SizedBox(
                    height: 300.0,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: LinkedTo(),
                    ),
                  ),
                ),
              ],
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
