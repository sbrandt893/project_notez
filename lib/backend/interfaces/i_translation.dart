import 'package:flutter/material.dart';
import 'package:project_notez/backend/models/translations/de_translation.dart';
import 'package:project_notez/backend/models/translations/en_translation.dart';

abstract class ITranslation {
  String get languageCode;
  String get titleHome;
  String get titleSettings;
  String get subTitleHome;
  String get subTitleSettings;
  String get darkModeSwitchDescription;
  String get appThemeSwitchDescription;
  Image get flagIcon;

  factory ITranslation.fromString(String? string) {
    if (string == DeTranslation().languageCode) {
      return DeTranslation();
    } else if (string == EnTranslation().languageCode) {
      return EnTranslation();
    } else {
      return DeTranslation();
    }
  }
}
