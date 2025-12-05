import 'package:fluent_ui/fluent_ui.dart';
import 'package:xml/xml.dart';
import 'togglebutton.dart';

const bullet = "\u2022";

class MarkupTextEditingController extends TextEditingController {
  MarkupTextEditingController({
    super.text,
    List<int>? markup,
    List<String>? urls,
  }) : _markup = markup ?? [],
       _urls = urls ?? [];

  bool listToggled = false;
  ToggleButtonsState buttonsState = ToggleButtonsState.none;
  bool edited = false;

  final List<int> _markup;
  final List<String> _urls;
  bool _listUpdateOperation =
      false; // flag that the update is related to a listUpdate

  // Ensure markup and text stay synchronized
  // Return true if button states need updating
  bool update() {
    if (_listUpdateOperation) {
      _listUpdateOperation = false;
      return false;
    }

    // Just a selection change, no text modification
    if (_markup.length == text.characters.length) {
      bool lT = _listActive();
      ToggleButtonsState bS = _toggleButtonsActive();
      if (lT == listToggled && bS == buttonsState) return false;
      listToggled = lT;
      buttonsState = bS;
      return true;
    }
    edited = true;
    // Handle list auto-formatting
    if (_shouldAddListBullet()) {
      _addListBullet();
      return false;
    }
    // Synchronize markup length with text length
    _syncMarkupLength();
    return false;
  }

  // if list button is active and we've just added a single newline character, add a list.
  bool _shouldAddListBullet() {
    return listToggled &&
        text.characters.length == _markup.length + 1 &&
        selection.start > 0 &&
        text[selection.start - 1] == "\n";
  }

  void _syncMarkupLength() {
    int textLength = text.characters.length;
    int markupLength = _markup.length;
    int cursor =
        (selection.start < 0)
            ? textLength
            : selection.start; // selection.start may be -1 if no selection
    // Text was deleted - delete markup
    if (markupLength > textLength) {
      _markup.removeRange(cursor, cursor + markupLength - textLength);
    } else if (markupLength < textLength) {
      // Text was added - add markup
      int addCount = textLength - markupLength;
      int currentStyle = buttonsState.toInt();
      if (cursor < markupLength) {
        _markup.insertAll(cursor, List.filled(addCount, currentStyle));
      } else {
        _markup.addAll(List.filled(addCount, currentStyle));
      }
    }
  }

  ToggleButtonsState _toggleButtonsActive() {
    if (selection.isCollapsed) {
      if (selection.start < 0) return buttonsState;
      return selection.start < text.characters.length
          ? fromInt(_markup[selection.start])
          : buttonsState;
    }
    int thisStyle = _markup[selection.start];
    for (int i = selection.start + 1; i < selection.end; i++) {
      if (thisStyle != _markup[i]) return ToggleButtonsState.none;
    }
    return fromInt(thisStyle);
  }

  bool _listActive() {
    bool hasBullet = false;
    for (int i = selection.end - 1; i > -1; i--) {
      if (text[i] == bullet) {
        if (i <= selection.start) return true;
        hasBullet = true;
        continue;
      }
      if (text[i] == "\n") {
        if (!hasBullet) {
          return false;
        }
        hasBullet = false;
      }
    }
    return false;
  }

  void append(String txt) {
    text += txt;
  }

  void updateSelection(ToggleButtonsState alter, {String? url}) {
    buttonsState = alter;
    int start = selection.start;
    int end = selection.end;
    if (alter == ToggleButtonsState.none &&
        selection.isCollapsed &&
        start < text.characters.length) {
      int old = _markup[start];
      for (int i = start - 1; i >= 0; i--) {
        if (_markup[i] != old) break;
        start--;
      }
      for (int i = end; i < text.characters.length; i++) {
        if (_markup[i] != old) break;
        end++;
      }
    }
    int markupValue = alter.toInt();
    if (alter == ToggleButtonsState.link && url != null) {
      int urlIndex = _urls.indexOf(url);
      if (urlIndex == -1) {
        _urls.add(url);
        urlIndex = _urls.length - 1;
      }
      markupValue = urlIndex + 3; // URLs start at index 3
    }
    for (; start < end; start++) {
      _markup[start] = markupValue;
    }
  }

