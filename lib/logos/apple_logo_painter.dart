import 'dart:math';

import 'package:flutter/material.dart';

class AppleLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final radius = min(width, height) / 2;
    final centerOffset = Offset(width / 2, height / 2);

    Paint appleLogoPaint = Paint()..color = Colors.purple.withOpacity(0.8);

    // draw apple leaf
    Path appleLeafPath = Path();
    appleLeafPath.moveTo(radius * 1.54, radius * 0.125);
    appleLeafPath.quadraticBezierTo(
        radius * 1.13, radius * 0.19, radius * 1.13, radius * 0.54);
    appleLeafPath.quadraticBezierTo(
        radius * 1.537, radius * 0.487, radius * 1.54, radius * 0.125);
    canvas.drawPath(appleLeafPath, appleLogoPaint);

    // draw apple bottom

    // Path appleBottomPath = Path();
    // appleBottomPath.moveTo(radius * 1.135, radius * 0.63);
    // appleBottomPath.conicTo(
    //     -radius * 0.13, radius * 0.18, radius * 0.6, radius * 1.6, 0.8);
    // appleBottomPath.cubicTo(-radius * 0.22, radius * 0.2, radius * 0.7,
    //     radius * 1.6, radius * 1.135, radius * 2);
    // canvas.drawPath(appleBottomPath, appleLogoPaint);

    canvas.drawCircle(
        Offset(radius * 0.6, radius * 0.4), radius * 0.3, appleLogoPaint);
  }

  @override
  bool shouldRepaint(AppleLogoPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(AppleLogoPainter oldDelegate) => true;
}



// -radius * 0.22, radius * 0.2, radius * 1.135, radius * 2