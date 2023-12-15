import 'package:flutter/material.dart';
import 'package:project_notez/backend/interfaces/i_app_theme.dart';

class LegendStyle implements IAppTheme {
  LegendStyle() : super();

  @override
  String get name => 'LegendStyle';
  @override
  String get fontFamily => 'Hyperjump-Regular';
  @override
  Color get primaryColor => Colors.deepPurple;
  @override
  Color get fabMenuMainButtonColor => Colors.deepPurple.shade900;
  @override
  Color get fabMenuFirstSubButtonColor => Colors.deepPurple.shade800;
  @override
  Color get fabMenuSecondSubButtonColor => Colors.deepPurple.shade600;
  @override
  Color get fabMenuThirdSubButtonColor => Colors.deepPurple.shade400;
  @override
  Color get fabMenuIconColor => Colors.white;
  @override
  Color get appbarIconColor => Colors.white;
  @override
  Color get appbarBackgroundColor => Colors.deepPurple.shade900;
}
