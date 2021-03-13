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
                        getClickableList(notes, isFolder: false)
                        + [ Divider(indent: 10, endIndent: 10), ]
                        + getClickableList(folders, isFolder: true)
                    );
                }
            ),
        );
    }
}
