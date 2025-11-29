import 'package:fluent_ui/fluent_ui.dart'
    show TextSpan, TextStyle, FontWeight, FontStyle, TextDecoration, Colors;
import 'package:xml/xml.dart'
    show XmlElement, XmlNode, XmlNodeType, XmlStringExtension;
import 'package:intl/intl.dart' show DateFormat;
import 'node.dart' show StatusType, StatusKind, NodeType;

const _nl = TextSpan(text: "\n");

DateTime? _parseDate(String? val) {
  if (val == null) return null;
  try {
    return DateTime.parse(val);
  } catch (e) {
    return null;
  }
}

final DateFormat format = DateFormat("d MMM yyyy");

String? _formatDate(DateTime? dt) {
  if (dt == null) return null;
  return format.format(dt);
}

String? _agency(String? name, String? agencyno) {
  if (name == null && agencyno == null) return null;
  if (agencyno == null) return name;
  if (name == null) return "($agencyno)";
  return "$name ($agencyno)";
}

String? _id(String? control, String? content) {
  if (control == null && content == null) return null;
  if (control == null) return content;
  if (content == null) return content;
  return "$control $content";
}

mixin Render {
  String? get(String name);
  List<XmlElement>? getParagraphs(String name);
  int multiLen(String name);
  String? multiGet(String name, int idx, String? sub);
  StatusType multiStatusType(int idx);
  List<XmlElement>? multiGetParagraphs(String name, int idx, String? sub);
  int termsRefLen(String name, int idx);
  String? termsRefGet(String name, int idx, int tidx);

  List<TextSpan> ids(int index) {
    String? id = _id(
      multiGet("ID", index, "control"),
      multiGet("ID", index, null),
    );
    if (id == null) return [];
    return [_toSpan(0, id)];
  }

  List<TextSpan> linkedto(int index) {
    String? typ = multiGet("LinkedTo", index, "type");
    String? content = multiGet("LinkedTo", index, null);
    if (typ != null && content != null) {
      return [_toSpan(1, typ), _toSpan(0, ": $content")];
    }
    if (typ != null) return [_toSpan(1, typ)];
    if (content != null) return [_toSpan(0, content)];
    return [];
  }

  List<TextSpan> source(int index) {
    String? url = multiGet("Source", index, "url");
    String? content = multiGet("Source", index, null);
    if (url != null && content != null) {
      return [
        _toSpan(2, content),
        _toSpan(0, " ("),
        _toSpan(3, url),
        _toSpan(0, ")"),
      ];
    }
    if (url != null) return [_toSpan(3, url)];
    if (content != null) return [_toSpan(2, content)];
    return [];
  }

  List<TextSpan> comments() {
    List<TextSpan> comments = [];
    final l = multiLen("Comment");
    for (var i = 0; i < l; i++) {
      comments.addAll(comment(i));
      if (i + 1 < l) {
        comments.add(_nl);
      }
    }
    return comments;
  }

  List<TextSpan> comment(int index) {
    List<TextSpan> comment = [];
    String? author = multiGet("Comment", index, "author");
    List<XmlElement>? content = multiGetParagraphs("Comment", index, null);

    if (author != null) comment.add(_toSpan(1, '$author: '));
    if (content != null) comment.addAll(_renderParas(content));
    return comment;
  }

  List<TextSpan> title(NodeType nt) {
    String? t = get(nt.toTitle());
    return (t == null) ? [] : [_toSpan(1, t)];
  }

  List<TextSpan> description(NodeType nt) {
    List<TextSpan> desc = [];
    List<XmlElement>? content = getParagraphs(nt.toDescription());
    if (content != null) desc.addAll(_renderParas(content));
    List<TextSpan> seerefs = seereferences();
    if (seerefs.isNotEmpty) {
      if (content != null) desc.add(_nl);
      desc.addAll(seerefs);
    }
    return desc;
  }

  List<TextSpan> seereferences() {
    List<TextSpan> seerefs = [];
    final l = multiLen("SeeReference");
    for (var i = 0; i < l; i++) {
      seerefs.addAll(seereference(i));
      if (i + 1 < l) {
        seerefs.add(_nl);
      }
    }
    return seerefs;
  }

  List<TextSpan> seereference(int index) {
    List<TextSpan> seeref = [_toSpan(0, "See")];
    String? id = _id(
      multiGet("SeeReference", index, "control"),
      multiGet("SeeReference", index, "IDRef"),
    );
    if (id != null) seeref.add(_toSpan(0, " $id"));
    String? title = multiGet("SeeReference", index, "AuthorityTitleRef");
    if (title != null) seeref.add(_toSpan(2, " $title"));
    int num = termsRefLen("SeeReference", index);
    List<String> terms = List.filled(num, "", growable: true);
    int tidx = 0;
    for (; num > 0; num--) {
      terms[tidx] = termsRefGet("SeeReference", index, tidx) ?? "";
      tidx++;
    }
    String? itemno = multiGet("SeeReference", index, "ItemNoRef");
    if (itemno != null) terms.add(itemno);
    if (terms.isNotEmpty) seeref.add(_toSpan(1, " ${terms.join(" - ")}"));
    String? seetext = multiGet("SeeReference", index, "SeeText");
    if (seetext != null) seeref.add(_toSpan(0, " $seetext"));

    return seeref;
  }

  List<TextSpan> justification(NodeType nt) {
    if (nt != NodeType.classType) return [];
    List<XmlElement>? content = getParagraphs("Justification");
    return (content == null) ? [] : _renderParas(content);
  }

  List<TextSpan> status(int index) {
    StatusType st = multiStatusType(index);
    switch (st.kind()) {
      case StatusKind.date:
        return _statusDate(st, index);
      case StatusKind.supersede:
        return _statusSupersede(st, index);
      case StatusKind.draft:
        return _statusDraft(st, index);
      case StatusKind.submitted:
        return _statusSubmitted(st, index);
      case StatusKind.applying:
        return _statusApplying(st, index);
      case StatusKind.issued:
        return _statusIssued(st, index);
      default:
        return [];
    }
  }

  List<TextSpan> _statusSupersede(StatusType st, int index) {
    List<TextSpan> ret = [_toSpan(0, st.toString())];
    String? id = _id(
      multiGet(st.toElement(), index, "control"),
      multiGet(st.toElement(), index, "IDRef"),
    );
    if (id != null) ret.add(_toSpan(0, " $id"));
    String? title = multiGet(st.toElement(), index, "AuthorityTitleRef");
    if (title != null) ret.add(_toSpan(2, " $title"));
    int num = termsRefLen(st.toElement(), index);
    List<String> terms = List.filled(num, "", growable: true);
    int tidx = 0;
    for (; num > 0; num--) {
      terms[tidx] = termsRefGet(st.toElement(), index, tidx) ?? "";
      tidx++;
    }
    String? itemno = multiGet(st.toElement(), index, "ItemNoRef");
    if (itemno != null) terms.add(itemno);
    if (terms.isNotEmpty) ret.add(_toSpan(1, " ${terms.join(" - ")}"));
    String? parttext = multiGet(st.toElement(), index, "PartText");
    if (parttext != null) ret.add(_toSpan(0, " $parttext"));
    String? date = _formatDate(
      _parseDate(multiGet(st.toElement(), index, "Date")),
    );
    if (date != null) ret.add(_toSpan(0, " on $date"));
    return ret;
  }

  List<TextSpan> _statusDraft(StatusType st, int index) {
    List<TextSpan> ret = [_toSpan(0, st.toString())];
    String? version = multiGet(st.toElement(), index, "version");
    String? agency = _agency(
      multiGet(st.toElement(), index, "Agency"),
      multiGet(st.toElement(), index, "agencyno"),
    );
    String? date = _formatDate(
      _parseDate(multiGet(st.toElement(), index, "Date")),
    );
    if (version != null) ret.add(_toSpan(0, " v.$version"));
    if (agency != null) ret.add(_toSpan(0, ", $agency"));
    if (date != null) {
      if (ret.length > 1) {
        ret.add(_toSpan(0, ", $date"));
      } else {
        ret.add(_toSpan(0, " $date"));
      }
    }
    return ret;
  }

  List<TextSpan> _statusIssued(StatusType st, int index) {
    List<TextSpan> ret = [_toSpan(0, st.toString())];
    String? agency = _agency(
      multiGet(st.toElement(), index, "Agency"),
      multiGet(st.toElement(), index, "agencyno"),
    );
    String? date = _formatDate(
      _parseDate(multiGet(st.toElement(), index, "Date")),
    );
    if (agency != null) {
      ret.add(_toSpan(0, " to $agency"));
    }
    if (date != null) {
      ret.add(_toSpan(0, " on $date"));
    }
    return ret;
  }

  List<TextSpan> _statusSubmitted(StatusType st, int index) {
    List<TextSpan> ret = [_toSpan(0, st.toString())];
    String? officer = multiGet(st.toElement(), index, "Officer");
    String? position = multiGet(st.toElement(), index, "Officer");
    String? agency = _agency(
      multiGet(st.toElement(), index, "Agency"),
      multiGet(st.toElement(), index, "agencyno"),
    );
    String? date = _formatDate(
      _parseDate(multiGet(st.toElement(), index, "Date")),
    );
    if (officer != null || position != null || agency != null) {
      ret.add(_toSpan(0, " by "));
      if (officer != null) {
        ret.add(_toSpan(0, officer));
      }
      if (position != null) {
        if (ret.length > 2) {
          ret.add(_toSpan(0, ", $position"));
        } else {
          ret.add(_toSpan(0, position));
        }
      }
      if (agency != null) {
        if (ret.length > 2) {
          ret.add(_toSpan(0, ", $agency"));
        } else {
          ret.add(_toSpan(0, agency));
        }
      }
    }
    if (date != null) {
      ret.add(_toSpan(0, " on $date"));
    }
    return ret;
  }

  List<TextSpan> _statusApplying(StatusType st, int index) {
    List<TextSpan> ret = [_toSpan(0, "Applied")];
    String? agency = _agency(
      multiGet(st.toElement(), index, "Agency"),
      multiGet(st.toElement(), index, "agencyno"),
    );
    String? extent = multiGet(st.toElement(), index, "extent");
    String? start = _formatDate(
      _parseDate(multiGet(st.toElement(), index, "StartDate")),
    );
    String? end = _formatDate(
      _parseDate(multiGet(st.toElement(), index, "StartDate")),
    );
    if (extent != null) {
      ret.add(_toSpan(0, " in $extent"));
    }
    if (agency != null) {
      ret.add(_toSpan(0, " by $agency"));
    }
    if (start != null) {
      ret.add(_toSpan(0, " from $start"));
    }
    if (end != null) {
      ret.add(_toSpan(0, " until $end"));
    }
    return ret;
  }

  List<TextSpan> _statusDate(StatusType st, int index) {
    String? date = _formatDate(
      _parseDate(multiGet(st.toElement(), index, null)),
    );
    if (date == null) return [_toSpan(0, st.toString())];
    return [_toSpan(0, "${st.toString()} on $date")];
  }

  List<TextSpan> disposals(NodeType nt) {
    List<TextSpan> disposals = [];
    if (nt != NodeType.classType) return disposals;
    final l = multiLen("Disposal");
    for (var i = 0; i < l; i++) {
      disposals.addAll(disposal(i));
      if (i + 1 < l) {
        disposals.add(_nl);
      }
    }
    return disposals;
  }

  List<TextSpan> disposal(int index) {
    List<TextSpan> action = [];

    String? condition = multiGet("Disposal", index, "DisposalCondition");
    String? retentionPeriod = multiGet("Disposal", index, "RetentionPeriod");
    String? retentionUnit = multiGet("Disposal", index, "unit");
    String? trigger = multiGet("Disposal", index, "DisposalTrigger");
    String? disposalAction = multiGet("Disposal", index, "DisposalAction");
    String? transferTo = multiGet("Disposal", index, "TransferTo");
    if (transferTo != null) transferTo = " to $transferTo";
    List<XmlElement>? customAction = multiGetParagraphs(
      "Disposal",
      index,
      "CustomAction",
    );

    String retention(String? period, String? unit, String? trigger) {
      if (period == null && trigger == null) return "";
      if (period == null) return "until $trigger";
      unit ??= "years"; // should not reach
      String ret =
          (unit == "1")
              ? "$period ${unit.substring(0, unit.length - 1)}"
              : "$period $unit";
      if (trigger == null) return "minimum of $ret";
      return "minimum of $ret after $trigger";
    }

    String ret = retention(retentionPeriod, retentionUnit, trigger);
    switch (disposalAction) {
      case null:
        break;
      case "Required as State archives":
        action.add(_toSpan(0, disposalAction));
      case "Destroy":
        action.add(
          _toSpan(0, (ret.isEmpty) ? "Destroy" : "Retain $ret, then destroy"),
        );
      case "Transfer":
        action.add(
          _toSpan(
            0,
            (ret.isEmpty)
                ? "Transfer$transferTo"
                : "Retain $ret, then transfer$transferTo",
          ),
        );
      default: // "Retain in agency"
        action.add(_toSpan(0, disposalAction));
    }
    if (customAction != null) {
      if (action.isNotEmpty) action.add(_toSpan(0, '\n'));
      action.addAll(_renderParas(customAction));
    }
    if (condition != null) {
      action.insert(0, _toSpan(1, '$condition:\n'));
    }
    return action;
  }
}

