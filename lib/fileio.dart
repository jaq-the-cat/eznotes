import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<Box> _box = (() async {
  await Hive.initFlutter();
  return Hive.openBox('tree');
})();

Future<Folder> getRoot() async {
  return _unserializeFolder((await _box).toMap());
}

Folder _unserializeFolder(Map<dynamic, dynamic> raw) {
  return Folder(raw['title'], raw['children'].map((Map<dynamic, dynamic> e) {
    if (e.containsKey('children'))
      return _unserializeFolder(e);
    else if (e.containsKey('content'))
      return _unserializeNote(e);
  }));
}

Note _unserializeNote(Map<dynamic, dynamic> raw) {
  return Note(raw['title'], raw['content'] ?? "");
}

abstract class FSNode {
  final String title;
  FSNode(this.title);

  Map<String, dynamic> serialize();
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

  Map<String, dynamic> serialize() {
    return {
      'title': title,
      'children': List.from(children.map((node) => node.serialize())),
    };
  }

  void save() async {
    Box box = await _box;
    box.clear();
    box.putAll(this.serialize());
  }
}

class Note extends FSNode {
  String _content;
  Note(String title, this._content) : super(title);

  set content(n) => _content = n ?? "";
  String get content => _content;

  Map<String, dynamic> serialize() {
    return {
      'title': title,
      'content': content,
    };
  }
}
