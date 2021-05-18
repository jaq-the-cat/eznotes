import 'package:flutter/material.dart';
import 'fileio.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<Folder> root = getRoot();

    return MaterialApp(
      title: 'EZNOTES',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
      ),
      home: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.note),
            title: Text("eznotes"),
          ),
          body: Container(),
        ),
    );
  }
}
