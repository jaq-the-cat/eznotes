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
        print("adding note $note with content $content");
        (await _notesbox).put(note, content);
    }

    Future<dynamic> getNote(String note) async {
        return (await _notesbox).get(note);
    }

    Future<Iterable<dynamic>> getNotes() async {
        return (await _notesbox).toMap().keys;
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

    Future<Iterable<dynamic>> getFolders() async {
        return (await _foldersbox).toMap().keys;
    }

    Future<dynamic> getFolder(String folder) async {
        return (await _foldersbox).get(folder).keys;
    }

    Future<dynamic> getFolderNote(String folder, String note) async {
        final _rfolders = await _foldersbox;
        Map<dynamic, dynamic> curvalues = _rfolders.get(folder);
        return curvalues[note];
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

Future<Iterable<Iterable<dynamic>>> getAll() async =>
    [await notes.getNotes(), await folders.getFolders()];

