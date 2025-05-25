import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:authority/home/provider/documents_provider.dart';

final class AuthorityCommand extends ConsumerWidget {
  const AuthorityCommand({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        MenuBarItem(
          title: 'Edit',
          items: [
            MenuFlyoutItem(text: const Text('Undo'), onPressed: () {}),
            MenuFlyoutItem(text: const Text('Cut'), onPressed: () {}),
            MenuFlyoutItem(text: const Text('Copy'), onPressed: () {}),
            MenuFlyoutItem(text: const Text('Paste'), onPressed: () {}),
          ],
        ),
        MenuBarItem(
          title: 'View',
          items: [
            MenuFlyoutItem(text: const Text('Output'), onPressed: () {}),
            const MenuFlyoutSeparator(),
            RadioMenuFlyoutItem<String>(
              text: const Text('Landscape'),
              value: 'landscape',
              groupValue: 'landscape',
              onChanged: (value) {},
            ),
            RadioMenuFlyoutItem<String>(
              text: const Text('Portrait'),
              value: 'portrait',
              groupValue: 'landscape',
              onChanged: (value) {},
            ),
            const MenuFlyoutSeparator(),
            RadioMenuFlyoutItem<String>(
              text: const Text('Small icons'),
              value: 'small_icons',
              groupValue: 'medium_icons',
              onChanged: (value) {},
            ),
            RadioMenuFlyoutItem<String>(
              text: const Text('Medium icons'),
              value: 'medium_icons',
              groupValue: 'medium_icons',
              onChanged: (value) {},
            ),
            RadioMenuFlyoutItem<String>(
              text: const Text('Large icons'),
              value: 'large_icons',
              groupValue: 'medium_icons',
              onChanged: (value) {},
            ),
          ],
        ),
        MenuBarItem(
          title: 'Help',
          items: [MenuFlyoutItem(text: const Text('About'), onPressed: () {})],
        ),
      ],
    );
  }
}
