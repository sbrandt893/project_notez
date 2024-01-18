import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_notez/backend/models/note.dart';
import 'package:project_notez/logic/provider/notes_provider.dart';

class NotesScreen extends ConsumerStatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends ConsumerState<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    List<Note> notes = ref.watch(notesProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text('Notes(${notes.length})'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(notes[index].title),
                    subtitle: Text(notes[index].description),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(notesProvider.notifier).add(Note(
                title: 'Hallo Welt! Hallo Welt! Hallo Welt!',
                description: 'Das ist eine Beschreibung. Das ist eine Beschreibung. Das ist eine Beschreibung. Das ist eine Beschreibung.'));
          },
          child: Icon(Icons.note_add),
        ));
  }
}
