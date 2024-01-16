import 'package:flutter/material.dart';
import 'package:project_notez/backend/interfaces/i_app_theme.dart';

class LegendStyle implements IAppTheme {
  LegendStyle() : super();

  @override
  String get name => 'LegendStyle';
  @override
  String get fontFamily => 'Hyperjump-Regular';
  @override
  Color get primaryColor => const Color.fromARGB(255, 93, 0, 148);
  @override
  Color get fabMenuMainButtonColor => const Color.fromARGB(255, 73, 0, 128);
  @override
  Color get fabMenuFirstSubButtonColor => const Color.fromARGB(255, 63, 0, 118);
  @override
  Color get fabMenuSecondSubButtonColor => const Color.fromARGB(255, 53, 0, 108);
  @override
  Color get fabMenuThirdSubButtonColor => const Color.fromARGB(255, 43, 0, 98);
  @override
  Color get fabMenuIconColor => Colors.white;
  @override
  Color get appbarIconColor => Colors.white;
  @override
  Color get appbarBackgroundColor => const Color.fromARGB(255, 93, 0, 148);
  @override
  Image get backgroundImage => Image.asset('assets/images/thunder.gif');
  @override
  Color get subTitleColor => Colors.white;
  // @override
  // ThemeData get themeData => ThemeData(
  //       fontFamily: fontFamily,
  //       primaryColor: primaryColor,
  //       useMaterial3: true,
  //     );
}
