import 'dart:io';
import 'dart:convert';
import 'package:xml/xml.dart';
import 'package:file_picker/file_picker.dart' show PlatformFile;
import 'node.dart'
    show
        NodeType,
        nodeFromString,
        StatusType,
        statusTypeFromString,
        SeeRefType,
        DateType;
import 'tree.dart' show TreeNode, Counter, Ref;

const String _template = '''
<?xml version="1.0" encoding="UTF-8"?>
<Authority xmlns="http://www.records.nsw.gov.au/schemas/RDA">
	<Term itemno="1.0.0" type="function">
    <Term itemno="1.1.0" type="activity">
      <Class itemno="1.1.1">
        <Disposal></Disposal>
      </Class>
		</Term>
	</Term>
</Authority>
''';

const outputDir = "";

const String _ns = "http://www.records.nsw.gov.au/schemas/RDA";

bool _isAttr(String name) => name[0] == name[0].toLowerCase();

class Session {
  List<XmlDocument?> documents = [];
  List<XmlElement?> nodes = [];
  XmlElement? copyNode;

  // singleton
  Session._();
  static final Session _instance = Session._();
  factory Session() => _instance;

  int _init(XmlDocument doc) {
    documents.add(doc);
    nodes.add(_nth(doc, (NodeType.termType, 0)));
    return documents.length - 1;
  }

  int empty() {
    XmlDocument doc = XmlDocument.parse(_template);
    return _init(doc);
  }

  int load(PlatformFile f) {
    // todo: error handling
    if (f.bytes == null) {
      return empty();
    }
    final utf16Body = utf8.decode(f.bytes!);
    final doc = XmlDocument.parse(utf16Body);
    return _init(doc);
  }

  void unload(int index) {
    documents[index] = null;
    nodes[index] = null;
  }

  bool save(int index, String path) {
    File(path).writeAsStringSync(Session().toString(), flush: true);
    return true;
  }

  // stubs - not implemented for web
  bool valid(int index) => true;

  bool edit(int index, String stylesheet) => true;

  void transform(int index, String stylesheet, String outpath) {}

  List<TreeNode> tree(int index, Counter ctr) {
    if (documents[index] == null) return [];
    ctr.next(NodeType.rootType);
    List<TreeNode> ret = [
      TreeNode((NodeType.rootType, 0), null, "Details", []),
      TreeNode(
        (NodeType.none, 0),
        null,
        "Context",
        _addContext(documents[index]!.rootElement, ctr),
      ),
    ];
    ret.addAll(_addChildren(_termsClasses(documents[index]!.rootElement), ctr));
    return ret;
  }

  String asString(int index) {
    if (documents[index] == null) return "";
    return documents[index]!.toXmlString(pretty: true, indent: '\t');
  }

  void setCurrent(int index, Ref ref) {
    nodes[index] = _nth(documents[index], ref);
  }

  // tree operations
  void dropNode(int index, Ref ref) {
    XmlElement? el = _nth(documents[index], ref);
    if (el == null) return;
    el.remove();
  }

  void copy(int index, Ref ref) {
    XmlElement? el = _nth(documents[index], ref);
    if (el == null) return;
    copyNode = el.copy();
  }

  void pasteChild(int index, Ref ref) {
    if (copyNode == null) return;
    XmlElement? el = _nth(documents[index], ref);
    if (el == null) return;
    final copycopyNode = copyNode!.copy();
    if (ref.$1 == NodeType.rootType) {
      (int, int) p = _insertPos(el, "Context");
      el.children.insert(p.$1, copycopyNode);
      return;
    }
    el.children.add(copycopyNode);
  }

  void pasteSibling(int index, Ref ref) {
    if (copyNode == null) return;
    XmlElement? el = _nth(documents[index], ref);
    if (el == null) return;
    final copycopyNode = copyNode!.copy();
    el.parentElement!.children.insert(_pos(el) + 1, copycopyNode);
  }

  void addChild(int index, Ref ref, NodeType nt) {
    XmlElement? el = _nth(documents[index], ref);
    if (el == null) return;
    if (nt == NodeType.contextType) {
      (int, int) p = _insertPos(el, "Context");
      el.children.insert(p.$1, XmlElement(XmlName("Context")));
      return;
    }
    (nt == NodeType.classType)
        ? el.children.add(
          XmlElement(XmlName(nt.toString()), [], [
            XmlElement(XmlName("Disposal")),
          ]),
        )
        : el.children.add(XmlElement(XmlName(nt.toString())));
  }

