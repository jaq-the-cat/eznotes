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
  final List<FSNode> children;
  Folder(String title, this.children) : super(title);
}

class Note extends FSNode {
  final String content;
  Note(String title, this.content) : super(title);
}
