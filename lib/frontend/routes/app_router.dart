import 'package:flutter/material.dart';
import '../animations/switch_screen_animation.dart';
import '../views/screens/home_screen.dart';
import '../views/screens/settings_screen.dart';

enum Routes {
  home,
  settings,
}

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'Routes.home':
        return SwitchScreenAnimation.createScaleRoute(page: const HomeScreen());
      case 'Routes.settings':
        return SwitchScreenAnimation.createScaleRoute(page: const SettingsScreen());

      default:
        return SwitchScreenAnimation.createScaleRoute(page: const HomeScreen());
    }
  }
}
