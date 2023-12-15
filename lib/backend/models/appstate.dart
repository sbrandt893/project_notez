// Stores the whole app state in a single object
import 'package:project_notez/backend/interfaces/i_app_theme.dart';
import 'package:project_notez/backend/interfaces/i_translation.dart';

class Appstate {
  // Attributes
  final bool isDarkMode;
  final ITranslation translation;
  final IAppTheme appTheme;

  // Constructor
  const Appstate({required this.isDarkMode, required this.translation, required this.appTheme});

  // Create a copy of the current object with some new values
  Appstate copyWith({bool? isDarkMode, ITranslation? translation, IAppTheme? appTheme}) {
    return Appstate(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      translation: translation ?? this.translation,
      appTheme: appTheme ?? this.appTheme,
    );
  }

  // override toString to have a readable output of the object for debugging
  @override
  String toString() => 'Appstate(isDarkMode: $isDarkMode, translation: $translation, appTheme: $appTheme)';
}
