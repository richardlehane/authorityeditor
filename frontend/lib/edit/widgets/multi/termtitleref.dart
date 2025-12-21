import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/node_provider.dart';
import '../../provider/tree_provider.dart';
import 'package:authorityeditor/authority/authority.dart';
import "textwidget.dart";

class TermTitleRef extends ConsumerStatefulWidget {
  final int index;
  final String element;
  final bool internalSeeRef;
  const TermTitleRef({
    super.key,
    required this.index,
    required this.element,
    this.internalSeeRef = false,
  });

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
    final width = (widget.internalSeeRef) ? 250.0 : 100.0;
    return SizedBox(
      width: termlen * width + 28.0,
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
            width: width,
            padding: EdgeInsets.only(right: (idx < termlen - 1) ? 5.0 : 0.0),
            child:
                (widget.internalSeeRef && idx < 2)
                    ? InternalRef(
                      index: widget.index,
                      element: widget.element,
                      termIndex: idx,
                      cb: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            ref
                                .read(nodeProvider)
                                .termsRefSet(
                                  widget.element,
                                  widget.index,
                                  idx,
                                  null,
                                );
                            termlen--;
                          });
                        } else {
                          ref
                              .read(nodeProvider)
                              .termsRefSet(
                                widget.element,
                                widget.index,
                                idx,
                                value,
                              );
                        }
                      },
                    )
                    : TextWidget(
                      content: ref
                          .read(nodeProvider)
                          .termsRefGet(widget.element, widget.index, idx),
                      cb: (value) {
                        if (value == null) {
                          setState(() {
                            ref
                                .read(nodeProvider)
                                .termsRefSet(
                                  widget.element,
                                  widget.index,
                                  idx,
                                  null,
                                );
                            termlen--;
                          });
                        } else {
                          ref
                              .read(nodeProvider)
                              .termsRefSet(
                                widget.element,
                                widget.index,
                                idx,
                                value,
                              );
                        }
                      },
                    ),
          );
        },
      ),
    );
  }
}

class InternalRef extends ConsumerStatefulWidget {
  final int index;
  final String element;
  final int termIndex;
  final void Function(String?) cb;

  const InternalRef({
    super.key,
    required this.index,
    required this.element,
    required this.termIndex,
    required this.cb,
  });

  @override
  ConsumerState<InternalRef> createState() => _InternalRefState();
}

class _InternalRefState extends ConsumerState<InternalRef> {
  String? term;
  bool changed = false;

  @override
  void initState() {
    term = ref
        .read(nodeProvider)
        .termsRefGet(widget.element, widget.index, widget.termIndex);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String>? terms;
    final tree = ref.watch(treeProvider);
    if (widget.termIndex == 0) {
      terms = getFunctions(tree);
    } else {
      final function = ref
          .read(nodeProvider)
          .termsRefGet(widget.element, widget.index, 0);
      terms = getActivities(tree, function);
    }
    terms ??= [""];
    if (terms.isEmpty) terms = [""];

    return TapRegion(
      onTapOutside: (PointerDownEvent ev) {
        if (changed) {
          changed = false;
          widget.cb(term);
        }
      },
      child: EditableComboBox<String>(
        items:
            terms.map<ComboBoxItem<String>>((e) {
              return ComboBoxItem<String>(value: e, child: Text(e));
            }).toList(),
        value: term,
        onFieldSubmitted: (v) {
          setState(() {
            changed = true;
            term = v;
          });
          return v;
        },
        onChanged: (v) {
          setState(() {
            changed = true;
            term = v;
          });
        },
      ),
    );
  }
}
