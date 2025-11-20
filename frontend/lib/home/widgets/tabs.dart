import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authorityeditor/home/provider/documents_provider.dart';

import 'package:authorityeditor/home/view/source.dart';
import 'package:authorityeditor/edit/view/edit.dart';

import 'package:authorityeditor/authority/authority.dart'
    as authority
    show View;

final class DocumentTabs extends ConsumerWidget {
  const DocumentTabs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final documents = ref.watch(documentsProvider);
    return TabView(
      tabWidthBehavior: TabWidthBehavior.sizeToContent,
      closeButtonVisibility: CloseButtonVisibilityMode.always,
      currentIndex: documents.current,
      onChanged: (index) {
        ref.read(documentsProvider.notifier).paneChanged(index);
      },
      onNewPressed: () {
        ref.read(documentsProvider.notifier).newDocument();
      },
      tabs: List.generate(documents.documents.length, (index) {
        return Tab(
          text: Text(documents.documents[index].title),
          onClosed: () {
            ref.read(documentsProvider.notifier).drop(index);
          },
          body: switch (documents.documents[index].view) {
            authority.View.edit => EditPage(),
            authority.View.source => SourcePage(),
          },
        );
      }),
    );
  }
}
