import 'package:fluent_ui/fluent_ui.dart';

Future<String?> showStocks(BuildContext context) async {
  final url = await showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      String? selection;
      return ContentDialog(
        constraints: BoxConstraints(maxHeight: 600.0, maxWidth: 600.0),
        content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return ListView(
              children:
                  justifications.map((j) {
                    return InfoLabel(
                      label: j.$1,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      child: Padding(
                        padding: EdgeInsetsGeometry.only(bottom: 20.0),
                        child: Column(
                          children:
                              j.$2
                                  .map(
                                    (i) => ListTile.selectable(
                                      key: UniqueKey(),
                                      title: Text(i),
                                      selected: selection == i,
                                      onSelectionChange: (selected) {
                                        if (selected) {
                                          setState(() => selection = i);
                                        }
                                      },
                                    ),
                                  )
                                  .toList(),
                        ),
                      ),
                    );
                  }).toList(),
            );
          },
        ),
        actions: [
          Button(
            child: const Text('Select'),
            onPressed: () {
              Navigator.pop(context, selection);
              // Delete file here
            },
          ),
          FilledButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context, ''),
          ),
        ],
      );
    },
  );
  return url;
}

const List<(String, List<String>)> justifications = [
  (
    "Basis for determination",
    [
      "Basis for determination\nBuilding the archives policy:\nPrecedent: Confirms Board decision of \nBenchmark: \nJustification/Remarks:",
    ],
  ),
  (
    "Regulatory requirements",
    [
      "Retention period meets requirements of [name of Act/Regulation, section no.], which requires [brief description of records] to be retained for [period of time].",
      "Retention period meets requirements of [name of code/standard/rules etc], which specifies that [brief description of records] must be retained for [period of time] ([reference no.]).",
    ],
  ),
  (
    "Accountability requirements",
    [
      "Evidence of [policy / procedures / processes] in place at a particular time may be required for [future claims / legal action involving the organisation].",
      "Retention period encompasses limitation periods for potential [legal action / disputes] concerning [fulfilment / terms and conditions] of [agreement / contract].",
      "Records provide supporting evidence of expenditure required for accountability purposes.",
      "Records document basis of payments for…, and should therefore be retained in accordance with other financial records.",
      "Records may be required to demonstrate that [due care / action] was taken to [eliminate or detect deficient practices / rectify faults / improve services].",
      "Records provide evidence of the organisation's compliance with….",
      "Records may be relevant to compensation claims for [property damage / personal injury].",
      "Records document authorisations for use of the organisation's resources.",
      "Records may be required as evidence of [decision making / actions].",
      "Retention period ensures that records are available for reference in the event that [further complaints are received / investigation is re-opened].",
      "Records document advice given regarding compliance with legislation.",
    ],
  ),
  (
    "Business needs",
    [
      "Retention period based on potential use of records for administrative and reference purposes while [agreement / plan / policy / procedures / guidelines / publication / process] is current and potential use for reference as part of review processes.",
      "Retention period based on potential use of records for reference purposes while [services / standards / processes] are in place and for use in development of future [services / standards / processes].",
      "[Advice / information] provided is of a general or routine nature only. Records do not document substantive [commitments / dealings / agreements] and have limited use for administrative or reference purposes.",
      "Retention period based on requirement for information for end of financial year reporting.",
      "Retention period based on use of information for [planning / evaluation / reporting / reviewing] cycles. Records may be required for analysis of trends over time.",
      "[Reports / statements / summaries] are generated on a regular basis and consolidated into final reports to [board / executive / committee], which are retained for [period of time] (see [class no.]).",
      "Records relating to administrative arrangements for conduct of [audits / meetings / consultation] have limited use for reference or other purposes after finalisation of arrangements. Significant information pertaining to [results / outcomes / recommendations] will be documented in [final reports / minutes of meetings], which will be retained for [period of time] (see [class no.]).",
      "Records are only of value to the organisation while current.",
      "Records are facilitative in nature and likely to have limited ongoing use for administrative, accountability or reference purposes.",
      "Retention period based on short-term requirement for records for data entry. Records in [name of database] form the primary record and will be retained for [period of time] (see [class no.]).",
      "Retention period based on potential use of records for ongoing [administrative / accountability / reference] purposes.",
      "Retention period based on potential use of records for [administrative / reference] purposes, which is likely to be short term.",
    ],
  ),
  (
    "Community expectations",
    [
      "[Name of stakeholder group] expect that the organisation will be able to re-issue [qualification / licence / permit] if required, so sufficient information must be retained [for potential working life / while licence is current].",
    ],
  ),
  (
    "Consistency with previous disposal decisions",
    [
      "Retention period consistent with that identified for records relating to… ([class no.]).",
      "Retention period consistent with that identified for [brief description of records] in [name of retention and disposal authority], and assessed and confirmed by [name of business unit etc] staff as appropriate to meet [operational / business] needs.",
      "Retention period consistent with approach in other Australian jurisdiction ([name of disposal authority], [class number]), and assessed and confirmed by [name of business unit etc] staff as appropriate to meet [operational / business] needs.",
    ],
  ),
  (
    "State archives (Appraisal objective 1)",
    [
      "Records provide the source of authority for the Government and public offices to act.",
      "Records establish the jurisdictions, functions, responsibilities and powers of the Government and public offices at a point in time.",
      "Records provide evidence of the development and implementation of major policies and programs of the NSW Government and public offices, including those which are controversial or innovative.",
      "Records provide evidence of important decisions and activities influencing the administration of government and governance of the people of NSW.",
      "Records document official responses to significant threats, issues or challenges facing the State of NSW.",
      "Records document high profile cases of corruption or maladministration within the Government or public offices.",
    ],
  ),
  (
    "State archives (Appraisal objective 2)",
    [
      "Records are essential for the establishment and protection of fundamental rights and entitlements of individuals and groups within the community and the ongoing administration of the State.",
      "Records provide evidence of the identity of individuals and groups, their right to participate in the affairs of the State and make claim to entitlements and protection provided by the State.",
    ],
  ),
  (
    "State archives (Appraisal objective 3)",
    [
      "Records involve individual case management where it is evident that the government functions and programs have had far-reaching impact or influence on the lives of individuals.",
      "Records provide evidence of representations and appeals against the decisions and actions of the Government, public offices or the legislature that set a precedent.",
      "Records display collaboration or consultation with individuals, organisations and community groups resulting in significant changes to government policy, programs, and service delivery.",
      "Records provide evidence of restriction of individual rights and entitlements, or personal freedoms.",
      "Records demonstrate planning and decision-making in relation to issues with potential long-term impacts affecting the community or the provision of essential services.",
      "Records identify the persons, groups or areas affected by the implementation of policy decisions.",
    ],
  ),
  (
    "State archives (Appraisal objective 4)",
    [
      "Records contribute to the knowledge or understanding of aspects of the history, society, culture or peoples of NSW.",
      "Records relate to events, persons, places and social, environmental, or cultural phenomena of significance to the broader community and the State of NSW.",
    ],
  ),
  (
    "State archives (Appraisal objective 5)",
    [
      "Records document the strategic management of natural resources, including water, land, and minerals provide evidence of the strategic planning behind the use of land.",
      "Records document significant impacts of government decisions on the environment.",
    ],
  ),
];
