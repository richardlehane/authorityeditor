import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/node_provider.dart';
import 'multi.dart';
import "../markup/markup.dart";

class Comments extends Multi {
  const Comments({super.key})
    : super(label: "Comments", element: "Comment", blank: false);

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
                label: "Author",
                labelStyle: FluentTheme.of(context).typography.caption!,
                child: SizedBox(
                  width: 100.0,
                  child: TextBox(
                    controller: TextEditingController(
                      text: ref
                          .read(nodeProvider)
                          .multiGet(element, idx, "author"),
                    ),
                    //onChanged: (value) => ref.read(nodeProvider).mark(name),//
                    onChanged:
                        (value) => ref
                            .read(nodeProvider)
                            .multiSet(element, idx, "author", value),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Markup(
                paras: ref
                    .read(nodeProvider)
                    .multiGetParagraphs(element, idx, null),
                cb:
                    (paras) => ref
                        .read(nodeProvider)
                        .multiSetParagraphs(element, idx, null, paras),
                height: 42,
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
                    children: ref.read(nodeProvider).comment(idx),
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
