import 'package:fluent_ui/fluent_ui.dart';
import 'package:xml/xml.dart';
import 'toolbar.dart';
import 'controller.dart';
import 'togglebutton.dart';

class Markup extends StatefulWidget {
  final List<XmlElement>? paras;
  final Function(List<XmlElement>)? cb;
  final bool compact;
  const Markup({super.key, this.paras, this.cb, this.compact = false});

  @override
  State<Markup> createState() => _MarkupState();
}

class _MarkupState extends State<Markup> {
  late MarkupTextEditingController markupTextEditingController =
      (widget.paras == null)
          ? MarkupTextEditingController()
          : MarkupTextEditingController.fromXML(widget.paras!);
  final FocusNode focusNode = FocusNode();

  ToggleButtonsState toggleButtonsState = ToggleButtonsState.none;
  bool listButtonState = false;

  void updateToggleButtonsStateOnButtonPressed(
    ToggleButtonsState value, {
    String? url,
  }) {
    setState(() {
      toggleButtonsState = toggleButtonsState.alter(value);
      markupTextEditingController.updateSelection(toggleButtonsState, url: url);
      focusNode.requestFocus();
    });
  }

  void updateListButtonStateOnButtonPressed(bool value) {
    setState(() {
      listButtonState = value;
      markupTextEditingController.updateList(listButtonState);
      focusNode.requestFocus();
    });
  }

  void updateAllButtonsStateOnSelectionChanged() {
    if (markupTextEditingController.update()) {
      setState(() {
        toggleButtonsState = markupTextEditingController.buttonsState;
        listButtonState = markupTextEditingController.listToggled;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    markupTextEditingController.addListener(
      updateAllButtonsStateOnSelectionChanged,
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    markupTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapOutside: (event) {
        if (markupTextEditingController.edited) {
          markupTextEditingController.edited = false;
          if (widget.cb != null) {
            widget.cb!(markupTextEditingController.toXML());
          }
        }
      },
      child: Column(
        children: [
          MarkupToolbar(
            toggleButtonsState: toggleButtonsState,
            listButtonState: listButtonState,
            updateToggleButtonsStateOnButtonPressed:
                updateToggleButtonsStateOnButtonPressed,
            updateListButtonStateOnButtonPressed:
                updateListButtonStateOnButtonPressed,
            compact: widget.compact,
          ),
          SizedBox(
            height: (widget.compact) ? 50.0 : 150.0,
            child: TextBox(
              focusNode: focusNode,
              maxLines: null,
              controller: markupTextEditingController,
            ),
          ),
        ],
      ),
    );
  }
}
