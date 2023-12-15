import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_notez/backend/models/appstate.dart';
import 'package:project_notez/frontend/animations/fab_menu.dart';
import 'package:project_notez/frontend/routes/app_router.dart';
import 'package:project_notez/logic/provider/appstate_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Appstate appstate = ref.watch(appstateProvider);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 32),
          child: Text(
            appstate.translation.titleHome,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 42,
              letterSpacing: 3,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => ref.read(appstateProvider.notifier).changeTranslation(),
            child: Text(
              appstate.translation.languageCode,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '${Routes.settings}'),
            icon: const Icon(Icons.settings, size: 32),
            color: appstate.appTheme.appbarIconColor,
          ),
        ],
        // create a shape with linear
        shape: MyShapeBorder(),
      ),
      body: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  Text(
                    appstate.translation.subTitleHome,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              FabMenu()
            ],
          )),
    );
  }
}

class MyShapeBorder extends ShapeBorder {
  const MyShapeBorder();

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..moveTo(rect.right, rect.bottom - 10)
      ..lineTo(rect.right, rect.bottom)
      // ..lineTo(rect.left, rect.bottom)
      // ..lineTo(rect.left, rect.top)
      // ..lineTo(rect.right, rect.top + 30)
      // ..lineTo(rect.left + 75, rect.top + 30)
      // ..lineTo(rect.left, rect.bottom - 20)
      // ..lineTo(rect.left, rect.bottom)
      // ..lineTo(rect.right, rect.bottom)
      // ..lineTo(rect.right, rect.top)
      ..close();
    // ..moveTo(rect.left, rect.top)
    // ..lineTo(rect.left, rect.top + 50)
    // ..lineTo(rect.left + 50, rect.bottom)
    // ..lineTo(rect.right, rect.bottom)
    // ..lineTo(rect.right, rect.top)
    // ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // Keine benutzerdefinierte Zeichnung erforderlich
  }

  @override
  ShapeBorder scale(double t) {
    // TODO: implement scale
    throw UnimplementedError();
  }
}
