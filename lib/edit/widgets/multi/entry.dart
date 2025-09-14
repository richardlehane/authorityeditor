import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/node_provider.dart';

class MultiEntry extends ConsumerStatefulWidget {
  final String element;
  final int index;
  final int len;
  final Widget Function(
    BuildContext context,
    WidgetRef ref,
    int flags,
    Function(int) cb,
  )
  formFn;
  final Widget Function(BuildContext context, WidgetRef ref) viewFn;

  const MultiEntry({
    super.key,
    required this.element,
    required this.index,
    required this.len,
    required this.formFn,
    required this.viewFn,
  }); //, this.elements});

  @override
  ConsumerState<MultiEntry> createState() => _MultiEntryState();
}

class _MultiEntryState extends ConsumerState<MultiEntry> {
  late bool checked;
  int flags = 0;

  @override
  void initState() {
    checked = ref.read(nodeProvider).multiEmpty(widget.element, widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
          child: ToggleSwitch(
            checked: checked,
            onChanged: (v) => setState(() => checked = v),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
            child: AnimatedCrossFade(
              duration: const Duration(milliseconds: 200),
              firstChild: widget.formFn(
                context,
                ref,
                flags,
                (int f) => (setState(() => flags = f)),
              ),
              secondChild: widget.viewFn(context, ref),
              crossFadeState:
                  checked
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
          child: Column(
            children: [
              IconButton(
                icon: Icon(FluentIcons.chevron_up),
                onPressed: () {
                  if (widget.index == 0) return;
                  ref
                      .read(nodeProvider.notifier)
                      .multiUp(widget.element, widget.index);
                },
              ),
              IconButton(
                icon: Icon(FluentIcons.chevron_down),
                onPressed: () {
                  if (widget.index == widget.len - 1) return;
                  ref
                      .read(nodeProvider.notifier)
                      .multiDown(widget.element, widget.index);
                },
              ),
              IconButton(
                icon: Icon(FluentIcons.chrome_close),
                onPressed: () {
                  ref
                      .read(nodeProvider.notifier)
                      .multiDrop(widget.element, widget.index);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
