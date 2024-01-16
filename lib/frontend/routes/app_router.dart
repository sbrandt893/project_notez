import 'package:flutter/material.dart';
import 'package:project_notez/frontend/views/screens/loading_screen.dart';
import '../animations/switch_screen_animation.dart';
import '../views/screens/settings_screen.dart';

enum Routes {
  home,
  settings,
}

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'Routes.home':
        return SwitchScreenAnimation.createFadeRoute(page: const LoadingScreen());
      case 'Routes.settings':
        return SwitchScreenAnimation.createScaleRoute(page: const SettingsScreen());

      default:
        return SwitchScreenAnimation.createFadeRoute(page: const LoadingScreen());
    }
  }
}
