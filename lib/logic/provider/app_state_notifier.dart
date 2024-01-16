import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_notez/backend/models/app_state.dart';
import 'package:project_notez/backend/models/themes/hufflepaff_style.dart';
import 'package:project_notez/backend/models/themes/legend_style.dart';
import 'package:project_notez/backend/models/translations/de_translation.dart';
import 'package:project_notez/backend/models/translations/en_translation.dart';

class AppStateNotifier extends StateNotifier<AppState> {
  AppStateNotifier() : super(_initialState()) {
    init();
  }
  void init() {
    loadAppstate();
  }

  static AppState _initialState() {
    return AppState(
      isDarkMode: false,
      translation: EnTranslation(),
      appTheme: LegendStyle(),
    );
  }

  void changeDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeTranslation() {
    if (state.translation is DeTranslation) {
      state = state.copyWith(translation: EnTranslation());
    } else {
      state = state.copyWith(translation: DeTranslation());
    }
    saveAppstate();
  }

  void changeTheme() {
    if (state.appTheme is HufflepaffStyle) {
      state = state.copyWith(appTheme: LegendStyle());
    } else {
      state = state.copyWith(appTheme: HufflepaffStyle());
    }
  }

// AppState saving to json file
  void saveAppstate() async {
    final directory = await getApplicationDocumentsDirectory(); // Holt das Verzeichnis in dem die App gespeichert ist
    final file = File('${directory.path}/app_state.json'); // Erstellt eine Datei im Verzeichnis
    final appstate = state.copyWith(
      isDarkMode: state.isDarkMode,
      translation: state.translation,
      appTheme: state.appTheme,
    );
    final appStateJson = jsonEncode(appstate.toMap());
    log('saveAppstate -> appStateJson: $appStateJson');
    await file.writeAsString(appStateJson);
  }

// AppState loading from json file
  void loadAppstate() async {
    final directory = await getApplicationDocumentsDirectory(); // Holt das Verzeichnis in dem die App gespeichert ist
    final file = File('${directory.path}/app_state.json'); // Erstellt eine Datei im Verzeichnis
    try {
      final appStateJson = await file.readAsString();
      final appStateMap = jsonDecode(appStateJson);
      final appState = AppState.fromMap(appStateMap);
      log('loadAppstate -> appState: $appState');
      state = appState;
    } catch (e) {
      log('Error loading AppState: $e');
    }
  }
}
