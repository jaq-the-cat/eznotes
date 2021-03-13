import 'package:flutter/material.dart';
import '../widgets.dart';

class Folder extends StatelessWidget {
    Folder(this.folderTitle, this.folderContent, {Key key}) : super(key: key);

    final String folderTitle;
    final Map<String, String> folderContent;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("/$folderTitle"),
            ),
            body: ListView(
                children: getClickableList(context, folderContent, isFolder: false, folderName: folderTitle),
            ),
        );
    }
}
