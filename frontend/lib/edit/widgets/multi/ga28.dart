import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/node_provider.dart';

class GA28 extends ConsumerStatefulWidget {
  final int index;
  const GA28({super.key, required this.index}); //, this.elements});

  @override
  ConsumerState<GA28> createState() => _GA28State();
}

class _GA28State extends ConsumerState<GA28> {
  String? function;
  String? activity;
  List<String> activities = [""];

  @override
  void initState() {
    function = ref
        .read(nodeProvider)
        .termsRefGet("SeeReference", widget.index, 0);
    if (function != null) {
      activities = _ga28activities[function] ?? [""];
    }
    activity = ref
        .read(nodeProvider)
        .termsRefGet("SeeReference", widget.index, 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ComboBox<String>(
          value: function,
          items:
              _ga28functions
                  .map((opt) => ComboBoxItem(value: opt, child: Text(opt)))
                  .toList(),
          onChanged: (u) {
            setState(() {
              ref
                  .read(nodeProvider)
                  .termsRefSet("SeeReference", widget.index, 0, u!);
              function = u;
              if (activity != null) {
                ref
                    .read(nodeProvider)
                    .termsRefSet("SeeReference", widget.index, 1, null);
              }
              activity = null;
              activities = _ga28activities[function]!;
            });
          },
        ),
        Container(
          padding: EdgeInsets.only(left: 5.0),
          //width: 350.0,
          child: ComboBox<String>(
            value: activity,
            items:
                activities
                    .map((opt) => ComboBoxItem(value: opt, child: Text(opt)))
                    .toList(),
            onChanged: (u) {
              setState(() {
                if (ref
                        .read(nodeProvider)
                        .termsRefLen("SeeReference", widget.index) <
                    2) {
                  ref
                      .read(nodeProvider)
                      .termsRefAdd("SeeReference", widget.index);
                }
                ref
                    .read(nodeProvider)
                    .termsRefSet(
                      "SeeReference",
                      widget.index,
                      1,
                      (u!.isNotEmpty) ? u : null,
                    );
                activity = u;
              });
            },
          ),
        ),
      ],
    );
  }
}

final List<String> _ga28functions = [
  "COMMITTEES",
  "COMMUNITY RELATIONS",
  "COMPENSATION",
  "CONTRACTING-OUT & COMMERCIAL SERVICES",
  "EQUIPMENT & STORES",
  "ESTABLISHMENT",
  "FINANCIAL MANAGEMENT",
  "FLEET MANAGEMENT",
  "GOVERNING & CORPORATE BODIES",
  "GOVERNMENT RELATIONS",
  "INDUSTRIAL RELATIONS",
  "INFORMATION MANAGEMENT",
  "LEGAL SERVICES",
  "OCCUPATIONAL HEALTH & SAFETY",
  "PERSONNEL",
  "PROPERTY MANAGEMENT",
  "PUBLICATION",
  "STAFF DEVELOPMENT",
  "STRATEGIC MANAGEMENT",
  "TECHNOLOGY & TELECOMMUNICATIONS",
  "TENDERING",
];

