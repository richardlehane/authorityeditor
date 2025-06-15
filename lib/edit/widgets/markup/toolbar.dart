import 'package:fluent_ui/fluent_ui.dart';
import 'togglebutton.dart';

class MarkupToolbar extends StatelessWidget {
  const MarkupToolbar({
    super.key,
    required this.toggleButtonsState,
    required this.listButtonState,
    required this.updateToggleButtonsStateOnButtonPressed,
    required this.updateListButtonStateOnButtonPressed,
  });
  final ToggleButtonsState toggleButtonsState;
  final bool listButtonState;
  final void Function(ToggleButtonsState, {String? url})
  updateToggleButtonsStateOnButtonPressed;
  final ValueChanged<bool> updateListButtonStateOnButtonPressed;

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
            child: SizedBox(
              width: 75.0,
              child: Row(
                children: [
                  const Icon(FluentIcons.bold, size: 12.0),
                  Expanded(child: const Text("Emphasis")),
                ],
              ),
            ),
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
            child: SizedBox(
              width: 75.0,
              child: Row(
                children: [
                  const Icon(FluentIcons.italic, size: 12.0),
                  Expanded(child: const Text("Source")),
                ],
              ),
            ),
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
            child: SizedBox(
              width: 75.0,
              child: Row(
                children: [
                  const Icon(FluentIcons.link, size: 12.0),
                  Expanded(child: const Text("Link")),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 5.0),
          child: ToggleButton(
            checked: listButtonState,
            onChanged: (v) {
              updateListButtonStateOnButtonPressed(v);
            },
            child: SizedBox(
              width: 75.0,
              child: Row(
                children: [
                  const Icon(FluentIcons.bulleted_list, size: 12.0),
                  Expanded(child: const Text("List")),
                ],
              ),
            ),
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
