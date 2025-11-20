import 'session.dart';
import 'package:xml/xml.dart' show XmlElement;
import 'package:intl/intl.dart' show DateFormat;
import "render.dart";
import 'tree.dart' show Ref;

enum DateType {
  start,
  end;

  @override
  String toString() {
    return switch (this) {
      start => "Start",
      end => "End",
    };
  }
}

enum SeeRefType { none, local, ga28, other }

enum StatusKind { none, date, supersede, draft, submitted, applying, issued }

enum StatusType {
  none,
  draft,
  submitted,
  approved,
  issued,
  applying,
  partsupersedes,
  supersedes,
  partsupersededby,
  supersededby,
  amended,
  review,
  expired,
  revoked;

  StatusKind kind() {
    return switch (this) {
      draft => StatusKind.draft,
      submitted => StatusKind.submitted,
      applying => StatusKind.applying,
      issued => StatusKind.issued,
      partsupersedes ||
      supersedes ||
      partsupersededby ||
      supersededby => StatusKind.supersede,
      approved || amended || review || expired || revoked => StatusKind.date,
      none => StatusKind.none,
    };
  }

  String toElement() {
    return switch (this) {
      draft => "Draft",
      submitted => "Submitted",
      approved => "Approved",
      issued => "Issued",
      applying => "Applying",
      partsupersedes => "PartSupersedes",
      supersedes => "Supersedes",
      partsupersededby => "PartSupersededBy",
      supersededby => "SupersededBy",
      amended => "Amended",
      review => "Review",
      expired => "Expired",
      revoked => "Revoked",
      _ => "None",
    };
  }

  @override
  String toString() {
    return switch (this) {
      draft => "Draft",
      submitted => "Submitted",
      approved => "Approved",
      issued => "Issued",
      applying => "Applying",
      partsupersedes => "Partly supersedes",
      supersedes => "Supersedes",
      partsupersededby => "Partly superseded by",
      supersededby => "Superseded by",
      amended => "Amended",
      review => "Review",
      expired => "Expired",
      revoked => "Revoked",
      _ => "None",
    };
  }
}

StatusType statusTypeFromString(String name) {
  return switch (name) {
    "Draft" => StatusType.draft,
    "Submitted" => StatusType.submitted,
    "Approved" => StatusType.approved,
    "Issued" => StatusType.issued,
    "Applying" => StatusType.applying,
    "PartSupersedes" => StatusType.partsupersedes,
    "Supersedes" => StatusType.supersedes,
    "PartSupersededBy" => StatusType.partsupersededby,
    "SupersededBy" => StatusType.supersededby,
    "Amended" => StatusType.amended,
    "Review" => StatusType.review,
    "Expired" => StatusType.expired,
    "Revoked" => StatusType.revoked,
    _ => StatusType.none,
  };
}

enum NodeType {
  rootType,
  contextType,
  classType,
  termType,
  none;

  @override
  String toString() {
    switch (this) {
      case NodeType.rootType:
        return "Authority";
      case NodeType.contextType:
        return "Context";
      case NodeType.classType:
        return "Class";
      case NodeType.termType:
        return "Term";
      case NodeType.none:
        return "None";
    }
  }

  int toInt() {
    switch (this) {
      case NodeType.rootType:
        return 1;
      case NodeType.contextType:
        return 2;
      case NodeType.classType:
        return 3;
      case NodeType.termType:
        return 4;
      case NodeType.none:
        return 0;
    }
  }

  bool like(NodeType nt) {
    switch (this) {
      case NodeType.termType:
      case NodeType.classType:
        if (nt == NodeType.termType || nt == NodeType.classType) return true;
        return false;
      default:
        return nt == this;
    }
  }
}

NodeType nodeFromString(String name) {
  switch (name) {
    case "Authority":
      return NodeType.rootType;
    case "Context":
      return NodeType.contextType;
    case "Class":
      return NodeType.classType;
    case "Term":
      return NodeType.termType;
  }
  return NodeType.rootType;
}

final DateFormat _format = DateFormat("yyyy-MM-dd");

