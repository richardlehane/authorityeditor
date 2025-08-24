import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authorityeditor/edit/provider/node_provider.dart';

class SimpleText extends ConsumerWidget {
  final TextEditingController controller = TextEditingController();
  final bool element;
  final String name;
  final String label;
  final String placeholder;

  SimpleText({
    super.key,
    required this.element,
    required this.label,
    required this.name,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final TextEditingController controller = TextEditingController();
    controller.text = ref.read(nodeProvider).get(name) ?? "";
    return TapRegion(
      onTapOutside: (PointerDownEvent ev) {
        ref.read(nodeProvider).set(name, controller.text);
      },
      child: InfoLabel(
        label: label,
        child: TextBox(
          placeholder: placeholder,
          controller: controller,
          onChanged: (value) => ref.read(nodeProvider).mark(name),
        ),
      ),
    );
  }
}
