import 'package:flutter/material.dart';

Future<String> newX(BuildContext context, String toCreate, void Function(String) onConfirm) {
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
                                            onConfirm(ctrl.text);
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
