import 'package:flutter/material.dart';

Future<T> switchToPage<T>(BuildContext context, Widget route) async =>
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => route,
    ));
