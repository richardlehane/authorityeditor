import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/node_provider.dart';
import 'package:authority/authority.dart' show SeeRefType;
import 'termtitleref.dart';
import 'entry.dart';
import 'ga28.dart';
import 'idwidget.dart';

const double _addEntryHeight = 36.0;
// Two types:
// An enclosing tag e.g. Status
// Multiple of the same element as siblings, e.g. comments, source, disposal

class SeeReference extends ConsumerWidget {
  static const viewHeight = 30.0;
  static const formHeight = 64.0;
  static const element = "SeeReference";
  const SeeReference({super.key});

  Widget Function(BuildContext, WidgetRef, int flags, Function(int) cb)
  makeForm(int idx, int len) {
    Widget formf(
      BuildContext context,
      WidgetRef ref,
      int flags,
      Function(int) cb,
    ) {
      SeeRefType srt = ref.read(nodeProvider).multiSeeRefType(idx);

      return switch (srt) {
        SeeRefType.local => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InfoLabel(
              label: "Terms",
              labelStyle: FluentTheme.of(context).typography.caption!,
              child: TermTitleRef(index: idx, element: element),
            ),
            SeeText(index: idx),
          ],
        ),
        SeeRefType.ga28 => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InfoLabel(
              label: "GA28 terms",
              labelStyle: FluentTheme.of(context).typography.caption!,
              child: GA28(index: idx),
            ),
            SeeText(index: idx),
          ],
        ),
        SeeRefType.other => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IDWidget(
              element: "SeeReference",
              sub: "IDRef",
              idx: idx,
              fullControls: false,
            ),
            Container(
              width: 200.0,
              padding: EdgeInsetsGeometry.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: InfoLabel(
                label: "Authority title",
                labelStyle: FluentTheme.of(context).typography.caption!,
                child: TextBox(
                  controller: TextEditingController(
                    text: ref
                        .read(nodeProvider)
                        .multiGet(element, idx, "AuthorityTitleRef"),
                  ),
                  onChanged:
                      (value) => ref
                          .read(nodeProvider)
                          .multiSet(element, idx, "AuthorityTitleRef", value),
                ),
              ),
            ),
            InfoLabel(
              label: "Terms",
              labelStyle: FluentTheme.of(context).typography.caption!,
              child: TermTitleRef(index: idx, element: element),
            ),
            Container(
              width: 70.0,
              padding: EdgeInsetsGeometry.only(left: 5.0),
              child: InfoLabel(
                label: "Item no.",
                labelStyle: FluentTheme.of(context).typography.caption!,
                child: TextBox(
                  controller: TextEditingController(
                    text: ref
                        .read(nodeProvider)
                        .multiGet(element, idx, "ItemNoRef"),
                  ),
                  onChanged:
                      (value) => ref
                          .read(nodeProvider)
                          .multiSet(element, idx, "ItemNoRef", value),
                ),
              ),
            ),
            SeeText(index: idx),
          ],
        ),
        SeeRefType.none => SizedBox(),
      };
    }

    return formf;
  }

  Widget Function(BuildContext, WidgetRef) makeView(int idx, int len) {
    Widget viewf(BuildContext context, WidgetRef ref) {
      return Row(
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: ref.read(nodeProvider).seereference(idx),
              ),
              maxLines: null,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      );
    }

    return viewf;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int l = ref.watch(nodeProvider).multiLen(element);
    final double height = l * viewHeight + formHeight + _addEntryHeight;

    return SizedBox(
      height: height,
      child: InfoLabel(
        label: "See references",
        child: ListView.builder(
          itemCount: l + 1, // add one for the plus button
          itemBuilder: (BuildContext context, int index) {
            if (index >= l) {
              return Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(7, 7, 0.0, 0.0),
                child: DropDownButton(
                  title: Icon(
                    FluentIcons.add,
                    color: FluentTheme.of(context).accentColor,
                  ),

                  items: [
                    MenuFlyoutItem(
                      text: const Text('Internal'),
                      onPressed:
                          () => ref
                              .read(nodeProvider.notifier)
                              .seeRefAdd(SeeRefType.local),
                      /* Handle option 1 */
                    ),
                    MenuFlyoutItem(
                      text: const Text('GA28'),
                      onPressed:
                          () => ref
                              .read(nodeProvider.notifier)
                              .seeRefAdd(SeeRefType.ga28),
                    ),
                    MenuFlyoutItem(
                      text: const Text('Another authority'),
                      onPressed:
                          () => ref
                              .read(nodeProvider.notifier)
                              .seeRefAdd(SeeRefType.other),
                    ),
                  ],
                ),
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
      ),
    );
  }
}

class SeeText extends ConsumerWidget {
  static const element = "SeeReference";
  final int index;
  const SeeText({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 5.0),
        child: InfoLabel(
          label: "See text",
          labelStyle: FluentTheme.of(context).typography.caption!,
          child: TextBox(
            placeholder: "for records relating to...",
            controller: TextEditingController(
              text: ref.read(nodeProvider).multiGet(element, index, "SeeText"),
            ),
            onChanged: (value) {
              ref
                  .read(nodeProvider)
                  .multiSet(
                    element,
                    index,
                    "SeeText",
                    value.isEmpty ? null : value,
                  );
            },
          ),
        ),
      ),
    );
  }
}
