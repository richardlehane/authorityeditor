import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/node_provider.dart';
import 'multi.dart';
import 'combo.dart';
import "../markup/markup.dart";

const List<String> _disposalActions = [
  "",
  "Destroy",
  "Required as State archives",
  "Retain in agency",
  "Transfer",
  "Custom",
];

const List<String> _disposalTriggers = [
  "",
  "action completed",
  "superseded",
  "reference use ceases",
  "administrative or reference use ceases",
  "expiry or termination of agreement",
  "expiry or termination of contract",
  "expiry or termination of lease",
  "expiry or termination of licence",
];

const List<String> _disposalConditions = [
  "",
  "If longer",
  "If shorter",
  "For records relating to...",
  "Automated",
  "Authorised",
  "Following transfer",
];

class Disposal extends Multi {
  const Disposal({super.key})
    : super(label: "Disposal", element: "Disposal", blank: true);

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
          children: _disposalChildren(context, ref, idx, len, flags, cb),
        ),
      );
    }

    return formf;
  }

  @override
  Widget Function(BuildContext, WidgetRef) makeView(int idx, int len) {
    Widget viewf(BuildContext context, WidgetRef ref) {
      List<TextSpan> d = ref.read(nodeProvider).disposal(idx);
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
                    children: d,
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

List<Widget> _disposalChildren(
  BuildContext context,
  WidgetRef ref,
  int idx,
  int len,
  int flags,
  Function(int) cb,
) {
  const element = "Disposal";
  List<Widget> list = [];
  if (len > 1) {
    list.add(
      _disposalBlock(
        context,
        "Disposal Condition",
        EditableComboBox<String>(
          value:
              ref
                  .read(nodeProvider)
                  .multiGet(element, idx, "DisposalCondition") ??
              "",
          items:
              _disposalConditions
                  .map((s) => ComboBoxItem(value: s, child: Text(s)))
                  .toList(),
          onChanged: (d) {
            if (d!.isEmpty) d = null;
            ref
                .read(nodeProvider)
                .multiSet(element, idx, "DisposalCondition", d);
          },
          onFieldSubmitted: (text) {
            return text;
          },
        ),
        width: 200.0,
      ),
    );
  }
  list.add(
    _disposalBlock(
      context,
      "Disposal action",
      ComboBox<String>(
        value:
            (flags == 2)
                ? "Custom"
                : ref
                        .read(nodeProvider)
                        .multiGet(element, idx, "DisposalAction") ??
                    "",
        items:
            _disposalActions
                .map((s) => ComboBoxItem(value: s, child: Text(s)))
                .toList(),
        onChanged: (d) {
          if (d!.isEmpty) d = null;
          if (d == "Custom") {
            cb(2);
          } else {
            ref.read(nodeProvider).multiSet(element, idx, "DisposalAction", d);
            switch (d) {
              case "Transfer":
                cb(1);
              case "Required as State archives" || "Retain in agency":
                cb(3);
              default:
                cb(0);
            }
          }
        },
      ),
      height: 38.0,
    ),
  );
  if (flags == 3) return list;
  if (flags == 2) {
    list.add(
      SizedBox(
        width: 600.0,
        child: Markup(
          paras: ref
              .read(nodeProvider)
              .multiGetParagraphs(element, idx, "CustomAction"),
          cb:
              (paras) => ref
                  .read(nodeProvider)
                  .multiSetParagraphs(element, idx, "CustomAction", paras),
          height: 42,
        ),
      ),
    );
    return list;
  }
  if (flags == 1) {
    list.add(
      _disposalBlock(
        context,
        "Transfer to",
        TextBox(
          controller: TextEditingController(
            text: ref.read(nodeProvider).multiGet(element, idx, "TransferTo"),
          ),
          //onChanged: (value) => ref.read(nodeProvider).mark(name),//
          onChanged:
              (value) => ref
                  .read(nodeProvider)
                  .multiSet(element, idx, "TransferTo", value),
        ),
        width: 200.0,
      ),
    );
  }
  list.add(
    _disposalBlock(
      context,
      "Retention period",
      Row(
        children: [
          Container(
            width: 70.0,
            padding: EdgeInsets.fromLTRB(0, 0, 2.0, 0),
            child: NumberBox(
              value: int.tryParse(
                ref
                        .read(nodeProvider)
                        .multiGet(element, idx, "RetentionPeriod") ??
                    "",
              ),
              onChanged: (n) {
                ref
                    .read(nodeProvider)
                    .multiSet(element, idx, "RetentionPeriod", n?.toString());
              },
              mode: SpinButtonPlacementMode.none,
            ),
          ),
          ComboStateful(
            element: element,
            idx: idx,
            sub: "unit",
            options: ["years", "months"],
          ),
        ],
      ),
      height: 38.0,
    ),
  );
  list.add(
    _disposalBlock(
      context,
      "Disposal trigger",
      EditableComboBox<String>(
        value:
            ref.read(nodeProvider).multiGet(element, idx, "DisposalTrigger") ??
            "",
        items:
            _disposalTriggers
                .map((s) => ComboBoxItem(value: s, child: Text(s)))
                .toList(),
        onChanged: (d) {
          ref.read(nodeProvider).multiSet(element, idx, "DisposalTrigger", d!);
        },
        onFieldSubmitted: (text) {
          ref
              .read(nodeProvider)
              .multiSet(element, idx, "DisposalTrigger", text);
          return text;
        },
      ),
      height: 100,
      width: 280.0,
    ),
  );

  return list;
}

Padding _disposalBlock(
  BuildContext context,
  String label,
  Widget child, {
  double? height,
  double? width,
}) {
  return Padding(
    padding: EdgeInsetsGeometry.all(5.0),
    child: InfoLabel(
      label: label,
      labelStyle: FluentTheme.of(context).typography.caption!,
      child:
          (height != null || width != null)
              ? SizedBox(height: height ?? 38.0, width: width, child: child)
              : child,
    ),
  );
}
