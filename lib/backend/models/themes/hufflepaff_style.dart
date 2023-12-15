import 'package:flutter/material.dart';
import 'package:project_notez/backend/interfaces/i_app_theme.dart';

class HufflepaffStyle implements IAppTheme {
  HufflepaffStyle() : super();

  @override
  String get name => 'HufflepaffStyle';
  @override
  String get fontFamily => 'Comic-Sans-MS';
  @override
  Color get primaryColor => Colors.yellow.shade700;
  @override
  Color get fabMenuMainButtonColor => Colors.yellow.shade800;
  @override
  Color get fabMenuFirstSubButtonColor => Colors.yellow.shade700;
  @override
  Color get fabMenuSecondSubButtonColor => Colors.yellow.shade600;
  @override
  Color get fabMenuThirdSubButtonColor => Colors.yellow.shade500;
  @override
  Color get fabMenuIconColor => Colors.black;
  @override
  Color get appbarIconColor => Colors.black;
  @override
  Color get appbarBackgroundColor => Colors.yellow.shade800;
}
