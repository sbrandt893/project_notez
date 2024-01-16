import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_notez/frontend/views/screens/home_screen.dart';
import 'package:project_notez/logic/provider/app_state_provider.dart';

class LoadingScreen extends ConsumerStatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends ConsumerState<LoadingScreen> {
  /// Preoloads data in the background to reduce loading time and use timestamps to show the loading screen for at least 500ms
  Future<void> _loadData() async {
    final timeStampNow = DateTime.now();
    await Future.delayed(const Duration(milliseconds: 500));
    // Lade die Ressourcen im Voraus
    final appstate = ref.read(appStateProvider);
    await precacheImage(appstate.appTheme.backgroundImage.image, context);
    final timeStampAfter = DateTime.now();
    if (timeStampAfter.difference(timeStampNow).inMilliseconds < 500) {
      await Future.delayed(Duration(milliseconds: 500 - timeStampAfter.difference(timeStampNow).inMilliseconds));
    }
    // Weitere Daten vorladen, falls benötigt
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Zeige einen Ladeindikator, solange die Daten geladen werden
          return Scaffold(
            body: Container(
              color: Colors.black87,
              child: const Center(
                child: Stack(
                  children: [
                    Center(
                      child: Image(
                        image: AssetImage('assets/images/note.png'),
                        height: 150,
                        width: 150,
                      ),
                    ),
                    Center(child: CircularProgressIndicator()),
                  ],
                ),
              ),
            ),
          );
        } else {
          // Wenn das Laden abgeschlossen ist, zeige den HomeScreen
          return const HomeScreen();
        }
      },
    );
  }
}
