import 'package:project_notez/backend/interfaces/i_translation.dart';

class DeTranslation implements ITranslation {
  DeTranslation() : super();

  @override
  String get languageCode => 'DE';
  @override
  String get titleHome => 'NoteZ';
  @override
  String get titleSettings => 'NoteZ - Einstellungen';
  @override
  String get subTitleHome => 'Dies ist die Hauptseite von NoteZ';
  @override
  String get subTitleSettings => 'Dies ist die Einstellungsseite von NoteZ';
  @override
  String get darkModeSwitchDescription => 'DarkMode ein/ausschalten';
  @override
  String get appThemeSwitchDescription => 'AppTheme wechseln';
}
