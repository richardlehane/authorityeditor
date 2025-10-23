import 'package:authority/authority.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authorityeditor/edit/provider/node_provider.dart';

class CircaStateful extends ConsumerStatefulWidget {
  final DateType dt;
  const CircaStateful({super.key, required this.dt}); //, this.elements});

  @override
  ConsumerState<CircaStateful> createState() => _CircaStatefulState();
}

class _CircaStatefulState extends ConsumerState<CircaStateful> {
  late bool checked;

  @override
  void initState() {
    checked = ref.read(nodeProvider).getCirca(widget.dt);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checked: checked,
      onChanged: (v) {
        ref.read(nodeProvider).setCirca(widget.dt, v ?? false);
        setState(() => checked = v ?? false);
      },
    );
  }
}
