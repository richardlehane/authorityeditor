import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authority/home/provider/documents_provider.dart';
import 'package:authority/edit/view/edit.dart';

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
          body: EditPage(),
        );
      }),
    );
  }
}
