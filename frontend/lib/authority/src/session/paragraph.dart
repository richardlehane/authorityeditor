import 'dart:typed_data';
import 'dart:convert';
import 'package:xml/xml.dart';
import 'tree.dart' show Index;

// Byte format:
// [Paragraph Count u8][Paragraphs..]
// Paragraph:
// [Token Count 8][Tokens]
// Token:
// [Token type U8][Paragraph (List and Item) | Text, Source, Emphasis: text | Url: text * 2]
// Text:
// [Text len + 1 U16][Text UTF8][Sentinel 0]
List<XmlElement>? deserialiseParagraphs(Uint8List list) {
  Index idx = Index(0);
  final paraCount = list[idx.i];
  idx.increment();
  if (paraCount == 0) return null;
  final List<XmlElement> ret = [];
  for (var i = 0; i < paraCount; i++) {
    final XmlElement para = XmlElement(XmlName("Paragraph"), [], [], false);
    deserialiseParagraph(list, idx, para);
    ret.add(para);
  }
  return ret;
}

Uint8List? serialiseParagraphs(List<XmlElement>? paras) {
  if (paras == null || paras.isEmpty) return null;
  BytesBuilder buf = BytesBuilder();
  buf.addByte(paras.length);
  for (var i = 0; i < paras.length; i++) {
    serialiseParagraph(buf, paras[i]);
  }
  return buf.takeBytes();
}

void deserialiseParagraph(Uint8List list, Index idx, XmlElement parent) {
  final tokCount = list[idx.i];
  idx.increment();
  for (var i = 0; i < tokCount; i++) {
    ParaToken tok = ParaToken.values[list[idx.i]];
    idx.increment();
    switch (tok) {
      case ParaToken.text:
      case ParaToken.source:
      case ParaToken.emphasis:
      case ParaToken.url:
        tok.deserialise(list, idx, parent);
      case ParaToken.list:
        final itemCount = list[idx.i];
        idx.increment();
        final XmlElement l = XmlElement(XmlName("List"), [], [], false);
        for (var j = 0; j < itemCount; j++) {
          idx.increment(); //ignore item token
          final XmlElement it = XmlElement(XmlName("Item"), [], [], false);
          deserialiseParagraph(list, idx, it);
          l.children.add(it);
        }
        parent.children.add(l);
      default:
    }
  }
}

bool emptyNode(XmlNode node) {
  if (node.nodeType != XmlNodeType.TEXT) return false;
  if (node.value == null) return true;
  return node.value!.trim().isEmpty;
}

void serialiseParagraph(BytesBuilder buf, XmlElement para) {
  final children = para.children.where((n) => !emptyNode(n)).toList();
  buf.addByte(children.length);
  for (var i = 0; i < children.length; i++) {
    final tok = from(children[i]);
    tok.serialise(buf, children[i]);
  }
}

void writeText(BytesBuilder buf, String? str) {
  // empty text is a zero U16 (no sentinel)
  if (str == null || str.isEmpty) {
    buf.addByte(0);
    buf.addByte(0);
    return;
  }
  final byts = utf8.encode(str);
  final lenbuf = ByteData(2);
  lenbuf.setUint16(0, byts.length + 1, Endian.little);
  buf.add(lenbuf.buffer.asUint8List());
  buf.add(byts);
  buf.addByte(0); // null sentinel
}

String? asText(Uint8List list, Index idx) {
  final bd = ByteData.sublistView(list, 0, 2);
  final l = bd.getUint16(0, Endian.little);
  idx.advance(2 + l);
  if (l == 0) return null; // no sentinel on empty strings
  return utf8.decode(
    list.sublist(2, 1 + l),
  ); // length includes a zero terminating byte
}

enum ParaToken {
  text,
  source,
  emphasis,
  url,
  list,
  item,
  none;

  void serialise(BytesBuilder buf, XmlNode node) {
    buf.addByte(index);
    switch (this) {
      case ParaToken.text:
        writeText(buf, node.value);
        return;
      case ParaToken.source:
      case ParaToken.emphasis:
        writeText(buf, (node as XmlElement).innerText);
        return;
      case ParaToken.url:
        final el = node as XmlElement;
        writeText(buf, el.getAttribute("url"));
        writeText(buf, el.innerText);
        return;
      case ParaToken.list:
      case ParaToken.item:
        serialiseParagraph(buf, node as XmlElement);
        return;
      case ParaToken.none:
    }
  }

  void deserialise(Uint8List list, Index idx, XmlElement parent) {
    switch (this) {
      case ParaToken.text:
        final txt = asText(list.sublist(idx.i), idx) ?? "";
        parent.children.add(XmlText(txt));
      case ParaToken.source:
        final txt = asText(list.sublist(idx.i), idx) ?? "";
        parent.children.add(
          XmlElement(XmlName("Source"), [], [XmlText(txt)], false),
        );
      case ParaToken.emphasis:
        final txt = asText(list.sublist(idx.i), idx) ?? "";
        parent.children.add(
          XmlElement(XmlName("Emphasis"), [], [XmlText(txt)], false),
        );
      case ParaToken.url:
        final attr = asText(list.sublist(idx.i), idx) ?? "";
        final txt = asText(list.sublist(idx.i), idx) ?? "";
        parent.children.add(
          XmlElement(
            XmlName("Source"),
            [XmlAttribute(XmlName("url"), attr)],
            [XmlText(txt)],
            false,
          ),
        );
      default:
        return;
    }
  }
}

ParaToken from(XmlNode node) {
  switch (node.nodeType) {
    case XmlNodeType.TEXT:
      return ParaToken.text;
    case XmlNodeType.ELEMENT:
      XmlElement el = node as XmlElement;
      switch (el.name.local) {
        case "Emphasis":
          return ParaToken.emphasis;
        case "List":
          return ParaToken.list;
        case "Item":
          return ParaToken.item;
        case "Source":
          return (el.getAttribute("url") == null)
              ? ParaToken.source
              : ParaToken.url;
        default:
          return ParaToken.none;
      }
    default:
      return ParaToken.none;
  }
}