  String _prependBullet(String t) => "$bullet $t";
  String _appendBullet(String t) => "$t$bullet ";
  String _insertBullet(String t, int off) =>
      "${t.substring(0, off)}$bullet ${t.substring(off)}";

  void _addListBullet() {
    _listUpdateOperation = true;
    if (selection.start == text.characters.length) {
      _markup.addAll([0, 0, 0]);
      text = _appendBullet(text);
    } else {
      _markup.insertAll(selection.start, [0, 0, 0]);
      text = _insertBullet(text, selection.start);
    }
  }

  void updateList(bool value) {
    listToggled = value;
    // adding a list
    if (value) {
      if (selection.start >= text.characters.length) {
        return;
      } // return without adding bullet if at the end of the line
      String edited = text;
      bool alreadyBulleted = false;
      for (var off = selection.end - 1; off >= 0; off--) {
        if (text[off] == bullet) {
          alreadyBulleted = true;
        }
        if (text[off] == "\n" || off == 0) {
          if (!alreadyBulleted) {
            _markup.insertAll(off, [0, 0]);
            edited =
                (off == 0)
                    ? _prependBullet(edited)
                    : _insertBullet(edited, off + 1);
          }
          alreadyBulleted = false;
          if (off < selection.start) break;
        }
      }
      _listUpdateOperation = true;
      text = edited;
      return;
    }
    // deleting
    String edited = text;
    for (var off = selection.end; off >= 0; off--) {
      if (off >= edited.length) continue;
      if (edited[off] == "\n" && off < selection.start) break;
      if (edited[off] == bullet) {
        if (off + 1 < edited.length && edited[off + 1] == " ") {
          _markup.removeRange(off, off + 2);
          edited =
              edited.substring(0, off) +
              edited.substring(off + 2, edited.length);
        } else {
          _markup.removeAt(off);
          edited =
              edited.substring(0, off) +
              edited.substring(off + 1, edited.length);
        }
      }
    }
    if (edited != text) {
      _listUpdateOperation = true;
      text = edited;
    }
  }

  // iterate through the markup buffer and text, chunking text according to styles
  List<TextSpan> _applyStyles() {
    List<TextSpan> ret = [];
    StringBuffer buf = StringBuffer();
    int style = 0;
    Iterator<int> it = _markup.iterator;
    for (var char in text.characters) {
      if (it.moveNext()) {
        if (it.current == style) {
          buf.write(char);
        } else {
          if (buf.length > 0) {
            ret.add(_toSpan(style, buf.toString()));
            buf.clear();
          }
          style = it.current;
          buf.write(char);
        }
      } else {
        // shouldn't be here
        buf.write(char);
      }
    }
    ret.add(_toSpan(style, buf.toString()));
    return ret;
  }

