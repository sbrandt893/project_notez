import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_notez/backend/models/note.dart';

class NotesNotifier extends StateNotifier<List<Note>> {
  NotesNotifier() : super(_initialState()) {
    init();
  }

  void add(Note note) {
    state = [...state, note];
    saveNotes();
  }

  void init() {
    loadNotes();
  }

  static List<Note> _initialState() {
    return [];
  }

  void remove(String id) {
    state = state.where((note) => note.id != id).toList();
    saveNotes();
  }

  // save notes to json file
  void saveNotes() async {
    final directory = await getApplicationDocumentsDirectory(); // Holt das Verzeichnis in dem die App gespeichert ist
    final file = File('${directory.path}/notes.json'); // Erstellt eine Datei im Verzeichnis
    final notesJson = jsonEncode(state.map((note) => note.toMap()).toList());
    log('saveNotes -> notesJson: $notesJson');
    await file.writeAsString(notesJson);
  }

  // load notes from json file
  void loadNotes() async {
    final directory = await getApplicationDocumentsDirectory(); // Holt das Verzeichnis in dem die App gespeichert ist
    final file = File('${directory.path}/notes.json'); // Erstellt eine Datei im Verzeichnis
    try {
      final notesJson = await file.readAsString();
      log('loadNotes -> notesJson: $notesJson');
      final notesList = jsonDecode(notesJson) as List<dynamic>;
      state = notesList.map((note) => Note.fromMap(note)).toList();
    } catch (e) {
      log('loadNotes -> error: $e');
    }
  }
}
