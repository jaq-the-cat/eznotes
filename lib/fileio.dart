class Notes {
    Map<String, String> notes = {
        "Note 1": "Content",
        "Note 2": "Content",
        "Note 3": "Content",
        "Note 4": "Content",
        "Note 5": "Content",
        "Note 6": "Content",
        "Note 7": "Content",
        "Note 8": "Content",
        "Note 9": "Content",
        "Note 10": "Content",
    };

    Future<void> addNote(String note) async {
        notes[note] = "";
    }

    Future<Map<String, String>> getNotes() async {
        return notes;
    }
}

class Folders {
    Map<String, Map<String, String>> folders = {
        "Folder 1": {
            "Note 1-1": "Content",
            "Note 1-2": "Content",
            "Note 1-3": "Content",
        },
        "Folder 2": {
            "Note 2-1": "Content",
            "Note 2-2": "Content",
            "Note 2-3": "Content",
        },
        "Folder 3": {
            "Note 3-1": "Content",
            "Note 3-2": "Content",
            "Note 3-3": "Content",
        },
        "Folder 4": {
            "Note 4-1": "Content",
            "Note 4-2": "Content",
            "Note 4-3": "Content",
        },
        "Folder 5": {
            "Note 5-1": "Content",
            "Note 5-2": "Content",
            "Note 5-3": "Content",
        },
    };

    Future<void> addFolder(String folder) async {
        folders[folder] = {};
    }

    Future<Map<String, Map<String, String>>> getFolders() async {
        return folders;
    }
}

Notes notes = Notes();
Folders folders = Folders();

Future<List<Map<String, dynamic>>> getAll() async =>
    [await notes.getNotes(), await folders.getFolders()];

