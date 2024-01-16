import 'package:flutter/material.dart';

class SwitchScreenAnimation {
  // SlideTransition
  static Route createSlideRoute({required Widget page}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
    );
  }

// FadeTransition
  static Route createFadeRoute({required Widget page}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

// ScaleTransition with custom alignment
  static Route createScaleRoute({required Widget page}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          alignment: Alignment.topRight, // Setze die Ausrichtung auf oben rechts
          scale: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          )),
          child: child,
        );
      },
    );
  }

// ScaleTransition with custom alignment (rückwärts)
  static Route createReverseScaleRoute({required Widget page}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Container(), // Dummy-Seite
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          alignment: Alignment.topLeft, // Umgekehrte Richtung der Animation
          scale: Tween<double>(
            begin: 1.0,
            end: 0.0,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOutBack,
          )),
          child: child,
        );
      },
    );
  }

  // RotationTransition
  static Route createRotationRoute({required Widget page}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return RotationTransition(
          turns: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          )),
          child: child,
        );
      },
    );
  }

  // FlippingTransition
  static Route createFlipCardRoute({required Widget page}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget? child) {
            return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY((1 - animation.value) * -3.141592),
              child: child,
            );
          },
          child: page,
        );
      },
    );
  }
}
