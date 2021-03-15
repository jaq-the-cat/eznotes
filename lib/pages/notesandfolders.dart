import 'package:flutter/material.dart';
import '../widgets.dart';
import '../fileio.dart';
import '../dialogs/newx.dart';

class NotesAndFolders extends StatefulWidget {
    State<NotesAndFolders> createState() => NotesAndFoldersState();
}

class NotesAndFoldersState extends State<NotesAndFolders> {

    TextEditingController controller = TextEditingController();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("EZNOTES"),
            ),
            body: FutureBuilder(
                future: getAll(),
                builder: (context, snapshot) {
                    print(snapshot.error);
                    if (!snapshot.hasData) return Container();
                    Iterable<dynamic> _notes = snapshot.data[0];
                    Iterable<dynamic> _folders = snapshot.data[1];
                    print(_notes);
                    return ListView(
                        children:
                            getClickableList(context, _folders, isFolder: true, onHold: () => setState(() {}))
                            + [ Divider(indent: 10, endIndent: 10), ]
                            + getClickableList(context, _notes, isFolder: false, onHold: () => setState(() {}))
                    );
                }
            ),
            persistentFooterButtons: <Widget>[
                TextButton.icon(
                    icon: Icon(Icons.create_new_folder),
                    label: Text("New Folder"),
                    onPressed: () {
                        newX(context, "New Folder", (s) {
                            setState(() { folders.addFolder(s); });
                        });
                    },
                ),
                TextButton.icon(
                    icon: Icon(Icons.note_add),
                    label: Text("New Note"),
                    onPressed: () {
                        newX(context, "New Note", (s) {
                            setState(() { notes.addNote(s); });
                        });
                    },
                ),
            ]
        );
    }
}
