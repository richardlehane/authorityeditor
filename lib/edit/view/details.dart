import 'package:authorityeditor/edit/provider/node_provider.dart';
import 'package:authorityeditor/edit/widgets/markup/markup.dart';
import 'package:authorityeditor/edit/widgets/simple.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsView extends ConsumerWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentNode = ref.watch(nodeProvider);
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
            Padding(
              padding: EdgeInsets.fromLTRB(5.0, 10.0, 10.0, 10.0),
              child: SimpleText(
                element: true,
                label: "Title",
                name: "AuthorityTitle",
                placeholder: "",
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5.0, 10.0, 10.0, 10.0),
              child: SimpleText(
                element: true,
                label: "Scope",
                name: "Scope",
                placeholder: "",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
