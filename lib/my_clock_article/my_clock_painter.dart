import 'dart:math';

import 'package:flutter/material.dart';

class MyClockPainter extends CustomPainter {
  final DateTime currentTime;
  const MyClockPainter({required this.currentTime});
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final radius = min(width, height) / 2;
    final centerOffset = Offset(width / 2, height / 2);
    const totalNumberOfTicks = 60;
    final borderToLineGap = radius * 0.01;
    final minutesLineLength = radius * 0.02;
    final minutesNeedleLength = radius;

    const rotatedAngle = 2 * pi / totalNumberOfTicks;

    // Outer border paint
    Paint outerBorderPaint = Paint()
      ..color = Colors.blueGrey.shade400
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    // draw circle ( outer border )
    canvas.drawCircle(centerOffset, radius, outerBorderPaint);

    // inner base paint
    Paint innerBasePaint = Paint()..color = Colors.purple.shade400;

    //  inner base paint
    canvas.drawCircle(centerOffset, radius * 0.04, innerBasePaint);

    Paint minutesTicksPaint = Paint()..color = Colors.brown;
    Paint hourTicksPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    Paint minutesNeedlePaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 5;

    Paint hoursNeedlePaint = Paint()
      ..color = Colors.lightGreen
      ..strokeWidth = 5;

    Paint secondsNeedlePaint = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 5;
    // draw the tick's
    canvas.save();
    canvas.translate(centerOffset.dx, centerOffset.dy);

    for (var i = 0; i < totalNumberOfTicks; i++) {
      bool isHour = i % 5 == 0;
      var hour =
          currentTime.hour < 12 ? currentTime.hour : currentTime.hour - 12;

      if (i / 5 == hour) {
        // draw the hours
        Path linePath = Path();
        linePath.moveTo(0, -radius * 0.7);
        linePath.lineTo(-radius * 0.013, -radius * 0.65);
        linePath.lineTo(-radius * 0.01, 0);
        linePath.lineTo(radius * 0.01, 0);
        linePath.lineTo(radius * 0.013, -radius * 0.65);
        linePath.lineTo(0, -radius * 0.7);

        canvas.drawPath(linePath, hoursNeedlePaint);
      }
      if (i == currentTime.minute) {
        Path linePath = Path();
        linePath.moveTo(0, -radius * 0.87);
        linePath.lineTo(-radius * 0.017, -radius * 0.8);
        linePath.lineTo(-radius * 0.01, 0);
        linePath.lineTo(radius * 0.01, 0);
        linePath.lineTo(radius * 0.017, -radius * 0.8);
        linePath.lineTo(0, -radius * 0.87);

        canvas.drawPath(linePath, minutesNeedlePaint);
      }
      if (i == currentTime.second) {
        // draw the seconds

        Path linePath = Path();
        linePath.moveTo(0, -radius * 0.95);
        linePath.lineTo(-radius * 0.013, -radius * 0.9);
        linePath.lineTo(-radius * 0.01, 0);
        linePath.lineTo(radius * 0.01, 0);
        linePath.lineTo(radius * 0.013, -radius * 0.9);
        linePath.lineTo(0, -radius * 0.95);

        canvas.drawPath(linePath, secondsNeedlePaint);
      }
      if (isHour) {
        canvas.drawLine(
            Offset(0, -radius + 10), Offset(0, -radius + 30), hourTicksPaint);
      } else {
        canvas.drawLine(Offset(0, -radius + 10), Offset(0, -radius + 25),
            minutesTicksPaint);
      }
      if (i == 0) {}

      canvas.rotate(rotatedAngle);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(MyClockPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(MyClockPainter oldDelegate) => true;
}
