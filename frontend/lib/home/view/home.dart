import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authorityeditor/home/widgets/menu.dart';
import 'package:authorityeditor/home/widgets/tabs.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: FluentTheme.of(context).micaBackgroundColor,
      child: Column(
        children: [AuthorityCommand(), Expanded(child: DocumentTabs())],
      ),
    );
  }
}
