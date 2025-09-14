import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/node_provider.dart';
import 'multi.dart';
import 'combo.dart';

class Ids extends Multi {
  const Ids({super.key})
    : super(label: "ID numbers", element: "ID", blank: false);

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
                label: "Control",
                labelStyle: FluentTheme.of(context).typography.caption!,
                child: SizedBox(
                  width: 120.0,
                  child: ComboStateful(
                    element: element,
                    idx: idx,
                    sub: "control",
                    options: [
                      "FA",
                      "GA",
                      "AgencyRef",
                      "SRFileNo",
                      "AR",
                      "DA",
                      "GDA",
                      "DR",
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.all(5.0),
              child: InfoLabel(
                label: "ID Number",
                labelStyle: FluentTheme.of(context).typography.caption!,
                child: SizedBox(
                  width: 120.0,
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
                    children: ref.read(nodeProvider).ids(idx),
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
