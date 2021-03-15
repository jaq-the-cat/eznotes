import 'package:flutter/material.dart';
import 'pages/folder.dart';
import 'pages/note.dart';
import 'helpers.dart';
import 'fileio.dart';
import 'dialogs/confirmdel.dart';

Widget fullTextField({TextEditingController controller, void Function() onChanged}) => Padding(
    padding: EdgeInsets.all(10),
    child: TextField(
        controller: controller,
        maxLines: 256,
        keyboardType: TextInputType.multiline,
        onChanged: (s) => onChanged(),
        decoration: InputDecoration(
            border:  InputBorder.none,
        ),
    ),
);

Widget _noteItem(String itemTitle, IconData icon, {void Function() onTap, void Function() onLongPress}) =>
    InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Padding(
            padding: EdgeInsets.all(15),
            child: Row(
                children: <Widget>[
                    Icon(icon),
                    SizedBox(width: 10),
                    Text(itemTitle)
                ]
            ),
        ),
    );

List<Widget> getClickableList(BuildContext context, Iterable<dynamic> items, {
    bool isFolder = false,
    String folderName,
    void Function() onHold,
}) =>
    List<Widget>.from(items.map((itemTitle) => _noteItem(
        itemTitle,
        isFolder ? Icons.folder : Icons.note,
        onTap: isFolder
            ? () { switchToPage(context, Folder(itemTitle)); }
            : () { switchToPage(context, Note(itemTitle, folder: folderName)); },
        onLongPress: isFolder
            ? () {
                confirmDelete(context, itemTitle).then((v) {
                    if (v) folders.deleteFolder(itemTitle);
                    onHold();
                });
            }
            : () {
                confirmDelete(context, itemTitle).then((v) {
                    if (v)
                        folderName == null
                            ? notes.deleteNote(itemTitle)
                            : folders.deleteNote(folderName, itemTitle);
                    onHold();
                });
            },
    )));
