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
  final String? sub;
  final bool blank; // this multi widget should add a new entry if empty
  const Multi({
    super.key,
    required this.label,
    required this.element,
    this.blank = false,
    this.sub,
  });

  Widget Function(BuildContext, WidgetRef, int flags, Function(int) cb)
  makeForm(int idx, int len) {
    Widget formf(
      BuildContext context,
      WidgetRef ref,
      int flags,
      Function(int) cb,
    ) {
      return SizedBox(
        height: 40.0,
        width: 100.0,
        child: TextBox(
          controller: TextEditingController(
            text: ref.read(nodeProvider).multiGet(element, idx, sub),
          ),
        ),
      );
    }

    return formf;
  }

  Widget Function(BuildContext, WidgetRef) makeView(int idx, int len) {
    Widget viewf(BuildContext context, WidgetRef ref) {
      return SizedBox(
        height: 40.0,
        width: 100.0,
        child: TextBox(
          placeholder: ref.watch(nodeProvider).multiGet(element, idx, sub),
          readOnly: true,
        ),
      );
    }

    return viewf;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int l = ref.watch(nodeProvider).multiLen(element);
    if (blank && l == 0) {
      ref.read(nodeProvider).multiAdd(element, sub);
      l = 1;
    }
    return InfoLabel(
      label: label,
      child: ListView.builder(
        itemCount: l + 1, // add one for the plus button
        itemBuilder: (BuildContext context, int index) {
          if (index >= l) {
            return IconButton(
              icon: Icon(
                FluentIcons.add,
                size: 24.0,
                color: FluentTheme.of(context).accentColor,
              ),
              onPressed:
                  () => ref.read(nodeProvider.notifier).multiAdd(element, sub),
            );
          }
          return MultiEntry(
            key: UniqueKey(),
            element: element,
            index: index,
            len: l,
            formFn: makeForm(index, l),
            viewFn: makeView(index, l),
          );
        },
      ),
    );
  }
}