  void addSibling(int index, Ref ref, NodeType nt) {
    XmlElement? el = _nth(documents[index], ref);
    if (el == null) return;
    el.parentElement!.children.insert(
      _pos(el) + 1,
      (nt == NodeType.classType)
          ? XmlElement(XmlName(nt.toString()), [], [
            XmlElement(XmlName("Disposal")),
          ])
          : XmlElement(XmlName(nt.toString())),
    );
  }

  bool moveUp(int index, Ref ref) {
    XmlElement? el = _nth(documents[index], ref);
    if (el == null) return false;
    XmlElement? prev = el.previousElementSibling;
    if (prev == null || !ref.$1.like(nodeFromString(prev.localName))) {
      return false;
    }
    el.remove();
    prev.parentElement!.children.insert(_pos(prev), el);
    return true;
  }

  bool moveDown(int index, Ref ref) {
    XmlElement? el = _nth(documents[index], ref);
    if (el == null) return false;
    XmlElement? next = el.nextElementSibling;
    if (next == null || !ref.$1.like(nodeFromString(next.localName))) {
      return false;
    }
    el.remove();
    next.parentElement!.children.insert(_pos(next) + 1, el);
    return true;
  }

  // find the index of the sibling node within its parent by counting previous siblings
  int _pos(XmlNode el) {
    int ret = 0;
    while (el.previousSibling != null) {
      ret++;
      el = el.previousSibling!;
    }
    return ret;
  }

  // node operations
  NodeType getType(int index) {
    XmlElement? el = nodes[index];
    if (el == null) return NodeType.rootType;
    return nodeFromString(el.localName);
  }

  String? get(int index, String name) {
    XmlElement? el = nodes[index];
    if (el == null) return null;
    if (_isAttr(name)) {
      String? a = el.getAttribute(name, namespace: _ns);
      return (a != null) ? a : null;
    }
    XmlElement? t = el.getElement(name);
    return (t != null) ? t.innerText : null;
  }

  String? getDate(int index, DateType dt) {
    XmlElement? el = nodes[index];
    if (el == null) return null;
    el = el.getElement("DateRange");
    if (el == null) return null;
    el = el.getElement(dt.toString());
    if (el == null) return null;
    return el.innerText;
  }

  bool getCirca(int index, DateType dt) {
    XmlElement? el = nodes[index];
    if (el == null) return false;
    el = el.getElement("DateRange");
    if (el == null) return false;
    el = el.getElement(dt.toString());
    if (el == null) return false;
    String? a = el.getAttribute("circa", namespace: _ns);
    return (a != null) ? a == "true" : false;
  }

  void set(int index, String name, String? value) {
    XmlElement? el = nodes[index];
    if (el == null) return;
    if (_isAttr(name)) {
      el.setAttribute(name, value, namespace: _ns);
      return;
    }
    XmlElement? t = el.getElement(name);
    // delete
    if (value == null) {
      if (t != null) {
        if (t.attributes.isEmpty) {
          t.remove();
        } else {
          t.children.clear();
        }
      }
      return;
    }
    // update
    if (t != null) {
      t.innerText = value;
      return;
    }
    // insert
    t = XmlElement(XmlName(name), [], [XmlText(value)], false);
    (int, int) p = _insertPos(el, name);
    el.children.insert(p.$1, t);
    return;
  }

  void setDate(int index, DateType dt, String? value) {
    XmlElement? el = nodes[index];
    if (el == null) return;
    XmlElement? t = el.getElement("DateRange");
    if (t == null) {
      if (value == null) return;
      t = XmlElement(XmlName("DateRange"), [], [
        XmlElement(XmlName(dt.toString()), [], [XmlText(value)], false),
      ], false);
      (int, int) p = _insertPos(el, "DateRange");
      el.children.insert(p.$1, t);
      return;
    } else {
      XmlElement? d = t.getElement(dt.toString());
      if (d == null) {
        if (value != null) {
          d = XmlElement(XmlName(dt.toString()), [], [XmlText(value)], false);
          (dt == DateType.start) ? t.children.insert(0, d) : t.children.add(d);
        }
        return;
      }
      // delete
      if (value == null) {
        if (d.attributes.isEmpty) {
          d.remove();
          if (t.children.isEmpty) t.remove;
        } else {
          d.children.clear();
        }
      } else {
        // update
        d.innerText = value;
      }
    }
  }

