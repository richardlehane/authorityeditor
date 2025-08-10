import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/node_provider.dart';
import 'multi.dart';

class Disposal extends Multi {
  const Disposal({super.key})
    : super(label: "Disposal", element: "Disposal", blank: true);

  @override
  Widget Function(BuildContext, WidgetRef) makeForm(int idx) {
    Widget formf(BuildContext context, WidgetRef ref) {
      return SizedBox(
        height: 70.0,
        // width: 500.0,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.all(5.0),
              child: InfoLabel(
                label: "Disposal trigger",
                labelStyle: FluentTheme.of(context).typography.caption!,
                child: SizedBox(
                  height: 38.0,
                  width: 300.0,
                  child: EditableComboBox<String>(
                    value: ref
                        .watch(nodeProvider)
                        .mGet(element, idx, "DisposalTrigger"),
                    items: [
                      ComboBoxItem<String>(
                        value: "action completed",
                        child: Text("action completed"),
                      ),
                      ComboBoxItem<String>(
                        value: "superseded",
                        child: Text("superseded"),
                      ),
                      ComboBoxItem<String>(
                        value: "reference use ceases",
                        child: Text("reference use ceases"),
                      ),
                      ComboBoxItem<String>(
                        value: "administrative or reference use ceases",
                        child: Text("administrative or reference use ceases"),
                      ),
                      ComboBoxItem<String>(
                        value: "expiry or termination of agreement",
                        child: Text("expiry or termination of agreement"),
                      ),
                      ComboBoxItem<String>(
                        value: "expiry or termination of contract",
                        child: Text("expiry or termination of contract"),
                      ),
                      ComboBoxItem<String>(
                        value: "expiry or termination of lease",
                        child: Text("expiry or termination of lease"),
                      ),
                      ComboBoxItem<String>(
                        value: "expiry or termination of licence",
                        child: Text("expiry or termination of licence"),
                      ),
                    ],
                    onChanged: (text) {
                      ref
                          .read(nodeProvider.notifier)
                          .multiSet(element, idx, "DisposalTrigger", text!);
                    },
                    onFieldSubmitted: (text) {
                      ref
                          .read(nodeProvider.notifier)
                          .multiSet(element, idx, "DisposalTrigger", text);
                      return text;
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.all(5.0),
              child: InfoLabel(
                label: "Retention period",
                labelStyle: FluentTheme.of(context).typography.caption!,
                child: Row(
                  children: [
                    Container(
                      height: 38.0,
                      width: 70.0,
                      padding: EdgeInsets.fromLTRB(0, 0, 2.0, 0),
                      child: NumberBox(
                        value: int.tryParse(
                          ref
                              .watch(nodeProvider)
                              .mGet(element, idx, "RetentionPeriod"),
                        ),
                        onChanged: (n) {
                          if (n == null) return;
                          ref
                              .read(nodeProvider.notifier)
                              .multiSet(
                                element,
                                idx,
                                "RetentionPeriod",
                                n.toString(),
                              );
                        },
                        mode: SpinButtonPlacementMode.none,
                      ),
                    ),
                    SizedBox(
                      height: 38.0,
                      child: ComboBox<String>(
                        value: ref
                            .watch(nodeProvider)
                            .mGet(element, idx, "unit"),
                        items: [
                          ComboBoxItem(value: "years", child: Text("years")),
                          ComboBoxItem(value: "months", child: Text("months")),
                        ],
                        onChanged: (u) {
                          ref
                              .read(nodeProvider.notifier)
                              .multiSet(element, idx, "unit", u!);
                        },
                        //placeholder: const Text('Select a cat breed'),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsetsGeometry.all(5.0),
              child: InfoLabel(
                label: "Disposal action",
                labelStyle: FluentTheme.of(context).typography.caption!,
                child: SizedBox(
                  height: 38.0,
                  child: ComboBox<String>(
                    value: ref
                        .watch(nodeProvider)
                        .mGet(element, idx, "DisposalAction"),
                    items: [
                      ComboBoxItem(value: "", child: Text("")),
                      ComboBoxItem(
                        value: "Required as State archives",
                        child: Text("Required as State archives"),
                      ),
                      ComboBoxItem(value: "Destroy", child: Text("Destroy")),
                      ComboBoxItem(
                        value: "Retain in agency",
                        child: Text("Retain in agency"),
                      ),
                      ComboBoxItem(value: "Transfer", child: Text("Transfer")),
                    ],
                    onChanged: (d) {
                      ref
                          .read(nodeProvider.notifier)
                          .multiSet(element, idx, "DisposalAction", d!);
                    },
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
  Widget Function(BuildContext, WidgetRef) makeView(int idx) {
    Widget viewf(BuildContext context, WidgetRef ref) {
      (List<TextSpan>, List<TextSpan>) d = ref
          .watch(nodeProvider)
          .disposal(idx);
      return SizedBox(
        height: 50.0,

        child: Row(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.all(5.0),
              child: InfoLabel(
                label: "Action",
                labelStyle: FluentTheme.of(context).typography.caption!,
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: d.$1,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.all(5.0),
              child: InfoLabel(
                label: "Custody",
                labelStyle: FluentTheme.of(context).typography.caption!,
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: d.$2,
                  ),
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
