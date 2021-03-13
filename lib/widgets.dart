import 'package:flutter/material.dart';
import 'pages/folder.dart';
import 'pages/note.dart';
import 'helpers.dart';

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

List<Widget> getClickableList(BuildContext context, Map<String, dynamic> items, {bool isFolder = false}) =>
    List<Widget>.from(items.keys.map((itemTitle) => _noteItem(
        itemTitle,
        isFolder ? Icons.folder : Icons.note,
        onTap: isFolder
            ? () { switchToPage(context, Folder(itemTitle, items[itemTitle])); }
            : () { switchToPage(context, Note(itemTitle, items[itemTitle])); },
        onLongPress: isFolder ? () {} : () {},
    )));