  void setCirca(int index, DateType dt, bool value) {
    XmlElement? el = nodes[index];
    if (el == null) return;
    XmlElement? t = el.getElement("DateRange");
    if (t == null) {
      if (!value) return;
      t = XmlElement(XmlName("DateRange"), [], [
        XmlElement(
          XmlName(dt.toString()),
          [XmlAttribute(XmlName("circa"), "true")],
          [],
          false,
        ),
      ], false);
      (int, int) p = _insertPos(el, "DateRange");
      el.children.insert(p.$1, t);
      return;
    } else {
      XmlElement? d = t.getElement(dt.toString());
      if (d == null) {
        if (value) {
          d = XmlElement(
            XmlName(dt.toString()),
            [XmlAttribute(XmlName("circa"), "true")],
            [],
            false,
          );
          (dt == DateType.start) ? t.children.insert(0, d) : t.children.add(d);
        }
        return;
      }
      // delete
      if (!value) {
        if (d.children.isEmpty) {
          d.remove();
          if (t.children.isEmpty) t.remove;
        } else {
          d.setAttribute("circa", null, namespace: _ns);
        }
      } else {
        // update
        d.setAttribute("circa", "true", namespace: _ns);
      }
    }
  }

  List<XmlElement>? getParagraphs(int index, String name) {
    XmlElement? el = nodes[index];
    if (el == null) return null;
    XmlElement? parent = el.getElement(name);
    if (parent == null) return null;
    return parent.findElements("Paragraph").toList();
  }

  // todo: delete empty parent??
  void setParagraphs(int index, String name, List<XmlElement>? paras) {
    XmlElement? el = nodes[index];
    if (el == null) return;
    XmlElement? parent = el.getElement(name);
    if (parent == null) {
      if (paras == null) return;
      // inserting
      parent = XmlElement(XmlName(name), [], paras, false);
      (int, int) p = _insertPos(el, name);
      el.children.insert(p.$1, parent);
      return;
    }
    parent.children.removeWhere(
      (para) =>
          para.nodeType == XmlNodeType.ELEMENT &&
          (para as XmlElement).localName == "Paragraph",
    );
    if (paras == null) {
      // todo: check if parent is empty now, if so remove it too
      return;
    }
    parent.children.insertAll(0, paras);
  }

  // multi operations
  int multiLen(int index, String name) {
    XmlElement? el = nodes[index];
    if (el == null) return 0;
    final mt = _multypFromName(name);
    el = mt.parent(el);
    if (el == null) return 0;
    if (mt == _MultiType.status) return el.childElements.length;
    return el.findElements(name).length;
  }

  bool multiEmpty(int index, String name, int idx) {
    XmlElement? el = nodes[index];
    if (el == null) true;
    final mt = _multypFromName(name);
    el = mt.parent(el!);
    if (el == null) return true;
    el =
        (mt == _MultiType.status)
            ? el.childElements.elementAt(idx)
            : el.findElements(name).elementAt(idx);
    if (name == "SeeReference") {
      XmlElement? ttr = el.getElement("TermTitleRef");
      if (ttr != null && ttr.children.isNotEmpty) return false;
      el = el.getElement("IDRef");
      if (el == null || el.children.isEmpty) return true;
      return el.innerText == "28";
    }
    return el.children.isEmpty;
  }

  int multiAdd(int index, String name, String? sub) {
    XmlElement? el = nodes[index];
    if (el == null) return -1;
    final mt = _multypFromName(name);
    XmlElement t = XmlElement(XmlName(sub ?? name), [], [], false);
    if (mt == _MultiType.status) {
      el = mt.parent(el);
      if (sub == null) return -1;
      if (el == null) {
        (int, int) p = _insertPos(nodes[index]!, "Status");
        XmlElement s = XmlElement(XmlName("Status"), [], [t], false);
        nodes[index]!.children.insert(p.$1, s);
        return 0;
      }
      el.children.add(t);
      return el.childElements.length - 1;
    }
    if (mt == _MultiType.para) {
      XmlElement? el2 = mt.parent(el);
      if (el2 == null) {
        String en = mt.parentName(el);
        (int, int) p = _insertPos(el, en);
        el2 = XmlElement(XmlName(en), [], [t], false);
        nodes[index]!.children.insert(p.$1, el2);
        return 0;
      }
      el2.children.add(t);
      return el2.childElements.where((e) => e.localName == name).length - 1;
    }
    (int, int) p = _insertPos(el, name);
    el.children.insert(p.$1, t);
    return p.$2;
  }

