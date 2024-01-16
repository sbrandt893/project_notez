import 'dart:core';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_notez/backend/models/note.dart';
import 'package:project_notez/logic/provider/notes_notifier.dart';

final notesProvider = StateNotifierProvider<NotesNotifier, List<Note>>(
  (ref) => NotesNotifier(),
);
