import 'package:flutter/material.dart';
import '../widgets.dart';

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
                leading: Icon(Icons.note),
            ),
            body: fullTextField(controller: controller),
        );
    }
}