  void multiAddSeeRef(int index, SeeRefType srt) {
    XmlElement? el = nodes[index];
    if (el == null) return;
    XmlElement? el2 = _MultiType.para.parent(el);
    XmlElement? t = switch (srt) {
      SeeRefType.ga28 => XmlElement(XmlName("SeeReference"), [], [
        XmlElement(
          XmlName("IDRef"),
          [XmlAttribute(XmlName("control"), "GA")],
          [XmlText("28")],
          false,
        ),
        XmlElement(XmlName("AuthorityTitleRef"), [], [
          XmlText("Administrative records"),
        ], false),
      ], false),
      SeeRefType.other => XmlElement(XmlName("SeeReference"), [], [
        XmlElement(XmlName("IDRef"), [], [], false),
        XmlElement(XmlName("TermTitleRef"), [], [], false),
      ], false),
      SeeRefType.local => XmlElement(XmlName("SeeReference"), [], [
        XmlElement(XmlName("TermTitleRef"), [], [], false),
      ], false),
      _ => null,
    };
    if (t == null) return;
    if (el2 != null) {
      el2.children.add(t);
      return;
    }
    String en = _MultiType.para.parentName(el);
    (int, int) p = _insertPos(el, en);
    el2 = XmlElement(XmlName(en), [], [t], false);
    nodes[index]!.children.insert(p.$1, el2);
    return;
  }

  void multiDrop(int index, String name, int idx) {
    XmlElement? el = nodes[index];
    if (el == null) return;
    final mt = _multypFromName(name);
    el = mt.parent(el);
    if (el == null) return;
    if (mt == _MultiType.status) {
      el.childElements.elementAt(idx).remove();
      if (el.childElements.isEmpty) el.remove(); // remove Status if empty
      return;
    }
    el = el.findElements(name).elementAtOrNull(idx);
    el?.remove();
  }

  void multiUp(int index, String name, int idx) {
    XmlElement? el = nodes[index];
    if (el == null) return;
    final mt = _multypFromName(name);
    el = mt.parent(el);
    if (el == null) return;
    el =
        (mt == _MultiType.status)
            ? el.childElements.elementAtOrNull(idx)
            : el.findElements(name).elementAtOrNull(idx);
    XmlElement? prev = el?.previousElementSibling;
    if (prev == null || (mt != _MultiType.status && prev.localName != name)) {
      return;
    }
    el!.remove(); // can't be null as prev would be null too and return
    prev.parentElement!.children.insert(_pos(prev), el);
  }

  void multiDown(int index, String name, int idx) {
    XmlElement? el = nodes[index];
    if (el == null) return;
    final mt = _multypFromName(name);
    el = mt.parent(el);
    if (el == null) return;
    el =
        (mt == _MultiType.status)
            ? el.childElements.elementAtOrNull(idx)
            : el.findElements(name).elementAtOrNull(idx);
    XmlElement? next = el?.nextElementSibling;
    if (next == null || (mt != _MultiType.status && next.localName != name)) {
      return;
    }
    el!.remove();
    next.parentElement!.children.insert(_pos(next) + 1, el);
  }

