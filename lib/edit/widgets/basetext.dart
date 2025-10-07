import 'package:fluent_ui/fluent_ui.dart';

class BaseText extends StatefulWidget {
  final String? Function() getter;
  final void Function(String?) setter;
  final String? placeholder;
  const BaseText({
    super.key,
    required this.getter,
    required this.setter,
    this.placeholder,
  });

  @override
  State<BaseText> createState() => _BaseTextState();
}

class _BaseTextState extends State<BaseText> {
  final TextEditingController controller = TextEditingController();
  bool changed = false;

  @override
  void initState() {
    controller.text = widget.getter() ?? "";
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        if (!hasFocus && changed) {
          String? val = controller.text;
          if (val.isEmpty) val = null;
          changed = false;
          widget.setter(val);
        }
      },
      child: TextBox(
        placeholder: widget.placeholder,
        controller: controller,
        onChanged: (_) => changed = true,
      ),
    );
  }
}
