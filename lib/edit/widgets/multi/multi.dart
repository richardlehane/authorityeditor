import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'entry.dart';
import '../../provider/node_provider.dart';

// Two types:
// An enclosing tag e.g. Status
// Multiple of the same element as siblings, e.g. comments, source, disposal

class Multi extends ConsumerWidget {
  final String label;
  final String element;
  final String tok;
  const Multi({
    super.key,
    required this.label,
    required this.element,
    this.tok = "",
  });

  Widget Function(BuildContext, WidgetRef) makeForm(int idx) {
    Widget formf(BuildContext context, WidgetRef ref) {
      return SizedBox(
        height: 40.0,
        width: 100.0,
        child: TextBox(
          controller: TextEditingController(
            text: ref.watch(nodeProvider).mGet(element, idx, tok),
          ),
        ),
      );
    }

    return formf;
  }

  Widget Function(BuildContext, WidgetRef) makeView(int idx) {
    Widget viewf(BuildContext context, WidgetRef ref) {
      return SizedBox(
        height: 40.0,
        width: 100.0,
        child: TextBox(
          placeholder: ref.watch(nodeProvider).mGet(element, idx, tok),
          readOnly: true,
        ),
      );
    }

    return viewf;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int l = ref.watch(nodeProvider).mLen(element);
    return InfoLabel(
      label: label,
      child: ListView.builder(
        itemCount: l + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index >= l) {
            return IconButton(
              icon: Icon(
                FluentIcons.add,
                size: 24.0,
                color: FluentTheme.of(context).accentColor,
              ),
              onPressed:
                  () => ref.read(nodeProvider.notifier).multiAdd(element, tok),
            );
          }
          return MultiEntry(formFn: makeForm(index), viewFn: makeView(index));
        },
      ),
    );
  }
}
