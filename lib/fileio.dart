import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<Box> _box = (() async {
  await Hive.initFlutter();
  return Hive.openBox('tree');
})();

abstract class FSNode {
  final String title;
  FSNode(this.title);
}

class Folder extends FSNode {
  List<FSNode> children;
  Folder(String title, this.children) : super(title);

  void add(FSNode child) {
    if (child == null) return;
    if (children == null) children = [child];
    else children.add(child);
  }

  void remove(FSNode child) {
    children.remove(child);
  }

  void clear() {
    children = [];
  }
}

class Note extends FSNode {
  String _content;
  Note(String title, this._content) : super(title);

  set content(n) => _content = n ?? "";
  String get content => _content;
}
