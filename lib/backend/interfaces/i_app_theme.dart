import 'package:flutter/material.dart';

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
}
