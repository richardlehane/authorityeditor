import 'package:fluent_ui/fluent_ui.dart';
import 'togglebutton.dart';

class MarkupToolbar extends StatelessWidget {
  const MarkupToolbar({
    super.key,
    required this.toggleButtonsState,
    required this.listButtonState,
    required this.updateToggleButtonsStateOnButtonPressed,
    required this.updateListButtonStateOnButtonPressed,
    this.compact = false,
  });
  final ToggleButtonsState toggleButtonsState;
  final bool listButtonState;
  final void Function(ToggleButtonsState, {String? url})
  updateToggleButtonsStateOnButtonPressed;
  final ValueChanged<bool> updateListButtonStateOnButtonPressed;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 5.0, 5.0),
          child: ToggleButton(
            checked: toggleButtonsState == ToggleButtonsState.emphasis,
            onChanged: (v) {
              updateToggleButtonsStateOnButtonPressed(
                ToggleButtonsState.emphasis,
              );
            },
            child: MarkupButton("Emphasis", FluentIcons.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 5.0, 5.0),
          child: ToggleButton(
            checked: toggleButtonsState == ToggleButtonsState.source,
            onChanged: (v) {
              updateToggleButtonsStateOnButtonPressed(
                ToggleButtonsState.source,
              );
            },
            child: MarkupButton("Source", FluentIcons.italic),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 5.0, 5.0),
          child: ToggleButton(
            checked: toggleButtonsState == ToggleButtonsState.link,
            onChanged: (v) async {
              String? url;
              if (v) url = await showLinkDialog(context);
              if (context.mounted) {
                updateToggleButtonsStateOnButtonPressed(
                  ToggleButtonsState.link,
                  url: url,
                );
              }
            },
            child: MarkupButton("Link", FluentIcons.link),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 5.0),
          child: ToggleButton(
            checked: listButtonState,
            onChanged: (v) {
              updateListButtonStateOnButtonPressed(v);
            },
            child: MarkupButton("List", FluentIcons.bulleted_list),
          ),
        ),
      ],
    );
  }

  Future<String?> showLinkDialog(BuildContext context) async {
    TextEditingController urlController = TextEditingController();
    final url = await showDialog<String>(
      context: context,
      builder:
          (context) => ContentDialog(
            constraints: BoxConstraints(maxHeight: 200.0, maxWidth: 400.0),
            title: const Text('Enter link location:'),
            content: TextBox(controller: urlController),
            actions: [
              Button(
                child: const Text('Confirm'),
                onPressed: () {
                  Navigator.pop(context, urlController.text);
                  // Delete file here
                },
              ),
              FilledButton(
                child: const Text('Cancel'),
                onPressed: () => Navigator.pop(context, ''),
              ),
            ],
          ),
    );
    urlController.dispose();
    return url;
  }
}

class MarkupButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool compact;

  const MarkupButton(this.label, this.icon, {super.key, this.compact = false});

  @override
  Widget build(BuildContext context) {
    if (compact) {
      return SizedBox(width: 25.0, child: Icon(icon, size: 12.0));
    }
    return SizedBox(
      width: 75.0,
      child: Row(
        children: [Icon(icon, size: 12.0), Expanded(child: Text(label))],
      ),
    );
  }
}
