import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_notez/backend/models/app_state.dart';
import 'package:project_notez/backend/models/note.dart';
import 'package:project_notez/frontend/animations/fab_menu.dart';
import 'package:project_notez/frontend/routes/app_router.dart';
import 'package:project_notez/frontend/views/widgets/my_shape_border_z.dart';
import 'package:project_notez/logic/provider/app_state_provider.dart';
import 'package:project_notez/logic/provider/notes_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppState appState = ref.watch(appStateProvider);
    Size size = MediaQuery.of(context).size;
    List<Note> notes = ref.watch(notesProvider);

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
              child: Padding(
                padding: const EdgeInsets.only(top: 75),
                child: Column(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Text(
                        appState.translation.subTitleHome,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: appState.appTheme.subTitleColor),
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: ListView.builder(
                          padding: const EdgeInsets.all(20),
                          itemCount: notes.length,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 150,
                              child: Card(
                                child: ListTile(
                                  title: Text(notes[index].title),
                                  onTap: () {
                                    ref.read(notesProvider.notifier).remove(notes[index].id);
                                  },
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              )),
          floatingActionButton: const FabMenu()),
    );
  }
}
