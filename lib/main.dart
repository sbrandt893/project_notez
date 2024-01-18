import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_notez/frontend/routes/app_router.dart';
import 'package:project_notez/logic/provider/app_state_provider.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(
        appRouter: AppRouter(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider);
    return MaterialApp(
      theme: ThemeData(
        fontFamily: appState.appTheme.fontFamily,
        primaryColor: appState.appTheme.primaryColor,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        fontFamily: appState.appTheme.fontFamily,
        appBarTheme: AppBarTheme(backgroundColor: appState.appTheme.appbarBackgroundColor, foregroundColor: appState.appTheme.appbarIconColor),
        textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: appState.appTheme.appbarIconColor)),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      onGenerateRoute: appRouter.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