  void multiSet(int index, String name, int idx, String? sub, String? val) {
    XmlElement? el = nodes[index];
    if (el == null) return;
    final mt = _multypFromName(name);
    el = mt.parent(el);
    if (el == null) return;
    el =
        (mt == _MultiType.status)
            ? el.childElements.elementAt(idx)
            : el.findElements(name).elementAt(idx); // el must exist
    if (sub == null) {
      if (val == null) return;
      el.innerText = val;
      return;
    }
    if (_isAttr(sub)) {
      String? a = (val == "") ? null : val;
      final en = _elementName(mt, sub);
      if (en == null) {
        el.setAttribute(sub, a, namespace: _ns);
        return;
      }
      XmlElement? t = el.getElement(en);
      if (t == null) {
        t = XmlElement(XmlName(en), [], [], false);
        (int, int) p = _insertPos(el, en);
        el.children.insert(p.$1, t);
      }
      t.setAttribute(sub, a, namespace: _ns);
      return;
    }
    XmlElement? t = el.getElement(sub);
    // delete
    if (val == null) {
      if (t != null) {
        if (t.attributes.isEmpty) {
          t.remove();
        } else {
          t.children.clear();
        }
      }
      return;
    }
    // update
    if (t != null) {
      t.innerText = val;
      return;
    }
    // insert
    t = XmlElement(XmlName(sub), [], [XmlText(val)], false);
    (int, int) p = _insertPos(el, sub);
    el.children.insert(p.$1, t);
    return;
  }

  String? multiGet(int index, String name, int idx, String? sub) {
    XmlElement? el = nodes[index];
    if (el == null) return null;
    final mt = _multypFromName(name);
    el = mt.parent(el);
    if (el == null) return null;
    el =
        (mt == _MultiType.status)
            ? el.childElements.elementAtOrNull(idx)
            : el.findElements(name).elementAtOrNull(idx);
    if (el == null) return null;
    if (sub == null) return el.innerText; // handle simple case - e.g. LinkedTo
    if (_isAttr(sub)) {
      String? en = _elementName(mt, sub);
      if (en != null) el = el.getElement(en);
      return el?.getAttribute(sub, namespace: _ns);
    }
    XmlElement? t = el.getElement(sub);
    if (t == null) return null;
    return t.innerText.isEmpty ? null : t.innerText;
  }

  List<XmlElement>? multiGetParagraphs(
    int index,
    String name,
    int idx,
    String? sub,
  ) {
    XmlElement? el = nodes[index];
    if (el == null) return null;
    final mt = _multypFromName(name);
    el = mt.parent(el);
    if (el == null) return null;
    el =
        (mt == _MultiType.status)
            ? el.childElements.elementAt(idx)
            : el.findElements(name).elementAt(idx);
    if (sub != null) {
      el = el.getElement(sub);
      if (el == null) return null;
    }
    List<XmlElement> l = el.findElements("Paragraph").toList();
    return l.isEmpty ? null : l;
  }

  void multiSetParagraphs(
    int index,
    String name,
    int idx,
    String? sub,
    List<XmlElement>? val,
  ) {
    XmlElement? el = nodes[index];
    if (el == null) return;
    final mt = _multypFromName(name);
    el = mt.parent(el);
    if (el == null) return;
    el =
        (mt == _MultiType.status)
            ? el.childElements.elementAt(idx)
            : el.findElements(name).elementAt(idx);
    XmlElement parent = el;
    if (sub != null) {
      el = el.getElement(sub);
    }
    if (el == null) {
      if (val == null) return;
      // inserting
      el = XmlElement(XmlName(sub!), [], val, false);
      (int, int) p = _insertPos(parent, sub);
      parent.children.insert(p.$1, el);
      return;
    }
    el.children.removeWhere(
      (para) =>
          para.nodeType == XmlNodeType.ELEMENT &&
          (para as XmlElement).localName == "Paragraph",
    );
    // delete
    if (val == null) {
      if (el.children.isEmpty) el.remove();
      return;
    }
    el.children.insertAll(0, val); // update
  }

  StatusType multiStatusType(int index, int idx) {
    XmlElement? el = nodes[index];
    if (el == null) return StatusType.none;
    el = el.getElement("Status");
    if (el == null) return StatusType.none;
    return statusTypeFromString(el.childElements.elementAt(idx).localName);
  }

  SeeRefType multiSeeRefType(int index, int idx) {
    XmlElement? el = nodes[index];
    if (el == null) return SeeRefType.none;
    el = _MultiType.para.parent(el);
    if (el == null) return SeeRefType.none;
    el = el.findElements("SeeReference").elementAt(idx);
    if (el.getElement("ItemNoRef") != null) return SeeRefType.other;
    XmlElement? ir = el.getElement("IDRef");
    XmlElement? ar = el.getElement("AuthorityTitleRef");
    if (ir == null && ar == null) return SeeRefType.local;
    if (ir != null && ir.innerText == "28") return SeeRefType.ga28;
    return SeeRefType.other;
  }

