import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart' show ServicesBinding;
import 'dart:ui' show AppExitType;
import 'package:open_file/open_file.dart';
import 'package:authorityeditor/home/provider/documents_provider.dart';
import 'package:authorityeditor/authority/authority.dart';
import 'package:flutter/services.dart' show rootBundle;

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
                  type: FileType.custom,
                  allowedExtensions: ["xml"],
                  withData: kIsWeb,
                );
                if (result != null) {
                  ref.read(documentsProvider.notifier).load(result.files.first);
                }
              },
            ),
            if (kIsWeb)
              MenuFlyoutItem(
                text: const Text('Open example'),
                onPressed: () async {
                  final example = await rootBundle.load(
                    'assets/SRNSW_example.xml',
                  );
                  final f = PlatformFile(
                    name: "example.xml",
                    size: example.lengthInBytes,
                    bytes: example.buffer.asUint8List(),
                  );
                  ref.read(documentsProvider.notifier).load(f);
                },
              ),
            MenuFlyoutItem(
              text: const Text('Download'),
              onPressed: () async {
                final doc =
                    ref.read(documentsProvider).documents[documents.current];
                await FilePicker.platform.saveFile(
                  fileName:
                      (doc.title == "Untitled") ? "document.xml" : doc.title,
                  bytes: doc.bytes(),
                );
              },
            ),
            if (!kIsWeb)
              MenuFlyoutItem(
                text: const Text('Save'),
                onPressed: () async {
                  if (ref
                          .watch(documentsProvider)
                          .documents[documents.current]
                          .path ==
                      null) {
                    String? path = await FilePicker.platform.saveFile(
                      dialogTitle: 'Please select an output file:',
                      type: FileType.custom,
                      allowedExtensions: ["xml"],
                    );
                    ref
                        .read(documentsProvider)
                        .documents[documents.current]
                        .saveAs(path);
                  } else {
                    ref
                        .read(documentsProvider)
                        .documents[documents.current]
                        .save();
                  }
                },
              ),
            if (!kIsWeb)
              MenuFlyoutItem(
                text: const Text('Save as'),
                onPressed: () async {
                  String? path = await FilePicker.platform.saveFile(
                    dialogTitle: 'Please select an output file:',
                    type: FileType.custom,
                    allowedExtensions: ["xml"],
                  );
                  ref
                      .read(documentsProvider)
                      .documents[documents.current]
                      .saveAs(path);
                },
              ),
            if (!kIsWeb) MenuFlyoutSeparator(),
            if (!kIsWeb)
              MenuFlyoutItem(
                text: const Text('Exit'),
                onPressed: () async {
                  await ServicesBinding.instance.exitApplication(
                    AppExitType.cancelable,
                  );
                },
              ),
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
              text: const Text('Review view'),
              value: 'review',
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
            const MenuFlyoutSeparator(),
            MenuFlyoutItem(
              leading: const Icon(FluentIcons.search),
              text: const Text('Apply filter'),
              onPressed: () async {
                Navigator.of(context).pop();
                final query = await queryDialog(context);
                if (query != null) {
                  if (!ref
                          .read(documentsProvider.notifier)
                          .applyFilter(query) &&
                      context.mounted) {
                    await displayInfoBar(
                      context,
                      duration: Duration(seconds: 1),
                      builder: (context, close) {
                        return InfoBar(
                          title: const Text('Filter: '),
                          content: const Text('No results'),
                          action: IconButton(
                            icon: const WindowsIcon(WindowsIcons.clear),
                            onPressed: close,
                          ),
                          severity: InfoBarSeverity.error,
                        );
                      },
                    );
                  }
                }
              },
            ),
          ],
        ),
        if (!kIsWeb)
          MenuBarItem(
            title: 'Edit',
            items: [
              MenuFlyoutItem(
                text: const Text('Capitalize functions'),
                onPressed: () {
                  ref
                      .read(documentsProvider.notifier)
                      .edit("edit_capitalize.xsl");
                },
              ),
              MenuFlyoutItem(
                text: const Text('Number classes'),
                onPressed: () {
                  ref
                      .read(documentsProvider.notifier)
                      .edit("edit_numberitems.xsl");
                },
              ),
              MenuFlyoutItem(
                text: const Text('Sort see references'),
                onPressed: () {
                  ref
                      .read(documentsProvider.notifier)
                      .edit("edit_sortseerefs.xsl");
                },
              ),
              MenuFlyoutItem(
                text: const Text('Sort terms'),
                onPressed: () {
                  ref
                      .read(documentsProvider.notifier)
                      .edit("edit_sortterms.xsl");
                },
              ),
              MenuFlyoutItem(
                text: const Text('Clear comments (all)'),
                onPressed: () {
                  ref
                      .read(documentsProvider.notifier)
                      .edit("edit_clear_comments.xsl");
                },
              ),
              MenuFlyoutItem(
                text: const Text('Clear comments (agency)'),
                onPressed: () {
                  ref
                      .read(documentsProvider.notifier)
                      .edit("edit_clearagency.xsl");
                },
              ),
              MenuFlyoutItem(
                text: const Text('Clear comments (SRNSW)'),
                onPressed: () {
                  ref
                      .read(documentsProvider.notifier)
                      .edit("edit_clearsrnsw.xsl");
                },
              ),
            ],
          ),
        if (!kIsWeb)
          MenuBarItem(
            title: 'Preview',
            items: [
              MenuFlyoutItem(
                text: const Text('Authority'),
                onPressed: () {
                  final filePath = ref
                      .read(documentsProvider)
                      .documents[documents.current]
                      .transform("preview_authority.xsl", "html");
                  OpenFile.open(filePath);
                },
              ),
              MenuFlyoutItem(
                text: const Text('Comments'),
                onPressed: () {
                  final filePath = ref
                      .read(documentsProvider)
                      .documents[documents.current]
                      .transform("preview_comments.xsl", "html");
                  OpenFile.open(filePath);
                },
              ),
              MenuFlyoutItem(
                text: const Text('Broken links'),
                onPressed: () {
                  final filePath = ref
                      .read(documentsProvider)
                      .documents[documents.current]
                      .transform("preview_broken_links.xsl", "html");
                  OpenFile.open(filePath);
                },
              ),
              MenuFlyoutItem(
                text: const Text('Index'),
                onPressed: () {
                  final filePath = ref
                      .read(documentsProvider)
                      .documents[documents.current]
                      .transform("preview_index.xsl", "html");
                  OpenFile.open(filePath);
                },
              ),
              MenuFlyoutItem(
                text: const Text('Linking table'),
                onPressed: () {
                  final filePath = ref
                      .read(documentsProvider)
                      .documents[documents.current]
                      .transform("preview_linking_table.xsl", "html");
                  OpenFile.open(filePath);
                },
              ),
              MenuFlyoutItem(
                text: const Text('Retention order'),
                onPressed: () {
                  final filePath = ref
                      .read(documentsProvider)
                      .documents[documents.current]
                      .transform("preview_retention_order.xsl", "html");
                  OpenFile.open(filePath);
                },
              ),
              MenuFlyoutItem(
                text: const Text('Recent'),
                onPressed: () {
                  final filePath = ref
                      .read(documentsProvider)
                      .documents[documents.current]
                      .transform("preview_recent.xsl", "html");
                  OpenFile.open(filePath);
                },
              ),
              MenuFlyoutItem(
                text: const Text('Summary'),
                onPressed: () {
                  final filePath = ref
                      .read(documentsProvider)
                      .documents[documents.current]
                      .transform("preview_summary.xsl", "html");
                  OpenFile.open(filePath);
                },
              ),
              MenuFlyoutItem(
                text: const Text('Supporting'),
                onPressed: () {
                  final filePath = ref
                      .read(documentsProvider)
                      .documents[documents.current]
                      .transform("preview_supporting.xsl", "html");
                  OpenFile.open(filePath);
                },
              ),
            ],
          ),
        if (!kIsWeb)
          MenuBarItem(
            title: 'Export',
            items: [
              MenuFlyoutItem(
                leading: const Icon(FluentIcons.text_document),
                text: const Text('Appraisal report'),
                onPressed: () {
                  final filePath = ref
                      .read(documentsProvider)
                      .documents[documents.current]
                      .transform("word_appraisal_report.xsl", "doc");
                  OpenFile.open(filePath);
                },
              ),
              MenuFlyoutItem(
                leading: const Icon(FluentIcons.text_document),
                text: const Text('Appraisal report pt 1'),
                onPressed: () {
                  final filePath = ref
                      .read(documentsProvider)
                      .documents[documents.current]
                      .transform("word_appraisal_report_pt1.xsl", "doc");
                  OpenFile.open(filePath);
                },
              ),
              MenuFlyoutItem(
                leading: const Icon(FluentIcons.text_document),
                text: const Text('Approved authority'),
                onPressed: () {
                  final filePath = ref
                      .read(documentsProvider)
                      .documents[documents.current]
                      .transform("word_approved_authority.xsl", "doc");
                  OpenFile.open(filePath);
                },
              ),
              MenuFlyoutItem(
                leading: const Icon(FluentIcons.text_document),
                text: const Text('Draft authority'),
                onPressed: () {
                  final filePath = ref
                      .read(documentsProvider)
                      .documents[documents.current]
                      .transform("word_draft_authority.xsl", "doc");
                  OpenFile.open(filePath);
                },
              ),
              MenuFlyoutItem(
                leading: const Icon(FluentIcons.text_document),
                text: const Text('Comments'),
                onPressed: () {
                  final filePath = ref
                      .read(documentsProvider)
                      .documents[documents.current]
                      .transform("word_comments.xsl", "doc");
                  OpenFile.open(filePath);
                },
              ),
              MenuFlyoutItem(
                leading: const Icon(FluentIcons.text_document),
                text: const Text('Consultation'),
                onPressed: () {
                  final filePath = ref
                      .read(documentsProvider)
                      .documents[documents.current]
                      .transform("word_consultation.xsl", "doc");
                  OpenFile.open(filePath);
                },
              ),
              MenuFlyoutItem(
                leading: const Icon(FluentIcons.text_document),
                text: const Text('Index'),
                onPressed: () {
                  final filePath = ref
                      .read(documentsProvider)
                      .documents[documents.current]
                      .transform("word_index.xsl", "doc");
                  OpenFile.open(filePath);
                },
              ),
              const MenuFlyoutSeparator(),
              MenuFlyoutItem(
                leading: const Icon(FluentIcons.excel_document),
                text: const Text('Tab separated'),
                onPressed: () {
                  final filePath = ref
                      .read(documentsProvider)
                      .documents[documents.current]
                      .transform("export_tsv.xsl", "tsv");
                  OpenFile.open(filePath, type: "text/tab-separated-values");
                },
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
