import 'package:flutter/material.dart';
import 'package:project_notez/backend/interfaces/i_translation.dart';

class EnTranslation implements ITranslation {
  EnTranslation() : super();

  @override
  String get languageCode => 'EN';
  @override
  String get titleHome => 'NoteZ';
  @override
  String get titleSettings => 'NoteZ - SettingsScreen';
  @override
  String get subTitleHome => 'This is the HomeScreen of NoteZ';
  @override
  String get subTitleSettings => 'This is the SettingsScreen of NoteZ';
  @override
  String get darkModeSwitchDescription => 'DarkMode on/off';
  @override
  String get appThemeSwitchDescription => 'Switch AppTheme';
  @override
  String get notes => 'Notes';

  @override
  Image get flagIcon => Image.asset('assets/images/en.png');
}
