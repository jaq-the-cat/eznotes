import 'package:flutter/material.dart';

Widget fullTextField({TextEditingController controller}) => Padding(
    padding: EdgeInsets.all(10),
    child: TextField(
        controller: controller,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
            border:  InputBorder.none,
        ),
    ),
);
