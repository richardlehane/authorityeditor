import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/node_provider.dart';

final entryController = FlyoutController();

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

  List<MenuFlyoutItem> _items() {
    if (widget.len == 1) {
      return [
        MenuFlyoutItem(
          leading: Icon(FluentIcons.delete),
          text: Text("Delete"),
          onPressed: () {
            ref
                .read(nodeProvider.notifier)
                .multiDrop(widget.element, widget.index);
          },
        ),
      ];
    }
    if (widget.index == 0) {
      return [
        MenuFlyoutItem(
          leading: Icon(FluentIcons.down),
          text: Text("Move down"),
          onPressed: () {
            ref
                .read(nodeProvider.notifier)
                .multiDown(widget.element, widget.index);
          },
        ),
        MenuFlyoutItem(
          leading: Icon(FluentIcons.delete),
          text: Text("Delete"),
          onPressed: () {
            ref
                .read(nodeProvider.notifier)
                .multiDrop(widget.element, widget.index);
          },
        ),
      ];
    }
    if (widget.index == widget.len - 1) {
      return [
        MenuFlyoutItem(
          leading: Icon(FluentIcons.up),
          text: Text("Move up"),
          onPressed: () {
            ref
                .read(nodeProvider.notifier)
                .multiUp(widget.element, widget.index);
          },
        ),
        MenuFlyoutItem(
          leading: Icon(FluentIcons.delete),
          text: Text("Delete"),
          onPressed: () {
            ref
                .read(nodeProvider.notifier)
                .multiDrop(widget.element, widget.index);
          },
        ),
      ];
    }
    return [
      MenuFlyoutItem(
        leading: Icon(FluentIcons.up),
        text: Text("Move up"),
        onPressed: () {
          ref.read(nodeProvider.notifier).multiUp(widget.element, widget.index);
        },
      ),
      MenuFlyoutItem(
        leading: Icon(FluentIcons.down),
        text: Text("Move down"),
        onPressed: () {
          ref
              .read(nodeProvider.notifier)
              .multiDown(widget.element, widget.index);
        },
      ),
      MenuFlyoutItem(
        leading: Icon(FluentIcons.delete),
        text: Text("Delete"),
        onPressed: () {
          ref
              .read(nodeProvider.notifier)
              .multiDrop(widget.element, widget.index);
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(5.0),
          child: ToggleSwitch(
            checked: checked,
            onChanged: (v) => setState(() => checked = v),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 5.0),
            child: AnimatedCrossFade(
              duration: const Duration(milliseconds: 200),
              firstChild: widget.formFn(
                context,
                ref,
                flags,
                (int f) => (setState(() => flags = f)),
              ),
              secondChild: FlyoutTarget(
                controller: entryController,
                child: TapRegion(
                  onTapInside: (ev) {
                    if (ev.buttons & kSecondaryButton == kSecondaryButton) {
                      entryController.showFlyout(
                        position: ev.position,
                        barrierDismissible: true,
                        dismissOnPointerMoveAway: false,
                        dismissWithEsc: true,
                        builder: (context) {
                          return MenuFlyout(items: _items());
                        },
                      );
                    }
                  },
                  child: widget.viewFn(context, ref),
                ),
              ),
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
