import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_notez/backend/models/appstate.dart';
import 'package:project_notez/backend/models/themes/hufflepaff_style.dart';
import 'package:project_notez/backend/models/themes/legend_style.dart';
import 'package:project_notez/backend/models/translations/de_translation.dart';
import 'package:project_notez/backend/models/translations/en_translation.dart';

class AppstateNotifier extends StateNotifier<Appstate> {
  AppstateNotifier()
      : super(
          Appstate(
            isDarkMode: false,
            translation: DeTranslation(),
            appTheme: HufflepaffStyle(),
          ),
        );

  void changeDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeTranslation() {
    if (state.translation is DeTranslation) {
      state = state.copyWith(translation: EnTranslation());
    } else {
      state = state.copyWith(translation: DeTranslation());
    }
  }

  void changeTheme() {
    if (state.appTheme is HufflepaffStyle) {
      state = state.copyWith(appTheme: LegendStyle());
    } else {
      state = state.copyWith(appTheme: HufflepaffStyle());
    }
  }
}