class CurrentNode with Render {
  int session;
  int mutation;
  Ref ref;
  bool updated = false;
  CurrentNode(this.session, this.mutation, this.ref);

  void _doUpdate() {
    if (!ref.$1.like(NodeType.termType) || updated) return;
    updated = true;
    String today = _format.format(DateTime.now());
    String? didUpdate = get("update");
    if (didUpdate != null && didUpdate == today) return;
    set("update", today);
  }

  NodeType typ() {
    return Session().getType(session);
  }

  int key() {
    return this.session << 56 |
        this.mutation << 40 |
        this.ref.$1.toInt() << 32 |
        this.ref.$2;
  }

  String? get(String name) {
    return Session().get(session, name);
  }

  String? getDate(DateType dt) {
    return Session().getDate(session, dt);
  }

  bool getCirca(DateType dt) {
    return Session().getCirca(session, dt);
  }

  void set(String name, String? value) {
    _doUpdate();
    return Session().set(session, name, value);
  }

  void setDate(DateType dt, String? value) {
    _doUpdate();
    return Session().setDate(session, dt, value);
  }

  void setCirca(DateType dt, bool value) {
    _doUpdate();
    return Session().setCirca(session, dt, value);
  }

  List<XmlElement>? getParagraphs(String name) {
    return Session().getParagraphs(session, name);
  }

  void setParagraphs(String name, List<XmlElement>? paras) {
    _doUpdate();
    return Session().setParagraphs(session, name, paras);
  }

  // Count multi elements
  // Name is either enclosing name "Status"
  // Or element name "SeeReference"
  int multiLen(String name) {
    return Session().multiLen(session, name);
  }

  bool multiEmpty(String name, int idx) {
    return Session().multiEmpty(session, name, idx);
  }

  // Add multi element
  // If sub provided, it goes into enclosing element e.g. Status > Issued
  int multiAdd(String name, String? sub) {
    _doUpdate();
    return Session().multiAdd(session, name, sub);
  }

  // Drop either the nth element with name, or the nth element within name
  void multiDrop(String name, int idx) {
    _doUpdate();
    return Session().multiDrop(session, name, idx);
  } // todo

  // Move up either the nth element with name, or the nth element within name
  void multiUp(String name, int idx) {
    _doUpdate();
    return Session().multiUp(session, name, idx);
  } // todo

  void multiDown(String name, int idx) {
    _doUpdate();
    return Session().multiDown(session, name, idx);
  } // todo

  // For the nth element or nth element within name, set its value if sub null, or set subs value
  void multiSet(String name, int idx, String? sub, String? val) {
    _doUpdate();
    return Session().multiSet(session, name, idx, sub, val);
  }

  // todo: get attribute
  String? multiGet(String name, int idx, String? sub) {
    return Session().multiGet(session, name, idx, sub);
  }

  List<XmlElement>? multiGetParagraphs(String name, int idx, String? sub) {
    return Session().multiGetParagraphs(session, name, idx, sub);
  }

  void multiSetParagraphs(
    String name,
    int idx,
    String? sub,
    List<XmlElement>? val,
  ) {
    _doUpdate();
    return Session().multiSetParagraphs(session, name, idx, sub, val);
  }

  StatusType multiStatusType(int idx) {
    return Session().multiStatusType(session, idx);
  }

  SeeRefType multiSeeRefType(int idx) {
    return Session().multiSeeRefType(session, idx);
  }

  void multiSeeRefAdd(SeeRefType srt) {
    _doUpdate();
    return Session().multiAddSeeRef(session, srt);
  }

  int termsRefLen(String name, int idx) {
    return Session().termsRefLen(session, name, idx);
  }

  void termsRefAdd(String name, int idx) {
    _doUpdate();
    return Session().termsRefAdd(session, name, idx);
  }

  String? termsRefGet(String name, int idx, int tidx) {
    return Session().termsRefGet(session, name, idx, tidx);
  }

  void termsRefSet(String name, int idx, int tidx, String? val) {
    _doUpdate();
    return Session().termsRefSet(session, name, idx, tidx, val);
  }
}
