import 'package:fluent_ui/fluent_ui.dart';

class TextWidget extends StatefulWidget {
  final void Function(String?) cb;
  final String? content;
  final String? placeholder;

  const TextWidget({
    super.key,
    required this.content,
    required this.cb,
    this.placeholder,
  });

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  bool fired = false;
  String? txt;
  late TextEditingController twcontroller;

  @override
  void initState() {
    super.initState();
    txt = widget.content;
    twcontroller = TextEditingController(text: txt);
  }

  @override
  void dispose() {
    twcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      child: TextBox(
        controller: twcontroller,
        onChanged:
            (v) => setState(() {
              txt = v;
              if (txt!.isEmpty) txt = null;
            }),
        placeholder: widget.placeholder,
      ),
      onTapOutside: (ev) {
        if (!fired && txt != widget.content) {
          widget.cb(txt);
          fired = true;
        }
      },
      onTapInside: (ev) {
        fired = false;
      },
    );
  }
}
