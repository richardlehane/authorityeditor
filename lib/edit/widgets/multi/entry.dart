import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MultiEntry extends ConsumerStatefulWidget {
  final Widget Function(BuildContext context, WidgetRef ref) formFn;
  final Widget Function(BuildContext context, WidgetRef ref) viewFn;

  const MultiEntry({
    super.key,
    required this.formFn,
    required this.viewFn,
  }); //, this.elements});

  @override
  ConsumerState<MultiEntry> createState() => _MultiEntryState();
}

class _MultiEntryState extends ConsumerState<MultiEntry> {
  bool checked = false;

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
              firstChild: widget.formFn(context, ref),
              secondChild: widget.viewFn(context, ref),
              crossFadeState:
                  checked
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
            ),
          ),
        ),
      ],
    );
  }
}
