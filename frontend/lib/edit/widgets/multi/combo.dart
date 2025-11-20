import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/node_provider.dart';

class ComboStateful extends ConsumerStatefulWidget {
  final String element;
  final int idx;
  final String sub;
  final List<String> options;
  const ComboStateful({
    super.key,
    required this.element,
    required this.idx,
    required this.sub,
    required this.options,
  }); //, this.elements});

  @override
  ConsumerState<ComboStateful> createState() => _ComboStatefulState();
}

class _ComboStatefulState extends ConsumerState<ComboStateful> {
  String? val;

  @override
  void initState() {
    val = ref
        .read(nodeProvider)
        .multiGet(widget.element, widget.idx, widget.sub);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ComboBox<String>(
      value: val,
      items:
          widget.options
              .map((opt) => ComboBoxItem(value: opt, child: Text(opt)))
              .toList(),
      onChanged: (u) {
        ref
            .read(nodeProvider)
            .multiSet(widget.element, widget.idx, widget.sub, u!);
        setState(() {
          val = u;
        });
      },
    );
  }
}
