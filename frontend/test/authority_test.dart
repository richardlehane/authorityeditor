import 'package:authorityeditor/authority/authority.dart';
import 'package:test/test.dart';

void main() {
  Document doc = Document.empty();
  test('create empty document', () {
    expect(doc.title, "Untitled");
  });
  test('set current node', () {
    doc.setCurrent((NodeType.classType, 2));
    expect(doc.current().typ(), NodeType.classType);
  });

  test('key', () {
    expect(doc.current().key(), 12884901890);
  });
  test('update attribute', () {
    CurrentNode curr = doc.current();
    curr.set("itemno", "5.0.1");
    expect(doc.current().get("itemno"), "5.0.1");
  });
  test('delete attribute', () {
    CurrentNode curr = doc.current();
    curr.set("itemno", null);
    expect(doc.current().get("itemno"), null);
  });
  test('create attribute', () {
    CurrentNode curr = doc.current();
    curr.set("itemno", "1.1.1");
    expect(doc.current().get("itemno"), "1.1.1");
  });
  test('create sibling', () {
    doc.addSibling((NodeType.classType, 2), NodeType.classType);
    doc.setCurrent((NodeType.classType, 3));
    expect(doc.current().get("itemno"), null);
  });
  test('move up', () {
    doc.moveUp((NodeType.classType, 3));
    doc.setCurrent((NodeType.classType, 3));
    expect(doc.current().get("itemno"), "1.1.1");
  });
  test('equality', () {
    List<TreeNode> a = [TreeNode((NodeType.classType, 0), null, null, [])];
    List<TreeNode> b = [TreeNode((NodeType.classType, 0), null, null, [])];
    expect(a.length == b.length, true);
    for (int i = 0; i < a.length; i++) {
      expect(a[i].equals(b[i]), true);
    }
  });
}
