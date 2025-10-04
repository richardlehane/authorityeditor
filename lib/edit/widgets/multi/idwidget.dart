import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/node_provider.dart';
import 'combo.dart';

const _fullControls = [
  "FA",
  "GA",
  "AgencyRef",
  "SRFileNo",
  "AR",
  "DA",
  "GDA",
  "DR",
  "Version",
];

const _seerefControls = ["FA", "GA", "DA", "GDA", "DR"];

class IDWidget extends ConsumerWidget {
  final String element;
  final String? sub;
  final int idx;
  final bool fullControls;
  const IDWidget({
    super.key,
    required this.element,
    required this.idx,
    this.sub,
    this.fullControls = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InfoLabel(
          label: "Identifier",
          labelStyle: FluentTheme.of(context).typography.caption!,
          child: ComboStateful(
            element: element,
            idx: idx,
            sub: "control",
            options: fullControls ? _fullControls : _seerefControls,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 5.0),
          width: 70.0,
          child: InfoLabel(
            label: "Number",
            labelStyle: FluentTheme.of(context).typography.caption!,
            child: TextBox(
              controller: TextEditingController(
                text: ref.read(nodeProvider).multiGet(element, idx, sub),
              ),
              onChanged:
                  (value) =>
                      ref.read(nodeProvider).multiSet(element, idx, sub, value),
            ),
          ),
        ),
      ],
    );
  }
}
