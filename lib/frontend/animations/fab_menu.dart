import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_notez/backend/models/app_state.dart';
import 'package:project_notez/frontend/routes/app_router.dart';
import 'package:project_notez/logic/provider/app_state_provider.dart';

class FabMenu extends ConsumerStatefulWidget {
  const FabMenu({super.key});

  @override
  FabMenuState createState() => FabMenuState();
}

class FabMenuState extends ConsumerState<FabMenu> with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? degOneTranslationAnimation, degTwoTranslationAnimation, degThreeTranslationAnimation;
  Animation? rotationAnimation;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController!);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController!);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationController!);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(CurvedAnimation(parent: animationController!, curve: Curves.easeOut));
    super.initState();
    animationController!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    AppState appstate = ref.watch(appStateProvider);
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        IgnorePointer(
          child: Container(
            color: Colors.transparent,
            height: 150.0,
            width: 150.0,
          ),
        ),
        Transform.translate(
          offset: Offset.fromDirection(getRadiansFromDegree(270), degOneTranslationAnimation!.value * 100),
          child: Transform(
            transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation!.value))..scale(degOneTranslationAnimation!.value),
            alignment: Alignment.center,
            child: CircularButton(
              color: appstate.appTheme.fabMenuFirstSubButtonColor,
              width: 55,
              height: 55,
              icon: Icon(
                Icons.note_add,
                size: 32,
                color: appstate.appTheme.fabMenuIconColor,
              ),
              onClick: () {
                // animationController!.reverse();
                log('First Button');
                Navigator.pushNamed(context, '${Routes.note}');
                // ref.read(notesProvider.notifier).add(Note(
                //       title: 'Hallo Welt',
                //       description: 'Das ist eine Beschreibung',
                //     ));
              },
            ),
          ),
        ),
        Transform.translate(
          offset: Offset.fromDirection(getRadiansFromDegree(225), degTwoTranslationAnimation!.value * 100),
          child: Transform(
            transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation!.value))..scale(degTwoTranslationAnimation!.value),
            alignment: Alignment.center,
            child: CircularButton(
              color: appstate.appTheme.fabMenuSecondSubButtonColor,
              width: 55,
              height: 55,
              icon: Icon(
                Icons.checklist,
                size: 32,
                color: appstate.appTheme.fabMenuIconColor,
              ),
              onClick: () {
                animationController!.reverse();
                log('Second button');
              },
            ),
          ),
        ),
        Transform.translate(
          offset: Offset.fromDirection(getRadiansFromDegree(180), degThreeTranslationAnimation!.value * 100),
          child: Transform(
            transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation!.value))..scale(degThreeTranslationAnimation!.value),
            alignment: Alignment.center,
            child: CircularButton(
              color: appstate.appTheme.fabMenuThirdSubButtonColor,
              width: 55,
              height: 55,
              icon: Icon(
                Icons.person,
                size: 32,
                color: appstate.appTheme.fabMenuIconColor,
              ),
              onClick: () {
                animationController!.reverse();
                log('Third Button');
              },
            ),
          ),
        ),
        // Main Button
        Transform(
          transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation!.value)),
          alignment: Alignment.center,
          child: CircularButton(
            color: appstate.appTheme.fabMenuMainButtonColor,
            width: 60,
            height: 60,
            icon: Icon(
              Icons.add,
              size: 42,
              color: appstate.appTheme.fabMenuIconColor,
            ),
            onClick: () {
              if (animationController!.isCompleted) {
                animationController!.reverse();
              } else {
                animationController!.forward();
              }
            },
          ),
        )
      ],
    );
  }
}

// Customizable Circular Button
class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final Function onClick;

  const CircularButton({super.key, required this.color, required this.width, required this.height, required this.icon, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      width: width,
      height: height,
      child: IconButton(icon: icon, enableFeedback: true, onPressed: () => onClick()),
    );
  }
}
