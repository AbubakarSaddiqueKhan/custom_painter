import 'dart:math';

import 'package:flutter/material.dart';

class AnalogClockPainter extends CustomPainter {
  final DateTime currentTime;
  final hourTickColor;
  final minutesTickColor;
  final hourNeedleColor;
  final minutesNeedleColor;
  final baseColor;

  AnalogClockPainter(
      {required this.currentTime,
      this.hourTickColor = Colors.brown,
      this.minutesTickColor = Colors.green,
      this.hourNeedleColor = Colors.blueGrey,
      this.minutesNeedleColor = Colors.grey,
      this.baseColor = Colors.indigo});

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    final radius = min(width, height) / 2;
    final hoursTickWidth = radius * 0.03;
    final hoursTickLength = radius * 0.08;
    final minutesTickWidth = radius * 0.015;
    final minutesTickLength = radius * 0.05;
    final hourNeedleWidth = radius * 0.04;
    final minutesNeedleWidth = radius * 0.02;
    final secondsNeedleWidth = radius * 0.01;
    final hourNeedleLength = radius * 0.7;
    final minutesNeedleLength = radius * 0.8;
    final secondNeedleLength = radius * 0.9;
    // final hoursNeedleDistanceFromBorder = radius * 0.2;

    final hoursTickBase = radius * 0.02;
    const totalNumberOfTicks = 60;
    const calculatedAngleForRotation = (2 * pi) / totalNumberOfTicks;
    final centerOffset = Offset(width / 2, height / 2);

    final hoursTickPaint = Paint()
      ..color = Colors.brown
      ..strokeWidth = hoursTickWidth
      ..style = PaintingStyle.stroke;

    final minutesTickPaint = Paint()
      ..color = Colors.green
      ..strokeWidth = minutesTickWidth
      ..style = PaintingStyle.stroke;

    final hoursNeedlePaint = Paint()
      ..color = Colors.amber
      ..strokeWidth = hourNeedleWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final minutesNeedlePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = minutesNeedleWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final secondsNeedlePaint = Paint()
      ..color = Colors.purple
      ..strokeWidth = secondsNeedleWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Saves a copy of the current transform and clip on the save stack.
    canvas.save();
    // Add a translation to the current transform, shifting the coordinate space horizontally by the first argument and vertically by the second argument.
    canvas.translate(centerOffset.dx, radius);

    for (var i = 0; i < 60; i++) {
      bool isHour = i % 5 == 0;

      var hour =
          currentTime.hour < 12 ? currentTime.hour : currentTime.hour - 12;

      if (i == currentTime.minute) {
        canvas.drawLine(Offset(0, -hoursTickBase),
            Offset(0, -minutesNeedleLength), minutesNeedlePaint);
      }
      if (i / 5 == hour) {
        canvas.drawLine(Offset(0, -hoursTickBase), Offset(0, -hourNeedleLength),
            hoursNeedlePaint);
      }

      if (i == currentTime.second) {
        canvas.drawLine(Offset(0, -hoursTickBase),
            Offset(0, -secondNeedleLength), secondsNeedlePaint);
      }

      if (isHour) {
        canvas.drawLine(Offset(0, -radius),
            Offset(0, -radius + hoursTickLength), hoursTickPaint);
      } else {
        canvas.drawLine(Offset(0, -radius),
            Offset(0, -radius + minutesTickLength), minutesTickPaint);
      }

      // canvas.drawLine(
      //     Offset(0, radius), Offset(0, hourNeedleLength), hoursTickPaint);

      // Add a rotation to the current transform. The argument is in radians clockwise.
      canvas.rotate(calculatedAngleForRotation);
    }

    canvas.restore();
    // draw hour needle base
    canvas.drawCircle(centerOffset, hoursTickBase, hoursTickPaint);
  }

  @override
  bool shouldRepaint(AnalogClockPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(AnalogClockPainter oldDelegate) => true;
}
