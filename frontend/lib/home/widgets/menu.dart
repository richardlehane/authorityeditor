import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:authorityeditor/home/provider/documents_provider.dart';

final class AuthorityCommand extends ConsumerWidget {
  const AuthorityCommand({super.key});

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
                  withData: kIsWeb,
                );
                if (result != null) {
                  ref.read(documentsProvider.notifier).load(result.files.first);
                }
              },
            ),
            MenuFlyoutItem(text: const Text('Save'), onPressed: () {}),
            MenuFlyoutItem(text: const Text('Save as'), onPressed: () {}),
            if (!kIsWeb) MenuFlyoutSeparator(),
            if (!kIsWeb)
              MenuFlyoutItem(text: const Text('Exit'), onPressed: () {}),
          ],
        ),

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
        if (!kIsWeb)
          MenuBarItem(
            title: 'Edit',
            items: [
              //  MenuFlyoutItem(text: const Text('Undo'), onPressed: () {}),
              //  MenuFlyoutItem(text: const Text('Redo'), onPressed: () {}),
              MenuFlyoutItem(
                text: const Text('Capitalize functions'),
                onPressed: () {},
              ),
              MenuFlyoutItem(
                text: const Text('Number classes'),
                onPressed: () {},
              ),
              MenuFlyoutItem(
                text: const Text('Sort see references'),
                onPressed: () {},
              ),
              MenuFlyoutItem(text: const Text('Sort terms'), onPressed: () {}),
              MenuFlyoutItem(
                text: const Text('Clear comments (all)'),
                onPressed: () {},
              ),
              MenuFlyoutItem(
                text: const Text('Clear comments (agency)'),
                onPressed: () {},
              ),
              MenuFlyoutItem(
                text: const Text('Clear comments (SRNSW)'),
                onPressed: () {},
              ),
            ],
          ),
        if (!kIsWeb)
          MenuBarItem(
            title: 'Preview',
            items: [
              MenuFlyoutItem(text: const Text('Authority'), onPressed: () {}),
              MenuFlyoutItem(text: const Text('Comments'), onPressed: () {}),
              MenuFlyoutItem(
                text: const Text('Broken links'),
                onPressed: () {},
              ),
              MenuFlyoutItem(text: const Text('Index'), onPressed: () {}),
              MenuFlyoutItem(
                text: const Text('Linking table'),
                onPressed: () {},
              ),
              MenuFlyoutItem(
                text: const Text('Retention order'),
                onPressed: () {},
              ),
              MenuFlyoutItem(text: const Text('Recent'), onPressed: () {}),
              MenuFlyoutItem(text: const Text('Summary'), onPressed: () {}),
              MenuFlyoutItem(text: const Text('Supporting'), onPressed: () {}),
            ],
          ),
        if (!kIsWeb)
          MenuBarItem(
            title: 'Export',
            items: [
              MenuFlyoutItem(
                leading: const Icon(FluentIcons.text_document),
                text: const Text('Appraisal report'),
                onPressed: () {},
              ),
              MenuFlyoutItem(
                leading: const Icon(FluentIcons.text_document),
                text: const Text('Appraisal report pt 1'),
                onPressed: () {},
              ),
              MenuFlyoutItem(
                leading: const Icon(FluentIcons.text_document),
                text: const Text('Approved authority'),
                onPressed: () {},
              ),
              MenuFlyoutItem(
                leading: const Icon(FluentIcons.text_document),
                text: const Text('Draft authority'),
                onPressed: () {},
              ),
              MenuFlyoutItem(
                leading: const Icon(FluentIcons.text_document),
                text: const Text('Comments'),
                onPressed: () {},
              ),
              MenuFlyoutItem(
                leading: const Icon(FluentIcons.text_document),
                text: const Text('Consultation'),
                onPressed: () {},
              ),
              MenuFlyoutItem(
                leading: const Icon(FluentIcons.text_document),
                text: const Text('Index'),
                onPressed: () {},
              ),
              const MenuFlyoutSeparator(),
              MenuFlyoutItem(
                leading: const Icon(FluentIcons.excel_document),
                text: const Text('Clean agency'),
                onPressed: () {},
              ),
              MenuFlyoutItem(
                leading: const Icon(FluentIcons.excel_document),
                text: const Text('Clean publication'),
                onPressed: () {},
              ),
              MenuFlyoutItem(
                leading: const Icon(FluentIcons.excel_document),
                text: const Text('Tab separated'),
                onPressed: () {},
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
