import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_notez/backend/models/app_state.dart';
import 'package:project_notez/logic/provider/app_state_provider.dart';

class NoteScreen extends ConsumerStatefulWidget {
  const NoteScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NoteScreenState();
}

class _NoteScreenState extends ConsumerState<NoteScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final UndoHistoryController _undoController = UndoHistoryController();

  @override
  Widget build(BuildContext context) {
    // Page where the user can view and edit a note
    final AppState appState = ref.watch(appStateProvider);

    return Scaffold(
        appBar: AppBar(
          title: Text('Note'),
          actions: [
            IconButton(
              onPressed: () => _undoController.undo(),
              icon: const Icon(Icons.undo),
              color: appState.appTheme.appbarIconColor,
            ),
            IconButton(
              onPressed: () => _undoController.redo(),
              icon: const Icon(Icons.redo),
              color: appState.appTheme.appbarIconColor,
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: [
              // Title
              TextField(
                maxLines: 1,
                controller: titleController,
                // undoController: _undoController,
                decoration: InputDecoration(
                  hintText: 'Title',
                ),
              ),
              // Description
              TextField(
                maxLines: 10,
                controller: descriptionController,
                undoController: _undoController,
                decoration: InputDecoration(
                  hintText: 'Description',
                ),
              ),
            ],
          ),
        ));
  }
}
