import 'package:flutter/material.dart';
Future<bool> confirmDelete(BuildContext context, String whatDelete) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text("Delete '$whatDelete'"),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Text("Are you sure you would like  to delete $whatDelete?"),
          ]
        )
      ),
      actions: [
        TextButton(
          child: Text("CANCEL"),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        TextButton(
          child: Text("CONFIRM"),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ]
    ),
  );
}

Future<String> newX(BuildContext context, String toCreate) {
  final ctrl = TextEditingController();
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => Dialog(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        shrinkWrap: true,
        children: <Widget>[
          Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                controller: ctrl,
                maxLength: 22,
                decoration: InputDecoration(
                    labelText: toCreate,
                    labelStyle: TextStyle(
                      color: Colors.deepOrange,
                    ),
                    fillColor: Colors.deepOrange,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: Text("CANCEL"),
                      onPressed: () => Navigator.of(context).pop(""),
                    ),
                    TextButton(
                      child: Text("CREATE"),
                      onPressed: () {
                        Navigator.of(context).pop(ctrl.text);
                      },
                    ),
                  ]
                )
              ]
            ),
          ],
        ),
      ),
    );
}
