import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

final _hive = (() async => Hive.initFlutter())();

class Notes {

    Future<Box> box;

    Notes() {
        _hive.then((v) {
            box = Hive.openBox('notes');
        });
    }

    Future<void> addNote(String note, [String content = ""]) async {
        (await box).put(note, content);
    }

    Future<Map<String, String>> getNotes() async {
        return (await box).toMap();
    }
}

class Folders {

    Future<Box> box;

    Folders() {
        _hive.then((v) {
            box = Hive.openBox('folders');
        });
    }

    Future<void> addFolder(String folder) async {
        (await box).put(folder, {});
    }

    Future<void> addNote(String folder, String note, [String content = ""]) async {
        final rbox = await box;
        Map<String, String> curvalues = rbox.get(folder);
        curvalues[note] = content;
        rbox.put(folder, curvalues);
    }

    Future<Map<String, Map<String, String>>> getFolders() async {
        return (await box).toMap();
    }
}

Notes notes = Notes();
Folders folders = Folders();

Future<List<Map<String, dynamic>>> getAll() async =>
    [await notes.getNotes(), await folders.getFolders()];