  factory MarkupTextEditingController.fromXML(List<XmlElement> paragraphs) {
    StringBuffer buf = StringBuffer();
    List<int> m = [];
    List<String> u = [];

    void commitNode(XmlNode node, int style) {
      if (style == 2) {
        String? link = node.getAttribute("url");
        if (link != null) {
          u.add(link);
          style = style + u.length;
        }
      }
      String txt =
          (node.nodeType == XmlNodeType.TEXT) ? node.value! : node.innerText;

      if (txt.trim().isEmpty) return; // kill blank text nodes
      buf.write(txt);
      m.addAll(List.filled(txt.length, style));
    }

    bool first = true;
    for (var para in paragraphs) {
      if (first) {
        first = false;
      } else {
        buf.write("\n");
        m.add(0);
      }
      bool nl = true;
      for (var child in para.children) {
        int style = _getStyle(child);
        if (style < 0) {
          for (var item in child.children) {
            if (!nl) {
              buf.write("\n");
              m.add(0);
            }
            buf.write("$bullet ");
            m.addAll([0, 0]);
            for (var node in item.children) {
              style = _getStyle(node);
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
    return MarkupTextEditingController(
      text: buf.toString(),
      markup: m,
      urls: u,
    );
  }

  List<XmlElement> toXML() {
    List<XmlElement> ret = [];
    StringBuffer buf = StringBuffer();
    XmlElement thisPara = XmlElement(XmlName("Paragraph"));
    XmlElement thisList = XmlElement(XmlName("List"));
    XmlElement thisItem = XmlElement(XmlName("Item"));
    bool inList = false;
    bool firstChar = true;
    int style = 0;
    Iterator<int> it = _markup.iterator;
    CharacterRange cr = text.characters.iterator;

    while (cr.moveNext()) {
      it.moveNext();
      // new lines mean - new paragraphs or new list items
      if (cr.current == "\n" || firstChar) {
        if (!firstChar) {
          cr.moveNext();
        }
        // Add a list item if needed
        if (cr.current == bullet) {
          if (!firstChar) {
            it.moveNext();
          }
          if (inList) {
            thisItem.children.add(
              _toNode(style, buf.toString()),
            ); // commit the previous list item
            thisList.children.add(thisItem);
            buf.clear();
            thisItem = XmlElement(XmlName("Item")); // make a new item
          } else {
            if (buf.isNotEmpty) {
              // commit paragraph contents up to the list element if needed
              thisPara.children.add(_toNode(style, buf.toString()));
              buf.clear();
            }
            inList = true;
          }
          // skip the space following the bullet
          cr.moveNext();
          if (cr.current == " ") {
            it.moveNext();
          } else {
            cr.moveBack();
          }
          firstChar = false;
          continue;
        }
        if (!firstChar) {
          cr.moveBack();
          // not a bullet!

          if (inList) {
            inList = false;
            // commit the list
            thisItem.children.add(_toNode(style, buf.toString()));
            buf.clear(); // commit the previous list item
            thisList.children.add(thisItem); // does this need to use copy??
            thisPara.children.add(thisList);
            ret.add(thisPara);
            thisPara = XmlElement(XmlName("Paragraph"));
            thisList = XmlElement(XmlName("List"));
            thisItem = XmlElement(XmlName("Item"));
          } else {
            // not a list, commit the para
            thisPara.children.add(_toNode(style, buf.toString()));
            buf.clear();
            ret.add(thisPara);
            thisPara = XmlElement(XmlName("Paragraph"));
          }
          firstChar = false;
          continue;
        }
        firstChar = false;
      }
      // if style is the same, write to buf and continue; else commit buf contents to item or para
      if (it.current == style) {
        buf.write(cr.current);
      } else {
        if (buf.isNotEmpty) {
          if (inList) {
            thisItem.children.add(_toNode(style, buf.toString()));
          } else {
            thisPara.children.add(_toNode(style, buf.toString()));
          }
          buf.clear();
        }
        style = it.current;
        buf.write(cr.current);
      }
    }
    // Now finalize, by adding the last content to a list or para.
    if (inList) {
      // commit the list
      thisItem.children.add(
        _toNode(style, buf.toString()),
      ); // commit the previous list item
      thisList.children.add(thisItem); // does this need to use copy??
      thisPara.children.add(thisList);
      ret.add(thisPara);
    } else {
      // not a list, commit the para
      thisPara.children.add(_toNode(style, buf.toString()));
      ret.add(thisPara);
    }
    return ret;
  }

  XmlNode _toNode(int style, String text) {
    switch (style) {
      case 0:
        return XmlText(text);
      case 1:
        return _toElement("Emphasis", text);
      case 2:
        return _toElement("Source", text);
      default:
        int index = style - 3;
        if (index < _urls.length) {
          return _toElement("Source", text, "url", _urls[index]);
        } else {
          return _toElement("Source", text);
        }
    }
  }

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    return TextSpan(
      style: TextStyle(color: Colors.black),
      children: _applyStyles(),
    );
  }
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

XmlElement _toElement(
  String name,
  String value, [
  String? attrName,
  String? attrVal,
]) {
  List<XmlAttribute> attrs =
      (attrName == null) ? [] : [XmlAttribute(XmlName(attrName), attrVal!)];
  return XmlElement(XmlName(name), attrs, [XmlText(value)], false);
}

int _getStyle(XmlNode node) {
  if (node.nodeType != XmlNodeType.ELEMENT) return 0;
  switch ((node as XmlElement).name.local) {
    case "Emphasis":
      return 1;
    case "Source":
      return 2;
    default:
      return -1;
  }
}
