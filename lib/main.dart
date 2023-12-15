import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_notez/frontend/routes/app_router.dart';
import 'package:project_notez/logic/provider/appstate_provider.dart';

void main() {
  runApp(ProviderScope(
      child: MyApp(
    appRouter: AppRouter(),
  )));
}

class MyApp extends ConsumerWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appstate = ref.watch(appstateProvider);
    return MaterialApp(
      theme: ThemeData(
        fontFamily: appstate.appTheme.fontFamily,
        primaryColor: appstate.appTheme.primaryColor,
        // colorScheme: ColorScheme.fromSeed(seedColor: appstate.appTheme.primaryColor),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        fontFamily: appstate.appTheme.fontFamily,
        appBarTheme: AppBarTheme(backgroundColor: appstate.appTheme.appbarBackgroundColor, foregroundColor: appstate.appTheme.appbarIconColor),
        textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: appstate.appTheme.appbarIconColor)),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      onGenerateRoute: appRouter.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
