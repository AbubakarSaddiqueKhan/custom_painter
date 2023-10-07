import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ParticleSystemPainter extends CustomPainter {
  Random random = Random();

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final radius = min(width, height);
    // final centerOffset = Offset(width / 2, height / 2);
    final sunOffset = Offset(radius * 0.05, radius * 0.95);
    final mercuryOffset = Offset(radius * 0.3, radius * 0.6);
    final venusOffset = Offset(radius * 0.82, radius * 0.85);
    final earthOffset = Offset(radius * 0.88, radius * 0.5);

    Paint arcPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    for (var i = 0; i < 250; i++) {
      double randomHorizontalValue = random.nextInt(width.toInt()).toDouble();
      double randomVerticalValue = random.nextInt(height.toInt()).toDouble();
      final randomOffset = Offset(randomHorizontalValue, randomVerticalValue);
      final randomRadius = random.nextInt((radius * 0.005).toInt()).toDouble();
      final randomColor = Color.fromARGB(random.nextInt(0xFF),
          random.nextInt(0xFF), random.nextInt(0xFF), random.nextInt(0xFF));
      Paint randomPaint = Paint()..color = randomColor;
      // Path startPath = Path();
      // startPath.moveTo(width / 2, 0);
      // startPath.quadraticBezierTo(width * 0.4, height * 0.25, 0, height / 2);
      // startPath.quadraticBezierTo(
      //     width * 0.4, height * 0.75, width / 2, height);
      // startPath.quadraticBezierTo(
      //     width * 0.6, height * 0.75, width, height / 2);
      // startPath.quadraticBezierTo(width * 0.6, height * 0.25, width / 2, 0);
      // canvas.drawPath(startPath, randomPaint);
      canvas.drawCircle(randomOffset, randomRadius, randomPaint);
    }

    Paint sunPaint = Paint()
      ..shader = RadialGradient(colors: [
        Colors.orange.shade100,
        Colors.orange.shade200,
        Colors.orange.shade300,
        Colors.orange.shade400,
        Colors.orangeAccent.shade100,
        Colors.orangeAccent.shade200,
        Colors.orangeAccent.shade400,
        Colors.deepOrange.shade100,
        Colors.deepOrange.shade200,
        Colors.deepOrange.shade300,
        Colors.deepOrange.shade400,
        Colors.deepOrangeAccent.shade100,
        Colors.deepOrangeAccent.shade200,
        Colors.deepOrangeAccent.shade400,
        Colors.amber.shade700,
        Colors.amber.shade900,
      ]).createShader(Rect.fromLTWH(0, 0, width, height));
    // Paint moonPaint = Paint()
    //   ..shader = RadialGradient(colors: [
    //     Colors.white70,
    //     Colors.white60,
    //     Colors.white54,
    //     Colors.white38,
    //     Colors.white70,
    //     Colors.white60,
    //     Colors.white54,
    //     Colors.white38,
    //     Colors.white70,
    //     Colors.white60,
    //     Colors.white54,
    //     Colors.white38,
    //     Colors.white70,
    //     Colors.white60,
    //     Colors.white54,
    //     Colors.white38,
    //   ]).createShader(Rect.fromLTWH(0, 0, width, height));

    // draw sun
    canvas.drawCircle(sunOffset, radius * 0.2, sunPaint);

    // mercury line

    canvas.drawArc(Rect.fromLTWH(-radius * 0.4, radius * 0.55, radius, radius),
        degToradian(250), degToradian(150), false, arcPaint);

    Paint mercuryPaint = Paint()
      ..shader = RadialGradient(colors: [
        Colors.grey.shade100,
        Colors.grey.shade200,
        Colors.grey.shade300,
        Colors.grey.shade400,
        Colors.blueGrey.shade100,
        Colors.blueGrey.shade200,
        Colors.blueGrey.shade400,
        Colors.blueGrey.shade100,
        Colors.blueGrey.shade200,
        Colors.grey.shade100,
        Colors.grey.shade200,
        Colors.grey.shade300,
        Colors.grey.shade400,
        Colors.blueGrey.shade100,
        Colors.blueGrey.shade200,
        Colors.blueGrey.shade400,
        Colors.blueGrey.shade100,
        Colors.blueGrey.shade200,
      ]).createShader(Rect.fromLTWH(0, 0, width, height));

    // draw circle

    canvas.drawCircle(mercuryOffset, radius * 0.06, mercuryPaint);

    // draw venus

    // mercury line

    canvas.drawArc(
        Rect.fromLTWH(
            -radius * 0.63, radius * 0.37, radius * 1.5, radius * 1.5),
        degToradian(250),
        degToradian(150),
        false,
        arcPaint);

    Paint venusPaint = Paint()
      ..shader = RadialGradient(colors: [
        Colors.orange.shade100,
        Colors.orange.shade200,
        Colors.orange.shade300,
        Colors.orange.shade400,
        Colors.grey.shade100,
        Colors.grey.shade200,
        Colors.grey.shade300,
        Colors.grey.shade400,
        Colors.deepOrange.shade300,
        Colors.deepOrange.shade400,
        Colors.deepOrangeAccent.shade100,
        Colors.deepOrangeAccent.shade200,
        Colors.blueGrey.shade100,
        Colors.blueGrey.shade200,
        Colors.blueGrey.shade400,
        Colors.blueGrey.shade100,
        Colors.blueGrey.shade200,

        Colors.grey.shade100,
        Colors.orangeAccent.shade100,
        Colors.orangeAccent.shade200,
        Colors.orangeAccent.shade400,
        Colors.deepOrange.shade100,
        Colors.deepOrange.shade200,
        Colors.blueGrey.shade100,
        Colors.blueGrey.shade200,
        Colors.blueGrey.shade400,
        Colors.deepOrangeAccent.shade400,
        Colors.amber.shade700,
        Colors.amber.shade900,
        Colors.grey.shade200,
        Colors.grey.shade300,
        Colors.grey.shade400,
        Colors.blueGrey.shade100,
        Colors.orange.shade100,
        Colors.orange.shade200,
        Colors.orange.shade300,
        Colors.orange.shade400,
        Colors.grey.shade100,
        Colors.grey.shade200,
        Colors.grey.shade300,
        Colors.blueGrey.shade200,
        Colors.grey.shade100,
        Colors.grey.shade200,
        Colors.grey.shade300,
        Colors.grey.shade400,
        // Colors.blueGrey.shade100,
        // Colors.blueGrey.shade200,
        // Colors.blueGrey.shade400,
        // Colors.blueGrey.shade100,
        // Colors.blueGrey.shade200,
        // Colors.grey.shade100,
        // Colors.grey.shade200,
        // Colors.grey.shade300,
        // Colors.grey.shade400,
        // Colors.blueGrey.shade100,
        // Colors.blueGrey.shade200,
        Colors.blueGrey.shade400,
        Colors.blueGrey.shade100,
        Colors.blueGrey.shade200,
      ]).createShader(Rect.fromLTWH(0, 0, width, height));

    // draw circle

    canvas.drawCircle(venusOffset, radius * 0.06, venusPaint);

    // draw earth
    // mercury line

    canvas.drawArc(
        Rect.fromLTWH(-radius * 0.78, radius * 0.2, radius * 1.9, radius * 1.9),
        degToradian(250),
        degToradian(150),
        false,
        arcPaint);

    Paint earthPaint = Paint()
      ..shader = RadialGradient(colors: [
        Colors.green,
        Colors.orange,
        Colors.green,
        Colors.blueGrey,
        Colors.green,
        Colors.grey,
        Colors.green,
        Colors.blueGrey
      ]).createShader(Rect.fromLTWH(0, 0, width, height));

    // draw circle

    canvas.drawCircle(earthOffset, radius * 0.06, earthPaint);
  }

  @override
  bool shouldRepaint(ParticleSystemPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(ParticleSystemPainter oldDelegate) => true;
}

double degToradian(double degree) {
  return pi / 180 * degree;
}
