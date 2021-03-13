import 'package:flutter/material.dart';
import '../widgets.dart';

class Note extends StatefulWidget {
    Note(this.noteTitle, this.noteContent, {Key key}) : super(key: key);

    final String noteTitle, noteContent;

    State<Note> createState() => NoteState();
}

class NoteState extends State<Note> {

    TextEditingController controller = TextEditingController();

    @override
    Widget build(BuildContext context) {
        controller.text = widget.noteContent;
        return Scaffold(
            appBar: AppBar(
                title: Text(widget.noteTitle),
            ),
            body: fullTextField(controller: controller),
        );
    }
}
