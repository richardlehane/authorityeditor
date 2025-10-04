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
    : super(
        label: "Disposal",
        element: "Disposal",
        blank: true,
        formHeight: 78.0,
      );

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
        children: _disposalChildren(context, ref, idx, len, flags, cb),
      );
    }

    return formf;
  }

  @override
  Widget Function(BuildContext, WidgetRef) makeView(int idx, int len) {
    Widget viewf(BuildContext context, WidgetRef ref) {
      List<TextSpan> d = ref.read(nodeProvider).disposal(idx);
      return Row(
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: d,
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

void clearOldDisposal(
  WidgetRef ref,
  int idx,
  int newFlag,
  int oldFlag,
  int len,
) {
  if (oldFlag == 0) return;
  if (len == 1) {
    ref.read(nodeProvider).multiSet("Disposal", idx, "DisposalCondition", null);
  }
  if (oldFlag == 1) {
    ref.read(nodeProvider).multiSet("Disposal", idx, "TransferTo", null);
  }
  if (oldFlag == 2) {
    ref
        .read(nodeProvider)
        .multiSetParagraphs("Disposal", idx, "CustomAction", null);
  }
  if (newFlag == 2) {
    ref.read(nodeProvider).multiSet("Disposal", idx, "DisposalAction", null);
  }
  if ((newFlag == 2 || newFlag == 3) && (oldFlag == 1 || oldFlag == 4)) {
    ref.read(nodeProvider).multiSet("Disposal", idx, "RetentionPeriod", null);
    ref.read(nodeProvider).multiSet("Disposal", idx, "DisposalTrigger", null);
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
      Container(
        width: 200.0,
        padding: EdgeInsetsGeometry.only(right: 5.0),
        child: InfoLabel(
          label: "Disposal Condition",
          labelStyle: FluentTheme.of(context).typography.caption!,
          child: EditableComboBox<String>(
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
            onFieldSubmitted: (d) {
              ref
                  .read(nodeProvider)
                  .multiSet(element, idx, "DisposalCondition", d);
              return d;
            },
          ),
        ),
      ),
    );
  }
  list.add(
    InfoLabel(
      label: "Disposal action",
      labelStyle: FluentTheme.of(context).typography.caption!,
      child: ComboBox<String>(
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
            clearOldDisposal(ref, idx, 2, flags, len);
            cb(2);
          } else {
            ref.read(nodeProvider).multiSet(element, idx, "DisposalAction", d);
            switch (d) {
              case "Transfer":
                clearOldDisposal(ref, idx, 1, flags, len);
                cb(1);
              case "Required as State archives" || "Retain in agency":
                clearOldDisposal(ref, idx, 3, flags, len);
                cb(3);
              default:
                clearOldDisposal(ref, idx, 4, flags, len);
                cb(4);
            }
          }
        },
      ),
    ),
  );
  if (flags == 3) return list;
  if (flags == 2) {
    list.add(
      Expanded(
        child: Padding(
          padding: EdgeInsets.only(left: 5.0),
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
      ),
    );
    return list;
  }
  if (flags == 1) {
    list.add(
      Container(
        width: 200.0,
        padding: EdgeInsetsGeometry.only(left: 5.0),
        child: InfoLabel(
          label: "Transfer to",
          child: TextBox(
            controller: TextEditingController(
              text: ref.read(nodeProvider).multiGet(element, idx, "TransferTo"),
            ),
            onChanged:
                (value) => ref
                    .read(nodeProvider)
                    .multiSet(element, idx, "TransferTo", value),
          ),
        ),
      ),
    );
  }
  list.add(
    Container(
      width: 200.0,
      padding: EdgeInsetsGeometry.only(left: 5.0),
      child: InfoLabel(
        label: "Retention period",
        labelStyle: FluentTheme.of(context).typography.caption!,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 5.0),
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
                        .multiSet(
                          element,
                          idx,
                          "RetentionPeriod",
                          n?.toString(),
                        );
                  },
                  mode: SpinButtonPlacementMode.none,
                ),
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
      ),
    ),
  );
  list.add(
    Expanded(
      child: Padding(
        padding: EdgeInsetsGeometry.only(left: 5.0),
        child: InfoLabel(
          label: "Disposal trigger",
          labelStyle: FluentTheme.of(context).typography.caption!,
          child: EditableComboBox<String>(
            value:
                ref
                    .read(nodeProvider)
                    .multiGet(element, idx, "DisposalTrigger") ??
                "",
            items:
                _disposalTriggers
                    .map((s) => ComboBoxItem(value: s, child: Text(s)))
                    .toList(),
            onChanged: (d) {
              if (d != null && d.isEmpty) d = null;
              ref
                  .read(nodeProvider)
                  .multiSet(element, idx, "DisposalTrigger", d);
            },
            onFieldSubmitted: (text) {
              ref
                  .read(nodeProvider)
                  .multiSet(
                    element,
                    idx,
                    "DisposalTrigger",
                    (text.isEmpty) ? null : text,
                  );
              return text;
            },
          ),
        ),
      ),
    ),
  );
  return list;
}
