import 'package:authority/authority.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'basetext.dart';
import 'circa.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authorityeditor/edit/provider/node_provider.dart';

class DateRange extends ConsumerWidget {
  const DateRange({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 100.0,
          padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
          child: InfoLabel(
            label: "Start date",
            child: BaseText(
              getter: () {
                return ref.read(nodeProvider).getDate(DateType.start);
              },
              setter: (v) {
                return ref.read(nodeProvider).setDate(DateType.start, v);
              },
            ),
          ),
        ),
        InfoLabel(label: "circa", child: CircaStateful(dt: DateType.start)),
        Container(
          width: 100.0,
          padding: EdgeInsets.fromLTRB(5.0, 10.0, 15.0, 10.0),
          child: InfoLabel(
            label: "End date",
            child: BaseText(
              getter: () {
                return ref.read(nodeProvider).getDate(DateType.end);
              },
              setter: (v) {
                return ref.read(nodeProvider).setDate(DateType.end, v);
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: InfoLabel(
            label: "circa",
            child: CircaStateful(dt: DateType.end),
          ),
        ),
      ],
    );
  }
}
