import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authorityeditor/edit/provider/node_provider.dart';

const termTypes = [
  "",
  "function",
  "activity",
  "subfunction",
  "subactivity",
  "series",
  "subject",
];

const contextTypes = ["appraisal report", "background", "issue"];

// TODO: share code with other stateful combos
class TypeCombo extends ConsumerStatefulWidget {
  final List<String> types;
  const TypeCombo({super.key, this.types = termTypes});

  @override
  ConsumerState<TypeCombo> createState() => _TypeComboState();
}

class _TypeComboState extends ConsumerState<TypeCombo> {
  String? val;

  @override
  void initState() {
    val = ref.read(nodeProvider).get("type");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ComboBox<String>(
      value: val,
      items:
          widget.types.map((e) {
            return ComboBoxItem(value: e, child: Text(e));
          }).toList(),
      onChanged: (u) {
        ref.read(nodeProvider).set("type", (u == null) ? "" : u);
        setState(() {
          val = u;
        });
      },
    );
  }
}
