import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/node_provider.dart';

class TermTitleRef extends ConsumerStatefulWidget {
  final int index;
  final String element;
  const TermTitleRef({super.key, required this.index, required this.element});

  @override
  ConsumerState<TermTitleRef> createState() => _TermTitleRefState();
}

class _TermTitleRefState extends ConsumerState<TermTitleRef> {
  late int termlen;

  @override
  void initState() {
    termlen = ref.read(nodeProvider).termsRefLen(widget.element, widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: termlen * 150.0 + 28.0,
      height: 32,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: termlen + 1, // add one for the plus button
        itemBuilder: (BuildContext context, int idx) {
          if (idx >= termlen) {
            return Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 5.0),
              child: IconButton(
                icon: Icon(
                  FluentIcons.add,
                  color: FluentTheme.of(context).accentColor,
                ),
                onPressed:
                    () => setState(() {
                      ref
                          .read(nodeProvider)
                          .termsRefAdd(widget.element, widget.index);
                      termlen += 1;
                    }),
              ),
            );
          }
          return Container(
            height: 50,
            width: 150,
            padding: EdgeInsets.only(right: (idx < termlen - 1) ? 5.0 : 0.0),
            child: TextBox(
              controller: TextEditingController(
                text: ref
                    .read(nodeProvider)
                    .termsRefGet(widget.element, widget.index, idx),
              ),
              //onChanged: (value) => ref.read(nodeProvider).mark(name),//
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() {
                    ref
                        .read(nodeProvider)
                        .termsRefSet(widget.element, widget.index, idx, null);
                    termlen--;
                  });
                } else {
                  ref
                      .read(nodeProvider)
                      .termsRefSet(widget.element, widget.index, idx, value);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
