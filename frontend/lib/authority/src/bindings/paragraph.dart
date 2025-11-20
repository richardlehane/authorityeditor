import 'dart:typed_data';
import 'dart:convert';
import 'package:xml/xml.dart';

// Byte format:
// [Paragraph Count u8][Paragraphs..]
// Paragraph:
// [Token Count 8][Tokens]
// Token:
// [Token type U8][Paragraph (List and Item) | Text, Source, Emphasis: text | Url: text * 2]
// Text:
// [Text len + 1 U16][Text UTF8][Sentinel 0]
//
// Refs:
// Uint8List
// BytesBuilder
// ByteData (has setUint16 and getUint16)
// Reuse: widgets/markup/controller.dart
List<XmlElement>? deserialiseParagraphs(Uint8List list) {
  if (list[0] == 0) return null;
  final ret = List<XmlElement>.filled(
    list[0],
    XmlElement(XmlName("Paragraph")),
  );
  int index = 1;
  ret.forEach((para) {
    index += deserialiseParagraph(list, index, para);
  });
  return ret;
}

int deserialiseParagraph(Uint8List list, int start, XmlElement parent) {
  int tokCount = list[start];
  int ret = 1;
  for (var i = 0; i < tokCount; i++) {
    ParaToken tok = ParaToken.values[list[start + ret]];
    ret++;
    switch (tok) {
      case ParaToken.text:
      case ParaToken.source:
      case ParaToken.emphasis:
      case ParaToken.url:
        ret += tok.deserialise(list, start + ret, parent);
      case ParaToken.list:
        final items = List<XmlElement>.filled(
          list[start + ret],
          XmlElement(XmlName("Item")),
        );
        ret++;
        items.forEach((item) {
          ret++; //ignore item token
          ret += deserialiseParagraph(list, start + ret, item);
        });
        final XmlElement l = XmlElement(XmlName("List"), [], items, false);
        parent.children.add(l);
      default:
    }
  }
  return ret;
}

String asText(Uint8List list) {
  final bd = ByteData.sublistView(list, 0, 2);
  final l = bd.getUint16(0);
  return utf8.decode(list.sublist(2, 1 + l));
}

enum ParaToken {
  text,
  source,
  emphasis,
  url,
  list,
  item,
  none;

  int deserialise(Uint8List list, int start, XmlElement parent) {
    switch (this) {
      case ParaToken.text:
        final txt = asText(list.sublist(start));
        parent.children.add(XmlText(txt));
        return 3 + txt.length;
      case ParaToken.source:
        final txt = asText(list.sublist(start));
        parent.children.add(
          XmlElement(XmlName("Source"), [], [XmlText(txt)], false),
        );
        return 3 + txt.length;
      case ParaToken.emphasis:
        final txt = asText(list.sublist(start));
        parent.children.add(
          XmlElement(XmlName("Emphasis"), [], [XmlText(txt)], false),
        );
        return 3 + txt.length;
      case ParaToken.url:
        final attr = asText(list.sublist(start));
        final txt = asText(list.sublist(start + 3 + attr.length));
        parent.children.add(
          XmlElement(
            XmlName("Source"),
            [XmlAttribute(XmlName("url"), attr)],
            [XmlText(txt)],
            false,
          ),
        );
        return 6 + attr.length + txt.length;
      default:
        return 0;
    }
  }
}