  int termsRefLen(int index, String name, int idx) {
    XmlElement? el = nodes[index];
    if (el == null) return 0;
    final mt = _multypFromName(name);
    el = mt.parent(el);
    if (el == null) return 0;
    el =
        (mt == _MultiType.status)
            ? el.childElements.elementAt(idx)
            : el.findElements(name).elementAt(idx);
    return el.findElements("TermTitleRef").length;
  }

  void termsRefAdd(int index, String name, int idx) {
    XmlElement? el = nodes[index];
    if (el == null) return;
    final mt = _multypFromName(name);
    el = mt.parent(el);
    if (el == null) return;
    el =
        (mt == _MultiType.status)
            ? el.childElements.elementAt(idx)
            : el.findElements(name).elementAt(idx);
    XmlElement e = XmlElement(XmlName("TermTitleRef"), [], [], false);
    (int, int) p = _insertPos(el, "TermTitleRef");
    el.children.insert(p.$1, e);
    return;
  }

  String? termsRefGet(int index, String name, int idx, int tidx) {
    XmlElement? el = nodes[index];
    if (el == null) return null;
    final mt = _multypFromName(name);
    el = mt.parent(el);
    if (el == null) return null;
    el =
        (mt == _MultiType.status)
            ? el.childElements.elementAt(idx)
            : el.findElements(name).elementAt(idx);
    el = el.findElements("TermTitleRef").elementAtOrNull(tidx);
    return el?.innerText;
  }

  void termsRefSet(int index, String name, int idx, int tidx, String? val) {
    XmlElement? el = nodes[index];
    if (el == null) return;
    final mt = _multypFromName(name);
    el = mt.parent(el);
    if (el == null) return;
    el =
        (mt == _MultiType.status)
            ? el.childElements.elementAt(idx)
            : el.findElements(name).elementAt(idx);
    Iterable<XmlElement> list = el.findElements("TermTitleRef");
    el = list.elementAtOrNull(tidx);
    if (val == null) {
      el?.remove();
      return;
    }
    el?.innerText = val;
  }
}

List<TreeNode> _addContext(XmlElement root, Counter ctr) {
  return root.findElements("Context").map((item) {
    final int index = ctr.next(NodeType.contextType);
    return TreeNode(
      (NodeType.contextType, index),
      null,
      item.getElement("ContextTitle")?.innerText,
      [],
    );
  }).toList();
}

List<TreeNode> _addChildren(List<XmlElement> list, Counter ctr) {
  return list.map((item) {
    final NodeType nt =
        (item.name.local == 'Term') ? NodeType.termType : NodeType.classType;
    final int index = ctr.next(nt);
    return TreeNode(
      (nt, index),
      item.getAttribute("itemno"),
      nt == NodeType.termType
          ? item.getElement('TermTitle')?.innerText
          : item.getElement('ClassTitle')?.innerText,
      _addChildren(_termsClasses(item), ctr),
    );
  }).toList();
}

List<XmlElement> _termsClasses(XmlElement el) {
  if (el.name.local == 'Class') {
    return [];
  }
  return el.childElements
      .where((e) => e.name.local == 'Term' || e.name.local == 'Class')
      .toList();
}

XmlElement? _nth(XmlDocument? doc, Ref ref) {
  switch (ref.$1) {
    case NodeType.none:
      return null;
    case NodeType.rootType:
      return doc?.rootElement;
    case NodeType.contextType:
      return doc?.rootElement.findElements("Context").elementAt(ref.$2);
    default:
      return _nthTermClass(doc, ref.$2);
  }
}

XmlElement? _nthTermClass(XmlDocument? doc, int n) {
  int idx = -1;
  XmlElement? descend(XmlElement el) {
    for (XmlElement child in el.childElements.where(
      (e) => e.name.local == 'Term' || e.name.local == 'Class',
    )) {
      idx++;
      if (idx == n) return child;
      if (child.name.local == 'Term') {
        var ret = descend(child);
        if (ret != null) return ret;
      }
    }
    return null;
  }

  if (doc == null) return null;
  return descend(doc.rootElement);
}

