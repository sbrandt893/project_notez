import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_notez/backend/models/app_state.dart';
import 'package:project_notez/backend/models/themes/hufflepaff_style.dart';
import 'package:project_notez/frontend/routes/app_router.dart';
import 'package:project_notez/logic/provider/app_state_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppState appState = ref.watch(appStateProvider);
    return Scaffold(
      backgroundColor: appState.isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          appState.translation.titleSettings,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check_circle),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '${Routes.home}');
              ref.read(appStateProvider.notifier).saveAppstate();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              appState.translation.subTitleSettings,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Column(
              children: [
                Text(
                  appState.translation.darkModeSwitchDescription,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Switch(
                  value: appState.isDarkMode,
                  onChanged: (value) => ref.read(appStateProvider.notifier).changeDarkMode(),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  appState.translation.appThemeSwitchDescription,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Switch(
                  value: appState.appTheme is HufflepaffStyle ? true : false,
                  onChanged: (value) => ref.read(appStateProvider.notifier).changeTheme(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
