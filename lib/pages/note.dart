import 'package:flutter/material.dart';
import '../widgets.dart';

class Note extends StatefulWidget {
    Note(this.noteTitle, this.noteContent, {Key key}) : super(key: key);

    final String noteTitle, noteContent;

    State<Note> createState() => NoteState();
}

class NoteState extends State<Note> {

    TextEditingController controller = TextEditingController();
    bool changed = false;

    @override
    Widget build(BuildContext context) {
        controller.text = widget.noteContent;
        return Scaffold(
            appBar: AppBar(
                title: Text(widget.noteTitle),
                actions: [
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: ElevatedButton(
                            child: Text("Save"),
                            onPressed: changed
                            ? () {
                                setState(() => this.changed = false);
                            }
                            : null,
                        ),
                    ),
                ],
            ),
            body: fullTextField(controller: controller, onChanged: () { setState(() => this.changed = true); }),
        );
    }
}
