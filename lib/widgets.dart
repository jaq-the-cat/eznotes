import 'package:flutter/material.dart';
import 'fileio.dart';

class FolderPage extends StatelessWidget {
  FolderPage(this.folder, {Key key}) : super(key: key);
  Folder folder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.note),
        title: Text(folder.title),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: List<Widget>.from(folder.children.map((n) {
          Text(n.title);
        }))
      ),
    );
  }
}
