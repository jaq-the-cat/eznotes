import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

final _hive = (() async => Hive.initFlutter())();
Future<Box> _notesbox = (() async {
    await _hive;
    return Hive.openBox('notes');
})();
Future<Box> _foldersbox = (() async {
    await _hive;
    return Hive.openBox('folders');
})();

class Notes {

    Future<void> addNote(String note, [String content = ""]) async {
        (await _notesbox).put(note, content);
    }

    Future<Map<dynamic, dynamic>> getNotes() async {
        return (await _notesbox).toMap();
    }

    Future<void> deleteNote(String note) async {
        return (await _notesbox).delete(note);
    }
}

class Folders {

    Future<void> addFolder(String folder) async {
        (await _foldersbox).put(folder, {});
    }

    Future<void> addNote(String folder, String note, [String content = ""]) async {
        final _rfolders = await _foldersbox;
        Map<dynamic, dynamic> curvalues = _rfolders.get(folder);
        curvalues[note] = content;
        _rfolders.put(folder, curvalues);
    }

    Future<Map<dynamic, dynamic>> getFolders() async {
        return (await _foldersbox).toMap();
    }

    Future<void> deleteNote(String folder, String note) async {
        final _rfolders = await _foldersbox;
        Map<dynamic, dynamic> curvalues = _rfolders.get(folder);
        curvalues.remove(note);
        _rfolders.put(folder, curvalues);
    }

    Future<void> deleteFolder(String folder) async {
        return (await _foldersbox).delete(folder);
    }
}

Notes notes = Notes();
Folders folders = Folders();

Future<List<Map<dynamic, dynamic>>> getAll() async =>
    [await notes.getNotes(), await folders.getFolders()];