// Constants to maintain element order
// after contexts, Term or Class elements can be nested
const authorityElements = [
  "ID",
  "AuthorityTitle",
  "Scope",
  "DateRange",
  "Status",
  "LinkedTo",
  "Comment",
  "Context",
];

const contextElements = ["ContextTitle", "ContextContent", "Comment"];

// Also, after Comments Term or Class elements can be nested
const termElements = [
  "ID",
  "TermTitle",
  "TermDescription",
  "DateRange",
  "Status",
  "LinkedTo", // multiple
  "Comment", // multiple
];

// Also, after Comments Term or Class elements can be nested
const classElements = [
  "ID",
  "ClassTitle",
  "ClassDescription",
  "Disposal", // multiple
  "Justification",
  "DateRange",
  "Status",
  "LinkedTo", // multiple
  "Comment", // multiple
];

const disposalElements = [
  "DisposalCondition",
  "RetentionPeriod",
  "DisposalTrigger",
  "DisposalAction",
  "TransferTo",
  "CustomAction",
  "CustomCustody",
];

const supersedeElements = [
  "IDRef",
  "AuthorityTitleRef",
  "TermTitleRef", // multiple
  "ItemNoRef",
  "PartText",
  "Date",
];

const seeRefElements = [
  "IDRef",
  "AuthorityTitleRef",
  "TermTitleRef", // multiple
  "ItemNoRef",
  "SeeText",
];

const draftElements = ["Agency", "Date"];

const amendedElements = ["Agency", "Date", "AmendmentNote"];

const submittedElements = ["Officer", "Position", "Agency", "Date"];

const applyingElements = ["Agency", "StartDate", "EndDate"];

// determine where to insert a new element
(int, int) _insertPos(XmlElement el, String name) {
  int pos = 0;
  int multi = 0;
  List<String> prev = switch (el.localName) {
    "Authority" => authorityElements,
    "Context" => contextElements,
    "Term" => termElements,
    "Class" => classElements,
    "Disposal" => disposalElements,
    "PartSupersedes" ||
    "Supersedes" ||
    "PartSupersededBy" ||
    "SupersededBy" => supersedeElements,
    "SeeReference" => seeRefElements,
    "Draft" || "Issued" => draftElements,
    "Amended" => amendedElements,
    "Submitted" => submittedElements,
    "Applying" => applyingElements,
    _ => [],
  };
  prev = prev.sublist(0, prev.indexOf(name) + 1);
  for (var n in el.children) {
    if (n.nodeType != XmlNodeType.ELEMENT) {
      pos++;
      continue;
    }
    if (prev.contains((n as XmlElement).localName)) {
      if (n.localName == name) multi++;
      pos++;
      continue;
    }
    break;
  }
  return (pos, multi);
}

enum _MultiType {
  node,
  para,
  status;

  String parentName(XmlElement el) {
    switch (this) {
      case _MultiType.node:
        return "";
      case _MultiType.para:
        switch (el.localName) {
          case "Context":
            return "ContextContent";
          case "Term":
            return "TermDescription";
          default:
            return "ClassDescription";
        }
      case _MultiType.status:
        return "Status";
    }
  }

  XmlElement? parent(XmlElement el) {
    switch (this) {
      case _MultiType.node:
        return el;
      case _MultiType.para:
        switch (el.localName) {
          case "Context":
            return el.getElement("ContextContent");
          case "Term":
            return el.getElement("TermDescription");
          default:
            return el.getElement("ClassDescription");
        }
      case _MultiType.status:
        return el.getElement("Status");
    }
  }
}

_MultiType _multypFromName(String name) {
  if (statusTypeFromString(name) != StatusType.none) return _MultiType.status;
  switch (name) {
    case "SeeReference" || "Source":
      return _MultiType.para;
    case "Status":
      return _MultiType.status;
    default:
      return _MultiType.node;
  }
}

// used in multiset and multiget functions to find the parent elements for nested attributes
String? _elementName(_MultiType mt, String attr) {
  switch (attr) {
    case "unit":
      return "RetentionPeriod";
    case "control":
      if (mt != _MultiType.node) {
        return "IDRef";
      } else {
        return null;
      }
    case "agencyno":
      return "Agency";
    default:
      return null;
  }
}
