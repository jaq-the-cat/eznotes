import 'package:flutter/material.dart';
import '../widgets.dart';
import '../fileio.dart';

class Note extends StatefulWidget {
    Note(this.noteTitle, {this.folder, Key key}) : super(key: key);

    final String noteTitle;
    final String folder;

    State<Note> createState() => NoteState();
}

class NoteState extends State<Note> {

    TextEditingController controller = TextEditingController();
    bool changed = false;

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
                                if (widget.folder == null)
                                    notes.addNote(widget.noteTitle, controller.text).whenComplete(() => setState(() {}));
                                else
                                    folders.addNote(widget.folder, widget.noteTitle, controller.text).whenComplete(() => setState(() {}));
                            }
                            : null,
                        ),
                    ),
                ],
            ),
            body: FutureBuilder(
                future: widget.folder == null ? notes.getNote(widget.noteTitle) : folders.getFolderNote(widget.folder, widget.noteTitle),
                builder: (context, snapshot) {
                    if (!snapshot.hasData) return Container();
                    if (controller.text.isEmpty)
                        controller.text = snapshot.data;
                    return fullTextField(controller: controller, onChanged: () { setState(() => this.changed = true); });
                }
                    ),
        );
    }
}
