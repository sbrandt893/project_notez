import 'package:project_notez/backend/interfaces/i_app_theme.dart';
import 'package:project_notez/backend/interfaces/i_translation.dart';

class AppState {
  // Attributes
  final bool isDarkMode;
  final ITranslation translation;
  final IAppTheme appTheme;

  // Constructor
  const AppState({required this.isDarkMode, required this.translation, required this.appTheme});

  // Create a copy of the current object with some new values
  AppState copyWith({bool? isDarkMode, ITranslation? translation, IAppTheme? appTheme}) {
    return AppState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      translation: translation ?? this.translation,
      appTheme: appTheme ?? this.appTheme,
    );
  }

  // override toString to have a readable output of the object for debugging
  @override
  String toString() => 'AppState(isDarkMode: $isDarkMode, translation: $translation, appTheme: $appTheme)';

  // Saving the AppState to a json file
  Map<String, dynamic> toMap() {
    return {
      'isDarkMode': isDarkMode,
      'translation': translation.languageCode,
      'appTheme': appTheme.name,
    };
  }

  // Loading the AppState from a json file
  factory AppState.fromMap(Map<String, dynamic> map) {
    return AppState(
      isDarkMode: map['isDarkMode'],
      translation: ITranslation.fromString(map['translation']),
      appTheme: IAppTheme.fromString(map['appTheme']),
    );
  }
}
