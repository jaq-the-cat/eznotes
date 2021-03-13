Future<Map<String, String>> getNotes() async {
    return {
        "Note 1": "Content",
        "Note 2": "Content",
        "Note 3": "Content",
        "Note 4": "Content",
        "Note 5": "Content",
        "Note 6": "Content",
    };
}

Future<Map<String, Map<String, String>>> getFolders() async {
    return {
        "Folder 1": {
            "Note 1": "Content",
            "Note 2": "Content",
            "Note 3": "Content",
        },
        "Folder 2": {
            "Note 4": "Content",
            "Note 5": "Content",
            "Note 6": "Content",
        },
        "Folder 3": {
            "Note 7": "Content",
            "Note 8": "Content",
            "Note 9": "Content",
        },
    };
}

Future<List<Map<String, dynamic>>> getAll() async =>
    [await getNotes(), await getFolders()];