const bullet = "\u2022";
List<TextSpan> _renderParas(List<XmlElement> paragraphs) {
  StringBuffer buf = StringBuffer();
  List<TextSpan> ret = [];

  int getStyle(XmlNode node) {
    if (node.nodeType != XmlNodeType.ELEMENT) return 0;
    switch ((node as XmlElement).name.local) {
      case "List":
        return -1;
      case "Emphasis":
        return 1;
      case "Source":
        if (node.getAttribute("url") == null) return 2;
        return 3;
    }
    return 0;
  }

  void commitNode(XmlNode node, int style) {
    String txt =
        (node.nodeType == XmlNodeType.TEXT) ? node.value! : node.innerText;
    if (txt.trim().isEmpty) return; // kill blank text nodes
    if (style == 0) {
      buf.write(txt);
      return;
    }
    if (buf.length > 0) {
      ret.add(_toSpan(0, buf.toString()));
      buf.clear();
    }
    ret.add(_toSpan(style, txt));
    return;
  }

  bool first = true;
  for (var para in paragraphs) {
    if (first) {
      first = false;
    } else {
      buf.write("\n");
    }
    bool nl = true;
    for (var child in para.children) {
      int style = getStyle(child);
      if (style < 0) {
        for (var item in child.children) {
          if (!nl) {
            buf.write("\n");
          }
          buf.write("$bullet ");
          for (var node in item.children) {
            style = getStyle(node);
            commitNode(node, style);
            nl = false;
          }
        }
      } else {
        commitNode(child, style);
        nl = false;
      }
    }
  }
  if (buf.length > 0) {
    ret.add(_toSpan(0, buf.toString()));
  }
  return ret;
}

// Create textspans with style
TextSpan _toSpan(int style, String text) {
  switch (style) {
    case 0:
      return TextSpan(text: text);
    case 1:
      return TextSpan(
        style: TextStyle(fontWeight: FontWeight.bold),
        text: text,
      );
    case 2:
      return TextSpan(
        style: TextStyle(fontStyle: FontStyle.italic),
        text: text,
      );
    default:
      return TextSpan(
        style: TextStyle(
          decoration: TextDecoration.underline,
          color: Colors.blue,
        ),
        text: text,
      );
  }
}
