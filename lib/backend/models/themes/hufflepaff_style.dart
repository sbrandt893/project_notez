import 'package:flutter/material.dart';
import 'package:project_notez/backend/interfaces/i_app_theme.dart';

class HufflepaffStyle implements IAppTheme {
  HufflepaffStyle() : super();

  @override
  String get name => 'HufflepaffStyle';
  @override
  String get fontFamily => 'Comic-Sans-MS';
  @override
  Color get primaryColor => const Color.fromARGB(255, 193, 183, 133);
  @override
  Color get fabMenuMainButtonColor => const Color.fromARGB(255, 200, 155, 0);
  @override
  Color get fabMenuFirstSubButtonColor => const Color.fromARGB(255, 230, 185, 0);
  @override
  Color get fabMenuSecondSubButtonColor => const Color.fromARGB(255, 220, 175, 0);
  @override
  Color get fabMenuThirdSubButtonColor => const Color.fromARGB(255, 210, 165, 0);
  @override
  Color get fabMenuIconColor => Colors.black;
  @override
  Color get appbarIconColor => Colors.black;
  @override
  Color get appbarBackgroundColor => const Color.fromARGB(255, 200, 155, 0);
  @override
  Image get backgroundImage => Image.asset('assets/images/parchment.jpg');
  @override
  Color get subTitleColor => Colors.black;
}