final Map<String, List<String>> _ga28activities = {
  "COMMITTEES": [""],
  "COMMUNITY RELATIONS": [
    "",
    "Acquisition ",
    "Addresses",
    "Agreements",
    "Celebrations, ceremonies, functions",
    "Conferences",
    "Customer service",
    "Donations, sponsorships and fundraising",
    "Enquiries",
    "Evaluation",
    "Greetings",
    "Joint ventures",
    "Liaison",
    "Marketing",
    "Media relations",
    "Planning",
    "Policy",
    "Procedures",
    "Public reaction",
    "Reporting",
    "Reviewing",
    "Submissions",
    "Visits",
  ],
  "COMPENSATION": [
    "",
    "Advice",
    "Claims",
    "Compliance",
    "Insurance",
    "Policy",
    "Procedures",
    "Reviewing",
  ],
  "CONTRACTING-OUT & COMMERCIAL SERVICES": [""],
  "EQUIPMENT & STORES": [
    "",
    "Acquisition",
    "Agreements",
    "Allocation",
    "Arrangements",
    "Audit",
    "Claims",
    "Compliance",
    "Disposal",
    "Evaluation",
    "Installation",
    "Insurance",
    "Leasing",
    "Leasing-out",
    "Maintenance",
    "Policy",
    "Procedures",
    "Reporting",
    "Reviewing",
    "Security",
    "Stocktake",
  ],
  "ESTABLISHMENT": [
    "",
    "Evaluation",
    "Planning",
    "Policy",
    "Procedures",
    "Reporting",
    "Restructuring",
    "Variations",
  ],
  "FINANCIAL MANAGEMENT": [
    "",
    "Accounting",
    "Advice",
    "Agreements",
    "Allocation",
    "Asset register",
    "Audit",
    "Authorisation",
    "Budgeting",
    "Compliance",
    "Corruption",
    "Evaluation",
    "Financial statements",
    "Planning",
    "Policy",
    "Procedures",
    "Reporting",
    "Reviewing",
    "Salaries",
    "Treasury management",
  ],
  "FLEET MANAGEMENT": [
    "",
    "Accidents",
    "Acquisition",
    "Arrangements",
    "Authorisation",
    "Claims",
    "Compliance",
    "Disposal",
    "Infringements",
    "Insurance",
    "Leasing",
    "Leasing-out",
    "Maintenance",
    "Planning",
    "Policy",
    "Procedures",
    "Reporting",
    "Reviewing",
  ],
  "GOVERNING & CORPORATE BODIES": [
    "",
    "Advice",
    "Agreements",
    "Appeals",
    "Arrangements",
    "Audit",
    "Authorisation",
    "Authorities",
    "Compliance",
    "Corruption",
    "Meetings",
    "Membership",
    "Performance management",
    "Policy",
    "Procedures",
    "Training and development",
  ],
  "GOVERNMENT RELATIONS": [
    "",
    "Addresses",
    "Advice",
    "Agreements",
    "Authorisation",
    "Compliance",
    "Inquiries",
    "Legislation",
    "Meetings",
    "Policy",
    "Procedures",
    "Reporting",
    "Representations",
    "Submissions",
    "Visits",
  ],
  "INDUSTRIAL RELATIONS": [
    "",
    "Agreements",
    "Appeals",
    "Claims",
    "Disputes",
    "Grievances",
    "Insurance",
    "Meetings",
    "Planning",
    "Policy",
    "Procedures",
    "Reporting",
  ],
  "INFORMATION MANAGEMENT": [
    "",
    "Acquisition",
    "Agreements",
    "Appeals",
    "Audit",
    "Authorisation",
    "Cases",
    "Compliance",
    "Conservation",
    "Control",
    "Customer service",
    "Disposal",
    "Distribution",
    "Donations",
    "Enquiries",
    "Evaluation",
    "Implementation",
    "Intellectual property",
    "Inventory",
    "Marketing",
    "Planning",
    "Policy",
    "Procedures",
    "Reporting",
    "Reviewing",
    "Security",
  ],
  "LEGAL SERVICES": [
    "",
    "Advice",
    "Agreements",
    "Compliance",
    "Litigation",
    "Planning",
    "Policy",
    "Procedures",
    "Reporting",
    "Research",
    "Reviewing",
  ],
  "OCCUPATIONAL HEALTH & SAFETY": [
    "",
    "Accidents",
    "Appeals",
    "Audit",
    "Compliance",
    "Health promotion",
    "Inspections",
    "Planning",
    "Policy",
    "Procedures",
    "Reporting",
    "Representatives",
    "Reviewing",
    "Risk management",
    "Standards",
  ],
  "PERSONNEL": [
    "",
    "Advice",
    "Authorisation",
    "Compliance",
    "Employee service history",
    "Grievances",
    "Insurance",
    "Leave, attendance and absences",
    "Misconduct",
    "Performance management",
    "Recruitment",
    "Reporting",
    "Representatives",
    "Reviewing",
    "Security",
    "Social clubs and groups",
    "Suggestions",
  ],
  "PROPERTY MANAGEMENT": [
    "",
    "Acquisition",
    "Arrangements",
    "Audit",
    "Claims",
    "Compliance",
    "Conservation",
    "Construction",
    "Disposal",
    "Evaluation",
    "Flora & fauna management",
    "Inspections",
    "Installation",
    "Insurance",
    "Leasing",
    "Leasing-out",
    "Maintenance",
    "Moving",
    "Planning",
    "Policy",
    "Procedures",
    "Reporting",
    "Reviewing",
    "Risk management",
    "Security",
    "Traffic management",
  ],
  "PUBLICATION": [
    "",
    "Agreements",
    "Authorisation",
    "Compliance",
    "Corporate style",
    "Distribution",
    "Drafting",
    "Enquiries",
    "Evaluation",
    "Intellectual property",
    "Joint ventures",
    "Marketing",
    "Planning",
    "Policy",
    "Procedures",
    "Production",
    "Reporting",
    "Reviewing",
    "Stocktake",
  ],
  "STAFF DEVELOPMENT": [
    "",
    "Acquisition",
    "Addresses",
    "Audit",
    "Conferences",
    "Evaluation",
    "Planning",
    "Policy",
    "Procedures",
    "Reporting",
    "Reviewing",
    "Training",
  ],
  "STRATEGIC MANAGEMENT": [
    "",
    "Agreements",
    "Audit",
    "Authorisation",
    "Compliance",
    "Corruption",
    "Customer service",
    "Evaluation",
    "Grant funding and allocation",
    "Implementation",
    "Intellectual property",
    "Joint ventures",
    "Legislation",
    "Meetings",
    "Planning",
    "Policy",
    "Procedures",
    "Reporting",
    "Reviewing",
    "Risk management",
    "Standards",
  ],
  "TECHNOLOGY & TELECOMMUNICATIONS": [
    "",
    "Acquisition",
    "Agreements",
    "Allocation",
    "Application development & management",
    "Arrangements",
    "Audit",
    "Compliance",
    "Customer service",
    "Data administration",
    "Disposal",
    "Evaluation",
    "Implementation",
    "Installation",
    "Intellectual property",
    "Leasing-out",
    "Maintenance",
    "Planning",
    "Policy",
    "Procedures",
    "Reporting",
    "Restructuring",
    "Reviewing",
    "Security",
  ],
  "TENDERING": [""],
};
