import 'package:flutter/material.dart';
import 'widgets.dart';
import 'fileio.dart';
import 'globals.dart' as g;

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    g.root = getRoot();

    return MaterialApp(
      title: 'EZNOTES',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
      ),
      home: FutureBuilder(
        future: g.root,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Scaffold(appBar: AppBar());
          return FolderPage(snapshot.data);
        }
      ),
    );
  }
}
