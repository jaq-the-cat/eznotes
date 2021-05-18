import 'package:flutter/material.dart';
import 'fileio.dart';

class FolderPage extends StatefulWidget {
  FolderPage(this.folder, {Key key}) : super(key: key);
  Folder folder;

  @override
  _FolderPageState createState() => _FolderPageState();
}

class _FolderPageState extends State<FolderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.folder_open),
        title: Text(widget.folder.title),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: List<Widget>.from(widget.folder.children.map((n) {
          return OutlinedButton.icon(
            icon: Icon(n.runtimeType == Folder ? Icons.folder_open : Icons.note),
            label: Text(n.title),
            onPressed: () {},
          );
        }))
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.note_add),
            tooltip: "Add new note",
            onPressed: () => setState(() { widget.folder.add(Note('title', 'content')); }),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            child: Icon(Icons.create_new_folder),
            tooltip: "Add new folder",
            onPressed: () => setState(() { widget.folder.add(Folder('ftitle', [])); }),
          ),
        ]
      )
    );
  }
}
