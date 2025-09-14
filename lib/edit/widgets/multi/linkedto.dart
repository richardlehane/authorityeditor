import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/node_provider.dart';
import 'multi.dart';

class LinkedTo extends Multi {
  const LinkedTo({super.key})
    : super(label: "Linked to", element: "LinkedTo", blank: false);

  @override
  Widget Function(BuildContext, WidgetRef, int, Function(int)) makeForm(
    int idx,
    int len,
  ) {
    Widget formf(
      BuildContext context,
      WidgetRef ref,
      int flags,
      Function(int) cb,
    ) {
      return SizedBox(
        height: 70.0,
        // width: 500.0,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.all(5.0),
              child: InfoLabel(
                label: "Type",
                labelStyle: FluentTheme.of(context).typography.caption!,
                child: SizedBox(
                  width: 250.0,
                  child: EditableComboBox<String>(
                    value:
                        ref.read(nodeProvider).multiGet(element, idx, "type") ??
                        "",
                    items:
                        [
                              "linking table",
                              "index",
                              "mandate",
                              "business unit",
                              "agency classification scheme",
                              "SRNSW appraisal objective",
                              "SRNSW function",
                              "SRNSW activity",
                            ]
                            .map((s) => ComboBoxItem(value: s, child: Text(s)))
                            .toList(),
                    onChanged: (d) {
                      ref.read(nodeProvider).multiSet(element, idx, "type", d!);
                    },
                    onFieldSubmitted: (text) {
                      ref
                          .read(nodeProvider)
                          .multiSet(element, idx, "type", text);
                      return text;
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsGeometry.all(5.0),
                child: InfoLabel(
                  label: "Link",
                  labelStyle: FluentTheme.of(context).typography.caption!,
                  child: TextBox(
                    controller: TextEditingController(
                      text: ref.read(nodeProvider).multiGet(element, idx, null),
                    ),
                    //onChanged: (value) => ref.read(nodeProvider).mark(name),//
                    onChanged:
                        (value) => ref
                            .read(nodeProvider)
                            .multiSet(element, idx, null, value),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return formf;
  }

  @override
  Widget Function(BuildContext, WidgetRef) makeView(int idx, int len) {
    Widget viewf(BuildContext context, WidgetRef ref) {
      return SizedBox(
        height: 50.0,

        child: Row(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.all(5.0),
              child: SizedBox(
                height: 200,
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: ref.read(nodeProvider).linkedto(idx),
                  ),
                  maxLines: null,
                  overflow: TextOverflow.visible,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return viewf;
  }
}
