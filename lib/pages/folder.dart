import 'package:flutter/material.dart';
import '../fileio.dart';
import '../dialogs/newx.dart';
import '../widgets.dart';

class Folder extends StatefulWidget {
    Folder(this.folderTitle, this.folderContent, {Key key}) : super(key: key);

    final String folderTitle;
    final Map<dynamic, dynamic> folderContent;

    @override
    FolderState createState() => FolderState();
}

class FolderState extends State<Folder> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("/${widget.folderTitle}"),
            ),
            body: ListView(
                children: getClickableList(context, widget.folderContent,
                    isFolder: false, folderName: widget.folderTitle,
                    onHold: () => setState(() {})),
            ),
            persistentFooterButtons: <Widget>[
                TextButton.icon(
                    icon: Icon(Icons.note_add),
                    label: Text("New Note"),
                    onPressed: () {
                        newX(context, "New Note", (s) {
                            setState(() { folders.addNote(widget.folderTitle, s); });
                        });
                    },
                ),
            ]
        );
    }
}
