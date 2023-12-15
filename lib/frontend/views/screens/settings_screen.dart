import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_notez/backend/models/appstate.dart';
import 'package:project_notez/backend/models/themes/hufflepaff_style.dart';
import 'package:project_notez/logic/provider/appstate_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Appstate appstate = ref.watch(appstateProvider);
    return Scaffold(
      backgroundColor: appstate.isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          appstate.translation.titleSettings,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check_circle),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              appstate.translation.subTitleSettings,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Column(
              children: [
                Text(
                  appstate.translation.darkModeSwitchDescription,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Switch(
                  value: appstate.isDarkMode,
                  onChanged: (value) => ref.read(appstateProvider.notifier).changeDarkMode(),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  appstate.translation.appThemeSwitchDescription,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Switch(
                  value: appstate.appTheme is HufflepaffStyle ? true : false,
                  onChanged: (value) => ref.read(appstateProvider.notifier).changeTheme(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
