import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'entry.dart';
import 'combo.dart';
import 'termtitleref.dart';
import 'idwidget.dart';
import 'agencywidget.dart';
import '../../provider/node_provider.dart';
import 'package:authority/authority.dart' show StatusType, StatusKind;
import 'package:intl/intl.dart' show DateFormat;

const double _addEntryHeight = 36.0;
// Two types:
// An enclosing tag e.g. Status
// Multiple of the same element as siblings, e.g. comments, source, disposal

class Status extends ConsumerWidget {
  static const viewHeight = 30.0;
  static const formHeight = 64.0;
  static const element = "Status";
  const Status({super.key});

  Widget Function(BuildContext, WidgetRef, int flags, Function(int) cb)
  makeForm(int idx, int len) {
    Widget formf(
      BuildContext context,
      WidgetRef ref,
      int flags,
      Function(int) cb,
    ) {
      StatusType st = ref.read(nodeProvider).multiStatusType(idx);

      return switch (st.kind()) {
        StatusKind.date => Row(
          mainAxisSize: MainAxisSize.min,
          children: [_calendar(context, ref, st, idx)],
        ),
        StatusKind.draft => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _calendar(context, ref, st, idx),
            Container(
              padding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
              width: 70.0,
              child: InfoLabel(
                label: "Version",
                labelStyle: FluentTheme.of(context).typography.caption!,
                child: TextBox(
                  controller: TextEditingController(
                    text: ref
                        .read(nodeProvider)
                        .multiGet(st.toElement(), idx, "version"),
                  ),
                  onChanged:
                      (value) => ref
                          .read(nodeProvider)
                          .multiSet(st.toElement(), idx, "version", value),
                ),
              ),
            ),
            AgencyWidget(element: element, index: idx),
          ],
        ),
        StatusKind.issued => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(right: 5.0),
              child: _calendar(context, ref, st, idx),
            ),
            AgencyWidget(element: element, index: idx),
          ],
        ),
        StatusKind.submitted => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _calendar(context, ref, st, idx),
            Padding(
              padding: EdgeInsetsGeometry.fromLTRB(5.0, 0, 5.0, 0),
              child: InfoLabel(
                label: "Officer",
                labelStyle: FluentTheme.of(context).typography.caption!,
                child: SizedBox(
                  width: 160.0,
                  child: TextBox(
                    controller: TextEditingController(
                      text: ref
                          .read(nodeProvider)
                          .multiGet(st.toElement(), idx, "Officer"),
                    ),
                    onChanged:
                        (value) => ref
                            .read(nodeProvider)
                            .multiSet(st.toElement(), idx, "Officer", value),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(right: 5.0),
              child: InfoLabel(
                label: "Position",
                labelStyle: FluentTheme.of(context).typography.caption!,
                child: SizedBox(
                  width: 160.0,
                  child: TextBox(
                    controller: TextEditingController(
                      text: ref
                          .read(nodeProvider)
                          .multiGet(st.toElement(), idx, "Position"),
                    ),
                    onChanged:
                        (value) => ref
                            .read(nodeProvider)
                            .multiSet(st.toElement(), idx, "Position", value),
                  ),
                ),
              ),
            ),
            AgencyWidget(element: element, index: idx),
          ],
        ),
        StatusKind.applying => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InfoLabel(
              label: "Applying",
              labelStyle: FluentTheme.of(context).typography.caption!,
              child: ComboStateful(
                element: st.toElement(),
                idx: idx,
                sub: "extent",
                options: ["whole", "part"],
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.fromLTRB(5.0, 0, 5.0, 5.0),
              child: InfoLabel(
                label: "From",
                labelStyle: FluentTheme.of(context).typography.caption!,
                child: CalendarDatePicker(
                  initialStart: _parseDate(
                    ref
                        .read(nodeProvider)
                        .multiGet(st.toElement(), idx, "StartDate"),
                  ),
                  onSelectionChanged: (value) {
                    ref
                        .read(nodeProvider)
                        .multiSet(
                          st.toElement(),
                          idx,
                          "StartDate",
                          _formatDate(value.startDate),
                        );
                  },
                  isOutOfScopeEnabled: false,
                  isGroupLabelVisible: false,
                  locale: const Locale('en_GB'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.fromLTRB(0, 0, 5.0, 5.0),
              child: InfoLabel(
                label: "To",
                labelStyle: FluentTheme.of(context).typography.caption!,
                child: CalendarDatePicker(
                  initialStart: _parseDate(
                    ref
                        .read(nodeProvider)
                        .multiGet(st.toElement(), idx, "EndDate"),
                  ),
                  onSelectionChanged: (value) {
                    ref
                        .read(nodeProvider)
                        .multiSet(
                          st.toElement(),
                          idx,
                          "EndDate",
                          _formatDate(value.startDate),
                        );
                  },
                  isOutOfScopeEnabled: false,
                  isGroupLabelVisible: false,
                  locale: const Locale('en_GB'),
                ),
              ),
            ),
            AgencyWidget(element: element, index: idx),
          ],
        ),
        StatusKind.supersede => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.fromLTRB(0, 0, 5.0, 5.0),
              child: _calendar(context, ref, st, idx),
            ),
            IDWidget(
              element: st.toElement(),
              sub: "IDRef",
              idx: idx,
              fullControls: false,
            ),
            Container(
              width: 200.0,
              padding: EdgeInsetsGeometry.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: InfoLabel(
                label: "Authority title",
                labelStyle: FluentTheme.of(context).typography.caption!,
                child: TextBox(
                  controller: TextEditingController(
                    text: ref
                        .read(nodeProvider)
                        .multiGet(st.toElement(), idx, "AuthorityTitleRef"),
                  ),
                  onChanged:
                      (value) => ref
                          .read(nodeProvider)
                          .multiSet(
                            st.toElement(),
                            idx,
                            "AuthorityTitleRef",
                            value,
                          ),
                ),
              ),
            ),
            InfoLabel(
              label: "Terms",
              labelStyle: FluentTheme.of(context).typography.caption!,
              child: TermTitleRef(index: idx, element: st.toElement()),
            ),
            Container(
              width: 70.0,
              padding: EdgeInsetsGeometry.only(left: 5.0),
              child: InfoLabel(
                label: "Item no.",
                labelStyle: FluentTheme.of(context).typography.caption!,
                child: TextBox(
                  controller: TextEditingController(
                    text: ref
                        .read(nodeProvider)
                        .multiGet(st.toElement(), idx, "ItemNoRef"),
                  ),
                  onChanged:
                      (value) => ref
                          .read(nodeProvider)
                          .multiSet(st.toElement(), idx, "ItemNoRef", value),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: InfoLabel(
                  label: "Part text",
                  labelStyle: FluentTheme.of(context).typography.caption!,
                  child: TextBox(
                    controller: TextEditingController(
                      text: ref
                          .read(nodeProvider)
                          .multiGet(st.toElement(), idx, "PartText"),
                    ),
                    //onChanged: (value) => ref.read(nodeProvider).mark(name),//
                    onChanged: (value) {
                      ref
                          .read(nodeProvider)
                          .multiSet(
                            st.toElement(),
                            idx,
                            "PartText",
                            value.isEmpty ? null : value,
                          );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        _ => SizedBox(),
      };
    }

    return formf;
  }

  Widget Function(BuildContext, WidgetRef) makeView(int idx, int len) {
    Widget viewf(BuildContext context, WidgetRef ref) {
      return Row(
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: ref.read(nodeProvider).status(idx),
              ),
              maxLines: null,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      );
    }

    return viewf;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int l = ref.watch(nodeProvider).multiLen(element);
    final double height =
        (l == 0)
            ? _addEntryHeight + 36.0
            : (l - 1) * viewHeight + formHeight + _addEntryHeight;

    return SizedBox(
      height: height,
      child: InfoLabel(
        label: "Status events",
        child: ListView.builder(
          itemCount: l + 1, // add one for the plus button
          itemBuilder: (BuildContext context, int index) {
            if (index >= l) {
              return Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(7.0, 7.0, 0.0, 0.0),
                child: DropDownButton(
                  title: Icon(
                    FluentIcons.add,
                    color: FluentTheme.of(context).accentColor,
                  ),

                  items: [
                    MenuFlyoutItem(
                      text: const Text('Draft'),
                      onPressed:
                          () => ref
                              .read(nodeProvider.notifier)
                              .multiAdd(element, "Draft"),
                      /* Handle option 1 */
                    ),
                    MenuFlyoutItem(
                      text: const Text('Submitted'),
                      onPressed:
                          () => ref
                              .read(nodeProvider.notifier)
                              .multiAdd(element, "Submitted"),
                    ),
                    MenuFlyoutItem(
                      text: const Text('Approved'),
                      onPressed:
                          () => ref
                              .read(nodeProvider.notifier)
                              .multiAdd(element, "Approved"),
                    ),
                    MenuFlyoutItem(
                      text: const Text('Issued'),
                      onPressed:
                          () => ref
                              .read(nodeProvider.notifier)
                              .multiAdd(element, "Issued"),
                    ),
                    MenuFlyoutItem(
                      text: const Text('Amended'),
                      onPressed:
                          () => ref
                              .read(nodeProvider.notifier)
                              .multiAdd(element, "Amended"),
                    ),
                    MenuFlyoutItem(
                      text: const Text('Applying'),
                      onPressed:
                          () => ref
                              .read(nodeProvider.notifier)
                              .multiAdd(element, "Applying"),
                    ),
                    MenuFlyoutItem(
                      text: const Text('Partly Supersedes'),
                      onPressed:
                          () => ref
                              .read(nodeProvider.notifier)
                              .multiAdd(element, "PartSupersedes"),
                    ),
                    MenuFlyoutItem(
                      text: const Text('Supersedes'),
                      onPressed:
                          () => ref
                              .read(nodeProvider.notifier)
                              .multiAdd(element, "Supersedes"),
                    ),
                    MenuFlyoutItem(
                      text: const Text('Partly Superseded By'),
                      onPressed:
                          () => ref
                              .read(nodeProvider.notifier)
                              .multiAdd(element, "PartSupersededBy"),
                    ),
                    MenuFlyoutItem(
                      text: const Text('Superseded By'),
                      onPressed:
                          () => ref
                              .read(nodeProvider.notifier)
                              .multiAdd(element, "SupersededBy"),
                    ),
                    MenuFlyoutItem(
                      text: const Text('Review'),
                      onPressed:
                          () => ref
                              .read(nodeProvider.notifier)
                              .multiAdd(element, "Review"),
                    ),
                    MenuFlyoutItem(
                      text: const Text('Expired'),
                      onPressed:
                          () => ref
                              .read(nodeProvider.notifier)
                              .multiAdd(element, "Expired"),
                    ),
                    MenuFlyoutItem(
                      text: const Text('Revoked'),
                      onPressed:
                          () => ref
                              .read(nodeProvider.notifier)
                              .multiAdd(element, "Revoked"),
                    ),
                  ],
                ),
              );
            }
            return MultiEntry(
              key: UniqueKey(),
              element: element,
              index: index,
              len: l,
              formFn: makeForm(index, l),
              viewFn: makeView(index, l),
            );
          },
        ),
      ),
    );
  }
}

DateTime? _parseDate(String? val) {
  if (val == null) return null;
  try {
    return DateTime.parse(val);
  } catch (e) {
    return null;
  }
}

final DateFormat format = DateFormat("yyyy-MM-dd");

String? _formatDate(DateTime? dt) {
  if (dt == null) return null;
  return format.format(dt);
}

Widget _calendar(
  BuildContext context,
  WidgetRef ref,
  StatusType st,
  int index,
) {
  return InfoLabel(
    label: st.toString(),
    labelStyle: FluentTheme.of(context).typography.caption!,
    child: CalendarDatePicker(
      initialStart: _parseDate(
        ref
            .read(nodeProvider)
            .multiGet(
              st.toElement(),
              index,
              (st.kind() == StatusKind.date) ? null : "Date",
            ),
      ),
      onSelectionChanged: (value) {
        ref
            .read(nodeProvider)
            .multiSet(
              st.toElement(),
              index,
              (st.kind() == StatusKind.date) ? null : "Date",
              _formatDate(value.startDate),
            );
      },
      isOutOfScopeEnabled: false,
      isGroupLabelVisible: false,
      locale: const Locale('en_GB'),
    ),
  );
}
