import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/node_provider.dart';
import 'textwidget.dart';

class AgencyWidget extends ConsumerWidget {
  final String element;
  final int index;
  const AgencyWidget({super.key, required this.element, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: InfoLabel(
              label: "Agency name",
              labelStyle: FluentTheme.of(context).typography.caption!,
              child: TextWidget(
                content: ref
                    .read(nodeProvider)
                    .multiGet(element, index, "Agency"),
                cb:
                    (value) => ref
                        .read(nodeProvider)
                        .multiSet(element, index, "Agency", value),
              ),
            ),
          ),
          Container(
            width: 85.0,
            padding: EdgeInsets.only(left: 5.0),
            child: InfoLabel(
              label: "Agency no.",
              labelStyle: FluentTheme.of(context).typography.caption!,
              child: NumberBox(
                value: int.tryParse(
                  ref.read(nodeProvider).multiGet(element, index, "agencyno") ??
                      "",
                ),
                onChanged: (n) {
                  ref
                      .read(nodeProvider)
                      .multiSet(element, index, "agencyno", n?.toString());
                },
                mode: SpinButtonPlacementMode.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
