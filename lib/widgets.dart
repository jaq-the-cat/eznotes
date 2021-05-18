import 'package:flutter/material.dart';
import 'helpers.dart';
import 'fileio.dart';

class FolderPage extends StatefulWidget {
  FolderPage(this.folder, {beforeTitle, Key key}) :
    header = "${beforeTitle ?? ""}/${folder.title}",
    super(key: key);
  final String header;
  final Folder folder;

  @override
  _FolderPageState createState() => _FolderPageState();
}

class _FolderPageState extends State<FolderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.folder_open),
        title: Text(widget.header),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: List<Widget>.from(widget.folder.children.map((n) {
          return OutlinedButton.icon(
            icon: Icon(n.runtimeType == Folder ? Icons.folder_open : Icons.note),
            label: Text(n.title),
            onPressed: () {
              if (n.runtimeType == Folder)
                switchToPage(context, FolderPage(n, beforeTitle: widget.header));
              else
                switchToPage(context, Container());
            },
          );
        }))
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "NoteAdd",
            child: Icon(Icons.note_add),
            tooltip: "Add new note",
            onPressed: () => setState(() { widget.folder.add(Note('title', 'content')); }),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            heroTag: "FolderAdd",
            child: Icon(Icons.create_new_folder),
            tooltip: "Add new folder",
            onPressed: () => setState(() { widget.folder.add(Folder('ftitle', [])); }),
          ),
        ]
      )
    );
  }
}
