import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/node_provider.dart';
import 'multi.dart';
import "textwidget.dart";

class Source extends Multi {
  const Source({super.key}) : super(label: "Sources", element: "Source");

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
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: InfoLabel(
              label: "Source",
              labelStyle: FluentTheme.of(context).typography.caption!,
              child: TextWidget(
                content: ref.read(nodeProvider).multiGet(element, idx, null),
                cb:
                    (value) => ref
                        .read(nodeProvider)
                        .multiSet(element, idx, null, value),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsGeometry.only(left: 5.0),
              child: InfoLabel(
                label: "Web address (optional)",
                labelStyle: FluentTheme.of(context).typography.caption!,
                child: TextWidget(
                  content: ref.read(nodeProvider).multiGet(element, idx, "url"),
                  cb:
                      (value) => ref
                          .read(nodeProvider)
                          .multiSet(element, idx, "url", value),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return formf;
  }

  @override
  Widget Function(BuildContext, WidgetRef) makeView(int idx, int len) {
    Widget viewf(BuildContext context, WidgetRef ref) {
      return Row(
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: ref.read(nodeProvider).source(idx),
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
}
