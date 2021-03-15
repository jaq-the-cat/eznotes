import 'package:flutter/material.dart';

Future<bool> confirmDelete(BuildContext context, String whatDelete) {
    return showDialog<bool>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
            title: Text("Delete '$whatDelete'"),
            content: SingleChildScrollView(
                child: ListBody(
                    children: <Widget>[
                        Text("Are you sure you would like to delete '$whatDelete'")
                    ],
                ),
            ),
            actions: <Widget>[
                TextButton(
                    child: Text("CANCEL"),
                    onPressed: () => Navigator.of(context).pop(false),
                ),
                TextButton(
                    child: Text("CONFIRM"),
                    onPressed: () => Navigator.of(context).pop(true),
                ),
            ],
        ),
    );
}
