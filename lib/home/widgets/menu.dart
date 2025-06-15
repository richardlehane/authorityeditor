import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:authorityeditor/home/provider/documents_provider.dart';

final class AuthorityCommand extends ConsumerWidget {
  const AuthorityCommand({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final documents = ref.watch(documentsProvider);
    return MenuBar(
      items: [
        MenuBarItem(
          title: 'File',
          items: [
            MenuFlyoutItem(
              text: const Text('New'),
              onPressed: () {
                ref.read(documentsProvider.notifier).newDocument();
              },
            ),
            MenuFlyoutItem(
              text: const Text('Open'),
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  withData: true,
                );
                if (result != null) {
                  ref.read(documentsProvider.notifier).load(result.files.first);
                }
              },
            ),
            MenuFlyoutItem(text: const Text('Save'), onPressed: () {}),
            const MenuFlyoutSeparator(),
            MenuFlyoutItem(text: const Text('Exit'), onPressed: () {}),
          ],
        ),
        // MenuBarItem(
        //   title: 'Edit',
        //   items: [
        //     MenuFlyoutItem(text: const Text('Undo'), onPressed: () {}),
        //     MenuFlyoutItem(text: const Text('Cut'), onPressed: () {}),
        //     MenuFlyoutItem(text: const Text('Copy'), onPressed: () {}),
        //     MenuFlyoutItem(text: const Text('Paste'), onPressed: () {}),
        //   ],
        // ),
        MenuBarItem(
          title: 'View',
          items: [
            RadioMenuFlyoutItem<String>(
              text: const Text('Edit view'),
              value: 'edit',
              groupValue:
                  ref
                      .watch(documentsProvider)
                      .documents[documents.current]
                      .view
                      .toString(),
              onChanged:
                  (value) =>
                      ref.read(documentsProvider.notifier).viewChanged(value),
            ),
            RadioMenuFlyoutItem<String>(
              text: const Text('Source view'),
              value: 'source',
              groupValue:
                  ref
                      .watch(documentsProvider)
                      .documents[documents.current]
                      .view
                      .toString(),
              onChanged:
                  (value) =>
                      ref.read(documentsProvider.notifier).viewChanged(value),
            ),
          ],
        ),
        // MenuBarItem(
        //   title: 'Help',
        //   items: [MenuFlyoutItem(text: const Text('About'), onPressed: () {})],
        // ),
      ],
    );
  }
}
