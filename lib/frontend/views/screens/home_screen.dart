import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_notez/backend/models/app_state.dart';
import 'package:project_notez/backend/models/note.dart';
import 'package:project_notez/frontend/animations/fab_menu.dart';
import 'package:project_notez/frontend/routes/app_router.dart';
import 'package:project_notez/frontend/views/widgets/my_shape_border_z.dart';
import 'package:project_notez/logic/functions.dart';
import 'package:project_notez/logic/provider/app_state_provider.dart';
import 'package:project_notez/logic/provider/notes_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppState appState = ref.watch(appStateProvider);
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            toolbarHeight: 69,
            title: Padding(
              padding: const EdgeInsets.only(left: 60, top: 20),
              child: Text(
                appState.translation.titleHome,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 36, width: 36, child: appState.translation.flagIcon),
                    const SizedBox(width: 3),
                    Text(
                      appState.translation.languageCode,
                      style: TextStyle(
                        color: appState.appTheme.appbarIconColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onPressed: () => ref.read(appStateProvider.notifier).changeTranslation(),
                tooltip: appState.translation.languageCode,
              ),
              IconButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '${Routes.settings}'),
                icon: const Icon(Icons.settings, size: 32),
                color: appState.appTheme.appbarIconColor,
              ),
            ],
            // create a shape with linear
            shape: const MyShapeBorderZ(),
          ),
          body: Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: appState.appTheme.backgroundImage.image,
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(appState.appTheme.primaryColor, BlendMode.multiply),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 100),
                // selectable Widgets
                child: Column(
                  children: [
                    // Notes Widget
                    NotesWidget(),
                  ],
                ),
              )),
          floatingActionButton: const FabMenu()),
    );
  }
}

class NotesWidget extends ConsumerStatefulWidget {
  const NotesWidget({
    super.key,
  });

  @override
  NotesWidgetState createState() => NotesWidgetState();
}

class NotesWidgetState extends ConsumerState<NotesWidget> {
  int filterSelected = 0;

  @override
  Widget build(BuildContext context) {
    final AppState appState = ref.watch(appStateProvider);
    final List<Note> notes = ref.watch(notesProvider);
    filterSelected == 0 ? notes.sort((a, b) => b.dateLastOpened.compareTo(a.dateLastOpened)) : notes.sort((a, b) => b.dateLastUpdated.compareTo(a.dateLastUpdated));
    return Container(
      margin: const EdgeInsets.all(10),
      // padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: appState.appTheme.appbarBackgroundColor.withOpacity(0.75),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  child: Text(
                    '${appState.translation.notes}(${notes.length})',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: appState.appTheme.subTitleColor),
                  ),
                  onPressed: () => Navigator.pushNamed(context, '${Routes.notes}')),
              IconButton(
                icon: const Icon(Icons.more_horiz, size: 32),
                onPressed: () => Navigator.pushNamed(context, '${Routes.notes}'),
                color: appState.appTheme.appbarIconColor,
              ),
            ],
          ),
          // Filter for Notes
          Row(
            children: [
              // Filter: Last used
              TextButton(
                onPressed: () => setState(() => filterSelected = 0),
                child: Text(
                  'Zuletzt verwendet',
                  style: TextStyle(
                    fontSize: 20,
                    color: filterSelected == 0 ? appState.appTheme.subTitleColor : appState.appTheme.subTitleColor.withOpacity(0.3),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // Filter: Favorites
              TextButton(
                onPressed: () => setState(() => filterSelected = 1),
                child: Text(
                  'Favoriten',
                  style: TextStyle(
                    fontSize: 20,
                    color: filterSelected == 1 ? appState.appTheme.subTitleColor : appState.appTheme.subTitleColor.withOpacity(0.3),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: notes.length > 7 ? 7 : notes.length,
                itemBuilder: (BuildContext context, int index) {
                  return NotePreview(note: notes[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NotePreview extends ConsumerWidget {
  const NotePreview({
    super.key,
    required this.note,
  });

  final Note note;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: SizedBox(
        width: 150,
        child: Material(
          shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  note.title,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Column(
                  children: [
                    Text(
                      note.description,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
                //^later: onTap: () => Navigator.pushNamed(context, '${Routes.notes}/${notes[index].id}'),
                onTap: () => Navigator.pushNamed(context, '${Routes.notes}'),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        getGermanDateTime(note.dateLastUpdated),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          size: 20,
                        ),
                        onPressed: () {
                          ref.read(notesProvider.notifier).remove(note.id);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
