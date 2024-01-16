import 'package:flutter/material.dart';
import 'package:project_notez/backend/models/themes/hufflepaff_style.dart';
import 'package:project_notez/backend/models/themes/legend_style.dart';

abstract class IAppTheme {
  String get name;
  String get fontFamily;
  Color get primaryColor;
  Color get fabMenuMainButtonColor;
  Color get fabMenuFirstSubButtonColor;
  Color get fabMenuSecondSubButtonColor;
  Color get fabMenuThirdSubButtonColor;
  Color get fabMenuIconColor;
  Color get appbarIconColor;
  Color get appbarBackgroundColor;
  Image get backgroundImage;
  Color get subTitleColor;

  factory IAppTheme.fromString(String? string) {
    if (string == HufflepaffStyle().name) {
      return HufflepaffStyle();
    } else if (string == LegendStyle().name) {
      return LegendStyle();
    } else {
      return HufflepaffStyle();
    }
  }
}
