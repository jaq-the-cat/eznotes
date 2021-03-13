import 'package:flutter/material.dart';
import '../widgets.dart';
import '../fileio.dart';

class Note extends StatefulWidget {
    Note(this.noteTitle, this.noteContent, {this.folder, Key key}) : super(key: key);

    final String noteTitle, noteContent;
    final String folder;

    State<Note> createState() => NoteState();
}

class NoteState extends State<Note> {

    TextEditingController controller = TextEditingController();
    bool changed = false;

    @override
    void initState() {
        controller.text = widget.noteContent;
        super.initState();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("${widget.folder ?? ""}/${widget.noteTitle}"),
                actions: [
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: ElevatedButton(
                            child: Text("Save"),
                            onPressed: changed
                            ? () {
                                setState(() => this.changed = false);
                                print(widget.folder);
                                if (widget.folder == null)
                                    notes.addNote(widget.noteTitle, controller.text);
                                else
                                    folders.addNote(widget.folder, widget.noteTitle, controller.text);
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
