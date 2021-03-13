import 'package:flutter/material.dart';
import '../widgets.dart';
import '../fileio.dart';

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
                builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                    if (!snapshot.hasData) return Container();
                    Map<String, dynamic> notes = snapshot.data[0];
                    Map<String, dynamic> folders = snapshot.data[1];
                    return ListView(
                        children:
                        getClickableList(context, folders, isFolder: true)
                        + [ Divider(indent: 10, endIndent: 10), ]
                        + getClickableList(context, notes, isFolder: false)
                    );
                }
            ),
            persistentFooterButtons: <Widget>[
                TextButton.icon(
                    icon: Icon(Icons.create_new_folder),
                    label: Text("New Folder"),
                    onPressed: () {},
                ),
                TextButton.icon(
                    icon: Icon(Icons.note_add),
                    label: Text("New Note"),
                    onPressed: () {},
                ),
            ]
        );
    }
}
