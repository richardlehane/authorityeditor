import 'package:authorityeditor/edit/provider/node_provider.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TermView extends ConsumerWidget {
  const TermView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentNode = ref.watch(nodeProvider);
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Term",
                style: FluentTheme.of(context).typography.subtitle,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: InfoLabel(
                    label: 'Term name',
                    child: TextBox(
                      placeholder: 'Name',
                      controller: TextEditingController.fromValue(
                        TextEditingValue(text: currentNode.title()),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Expander(
            header: Text('State Records NSW use'),
            content: Text('Private fields here'),
          ),
        ],
      ),
    );
  }
}
