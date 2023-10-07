import 'dart:math';

import 'package:flutter/material.dart';

class FloatingBoatPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final radius = min(width, height) / 2;
    final boatOuterBorderDifference = radius * 2;
    final centerOffset = Offset(width / 2, height / 2);

    Paint boatOuterBorderPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4
      ..shader = LinearGradient(colors: [
        Colors.brown.shade100,
        Colors.brown.shade200,
        Colors.brown.shade300
      ]).createShader(Rect.fromLTWH(0, 0, width, height))
      ..style = PaintingStyle.fill;

    Path boatOuterBorderPath = Path();
    boatOuterBorderPath.quadraticBezierTo(
        radius * 0.1, radius * 0.5, radius * 0.3, radius);
    boatOuterBorderPath.quadraticBezierTo(
        radius * 1.6, radius * 1.3, radius * 3, radius);

    boatOuterBorderPath.quadraticBezierTo(
        radius * 3.2, radius * 0.5, radius * 3.3, 0);

    // boatOuterBorderPath.cubicTo(
    //     radius * 0.1, radius * 0.8, radius * 1.9, radius * 0.8, radius * 2, 0);

    boatOuterBorderPath.lineTo(0, 0);
    // boatOuterBorderPath.lineTo(
    //     centerOffset.dx - boatOuterBorderDifference, centerOffset.dy + radius);
    // boatOuterBorderPath.lineTo(centerOffset.dx + boatOuterBorderDifference * 1,
    //     centerOffset.dy + radius);
    // boatOuterBorderPath.lineTo(width, 0);
    // boatOuterBorderPath.lineTo(0, 0);
    canvas.drawPath(boatOuterBorderPath, boatOuterBorderPaint);
  }

  @override
  bool shouldRepaint(FloatingBoatPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(FloatingBoatPainter oldDelegate) => false;
}

class FloatingWaterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final radius = min(width, height) / 2;

    Paint waterWavePaint = Paint()..color = Colors.blue.shade300;

    Path waterWavesPath = Path();
    // waterWavesPath.quadraticBezierTo(radius * 0.5, radius * 0.8, radius, 0);

    waterWavesPath.moveTo(0, 0);
    waterWavesPath.quadraticBezierTo(
        radius * 1.5, radius * -0.8, radius * 3, 0);

    waterWavesPath.moveTo(radius * 4, 0);
    waterWavesPath.quadraticBezierTo(
        radius * 5.5, radius * -0.8, radius * 8, 0);

    waterWavesPath.moveTo(radius * 10, 0);
    waterWavesPath.quadraticBezierTo(
        radius * 11.5, radius * -0.8, radius * 13, 0);

    waterWavesPath.moveTo(radius * 14, 0);
    waterWavesPath.quadraticBezierTo(
        radius * 15.5, radius * -0.8, radius * 18, 0);

    canvas.drawPath(waterWavesPath, waterWavePaint);
  }

  @override
  bool shouldRepaint(FloatingWaterPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(FloatingWaterPainter oldDelegate) => false;
}
