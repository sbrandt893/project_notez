import 'package:flutter/material.dart';

class MyShapeBorderZ extends ShapeBorder {
  const MyShapeBorderZ();

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..moveTo(rect.right, rect.bottom - 5)
      ..lineTo(rect.right, rect.bottom)
      ..lineTo(rect.left, rect.bottom)
      ..lineTo(rect.left, rect.top)
      ..lineTo(rect.right, rect.top)
      ..lineTo(rect.right, rect.bottom - 10)
      ..lineTo(rect.left + 37, rect.bottom - 10)
      ..lineTo(rect.left + 85, rect.top + 15)
      ..lineTo(rect.left + 85, rect.top + 10)
      ..lineTo(rect.left + 15, rect.top + 10)
      ..lineTo(rect.left + 15, rect.top + 15)
      ..lineTo(rect.left + 72, rect.top + 15)
      ..lineTo(rect.left + 15, rect.bottom - 10)
      ..lineTo(rect.left + 15, rect.bottom - 5)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // Keine benutzerdefinierte Zeichnung erforderlich
  }

  @override
  ShapeBorder scale(double t) {
    return const MyShapeBorderZ();
  }
}
