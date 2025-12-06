import 'package:fluent_ui/fluent_ui.dart';
import "node.dart";
import 'package:authorityeditor/edit/widgets/multi/disposal.dart'
    show disposalActions;

typedef FormCallback = void Function(dynamic);

enum MatchType {
  titleEquals,
  titleContains,
  itemNoEquals,
  itemNoContains,
  textContains,
  updatedSince,
  retentionMoreThan,
  retentionLessThan,
  disposalAction,
  hasComments,
  hasCommentsAuthor;

  @override
  String toString() {
    return switch (this) {
      MatchType.titleEquals => "title equals",
      MatchType.titleContains => "title contains",
      MatchType.itemNoEquals => "item number equals",
      MatchType.itemNoContains => "item number contains",
      MatchType.textContains => "text fields contain",
      MatchType.updatedSince => "updated since",
      MatchType.retentionMoreThan => "retention period is more than",
      MatchType.retentionLessThan => "retention period is less than",
      MatchType.disposalAction => "disposal action is",
      MatchType.hasComments => "has comments",
      MatchType.hasCommentsAuthor => "has comments by author",
    };
  }

  Widget form(FormCallback cb) {
    return switch (this) {
      MatchType.updatedSince => CalendarDatePicker(
        // initialStart: val,
        onSelectionChanged: (value) {
          cb(value.startDate);
        },
        isOutOfScopeEnabled: false,
        isGroupLabelVisible: false,
        locale: const Locale('en-gb'),
      ),
      MatchType.hasComments => SizedBox(),
      MatchType.retentionLessThan => Row(
        children: [
          Container(
            width: 80.0,
            padding: EdgeInsets.only(right: 5.0),
            child: NumberBox(
              value: 0,
              onChanged: (val) => cb(val),
              mode: SpinButtonPlacementMode.none,
            ),
          ),
          Text("years"),
        ],
      ),
      MatchType.retentionMoreThan => Row(
        children: [
          Container(
            width: 80.0,
            padding: EdgeInsets.only(right: 5.0),
            child: NumberBox(
              value: 0,
              onChanged: (val) => cb(val),
              mode: SpinButtonPlacementMode.none,
            ),
          ),
          Text("years"),
        ],
      ),
      MatchType.disposalAction => _ComboStateful(
        options: disposalActions,
        cb: cb,
      ),
      _ => TextBox(onChanged: (value) => cb(value)),
    };
  }
}

class Match {
  MatchType typ = MatchType.textContains;
  dynamic value;

  @override
  String toString() {
    return switch (typ) {
      MatchType.retentionMoreThan => "$typ $value years",
      MatchType.retentionLessThan => "$typ $value years",
      MatchType.hasComments => typ.toString(),
      _ => "$typ $value",
    };
  }
}

class Search {
  NodeType? scope;
  bool and;
  List<Match> matches;

  Search(this.matches, [this.and = true, this.scope]);

  @override
  String toString() {
    final sep = (and) ? " and " : " or ";
    if (scope == null) return matches.join(sep);
    if (scope == NodeType.termType) return "terms where ${matches.join(sep)}";
    return "classes where ${matches.join(sep)}";
  }
}

Future<Search?> queryDialog(BuildContext context) async {
  return showDialog<Search>(
    context: context,
    builder: (BuildContext context) {
      Search query = Search([Match()]);
      return ContentDialog(
        constraints: BoxConstraints(maxHeight: 500.0, maxWidth: 500.0),
        content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 90.0),
                        child: InfoLabel(
                          label: "Scope",
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(2.0),
                                child: RadioButton(
                                  checked: query.scope == null,
                                  content: Text("Terms and Classes"),
                                  onChanged: (checked) {
                                    if (checked) {
                                      setState(() => query.scope = null);
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(2.0),
                                child: RadioButton(
                                  checked: query.scope == NodeType.termType,
                                  content: Text("Terms only"),
                                  onChanged: (checked) {
                                    if (checked) {
                                      setState(
                                        () => query.scope = NodeType.termType,
                                      );
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(2.0),
                                child: RadioButton(
                                  checked: query.scope == NodeType.classType,
                                  content: Text("Classes only"),
                                  onChanged: (checked) {
                                    if (checked) {
                                      setState(
                                        () => query.scope = NodeType.classType,
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InfoLabel(
                        label: "Boolean",
                        child: ToggleSwitch(
                          checked: query.and,
                          onChanged: (v) => setState(() => query.and = v),
                          content: Text(query.and ? 'And' : 'Or'),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: InfoLabel(
                      label: "Query",
                      child: SizedBox(
                        height: 188.0,
                        child: ListView(
                          children: List.generate(query.matches.length, (
                            index,
                          ) {
                            return Padding(
                              padding: EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 5.0),
                                    child: ComboBox<String>(
                                      value: query.matches[index].typ.name,
                                      items:
                                          MatchType.values.map((m) {
                                            return ComboBoxItem(
                                              value: m.name,
                                              child: Text(m.toString()),
                                            );
                                          }).toList(),
                                      onChanged:
                                          (v) => setState(() {
                                            query.matches[index].typ = MatchType
                                                .values
                                                .firstWhere((f) => f.name == v);
                                          }),
                                    ),
                                  ),
                                  Expanded(
                                    child: query.matches[index].typ.form(
                                      (v) => setState(
                                        () => query.matches[index].value = v,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            FluentIcons.add,
                            size: 24.0,
                            color: FluentTheme.of(context).accentColor,
                          ),
                          onPressed:
                              () => setState(() => query.matches.add(Match())),
                        ),
                        IconButton(
                          icon: Icon(
                            FluentIcons.calculator_subtract,
                            size: 24.0,
                            color: FluentTheme.of(context).accentColor,
                          ),
                          onPressed: () {
                            if (query.matches.length > 1) {
                              setState(() => query.matches.removeLast());
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        actions: [
          Button(
            child: const Text('Filter'),
            onPressed: () {
              Navigator.pop(context, query);
              // Delete file here
            },
          ),
          FilledButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context, null),
          ),
        ],
      );
    },
  );
}

class _ComboStateful extends StatefulWidget {
  final List<String> options;
  final FormCallback cb;
  const _ComboStateful({required this.options, required this.cb});

  @override
  State<_ComboStateful> createState() => _ComboStatefulState();
}

class _ComboStatefulState extends State<_ComboStateful> {
  String? val = "";

  @override
  Widget build(BuildContext context) {
    return ComboBox<String>(
      value: val,
      items:
          widget.options
              .map((opt) => ComboBoxItem(value: opt, child: Text(opt)))
              .toList(),
      onChanged: (u) {
        setState(() {
          val = u;
        });
        widget.cb(u);
      },
    );
  }
}
