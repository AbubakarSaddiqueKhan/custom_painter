import 'dart:math';

import 'package:flutter/material.dart';

class SpeedomterPainter extends CustomPainter {
  final int counterClick;
  const SpeedomterPainter({required this.counterClick});

  static const List<String> speedList = [
    "60",
    "70",
    "80",
    "90",
    "100",
    "110",
    "120",
    "",
    "",
    "",
    "",
    "0",
    "10",
    "20",
    "30",
    "40",
    "50"
  ];
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final radius = min(width, height);
    const totalNumberOfTicks = 17;
    final centerOffset = Offset(width / 2, height / 2);
    final speedLineLength = radius * 0.45;
    const rotationAngle = 2 * pi / totalNumberOfTicks;
    final centerToSpeedMarkDistance = radius * 0.99;
    final speedMarkLength = radius * 0.03;

    Paint outerBorderpaint = Paint()
      // ..color = Colors.brown
      ..shader = LinearGradient(colors: [
        // Colors.white,
        Colors.blue,
        Colors.pink,
        Colors.amber,
        Colors.deepOrange,
        Colors.lime,
        Colors.brown,
        Colors.teal,
        Colors.blueGrey,
        // Colors.white
      ]).createShader(Rect.fromLTWH(0, 0, width, height))
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    Paint basePaint = Paint()
      // ..color = Colors.purple
      ..strokeWidth = 5
      ..shader = LinearGradient(colors: [
        Colors.blue,
        Colors.pink,
        Colors.amber,
        Colors.deepOrange,
        Colors.lime,
        Colors.brown,
        Colors.teal,
        Colors.blueGrey,
      ]).createShader(Rect.fromLTWH(0, 0, radius, radius))
      ..style = PaintingStyle.stroke;

    Paint speedLinePaint = Paint()
      ..color = Colors.brown.shade300
      // ..shader = LinearGradient(colors: [
      //   // Colors.white,
      //   Colors.blue,
      //   Colors.pink,
      //   Colors.amber,
      //   Colors.deepOrange,
      //   Colors.lime,
      //   Colors.brown,
      //   Colors.teal,
      //   Colors.blueGrey,
      //   // Colors.white
      // ]).createShader(Rect.fromLTWH(0, 0, width, height))
      ..strokeWidth = 5
      ..style = PaintingStyle.fill;

    Paint speedMarkPaint = Paint()
      // ..color = Colors.brown
      ..shader = RadialGradient(colors: [
        // Colors.white,
        Colors.blue,
        Colors.pink,
        Colors.amber,
        Colors.deepOrange,
        Colors.lime,
        Colors.brown,
        Colors.teal,
        Colors.blueGrey,
        // Colors.white
      ]).createShader(Rect.fromLTWH(0, 0, width, height))
      ..strokeWidth = 3
      ..style = PaintingStyle.fill;

    // canvas.drawArc(Rect.fromLTWH(0, 0, width, height), degreeToRadian(135),
    //     degreeToRadian(270), false, outerBorderpaint);

    // outer border paint
    canvas.drawArc(
        Rect.fromCenter(center: centerOffset, height: radius, width: radius),
        degreeToRadian(135),
        degreeToRadian(270),
        false,
        outerBorderpaint);
    // canvas.drawCircle(Offset(width / 2, height / 2), radius * 0.5, basePaint);
    // base paint
    canvas.drawCircle(centerOffset, radius * 0.02, basePaint);

    canvas.save();
    canvas.translate(centerOffset.dx, centerOffset.dy);
    for (var i = 0; i < totalNumberOfTicks; i++) {
      if (i <= 6) {
        TextPainter textPainter = TextPainter();
        textPainter.textDirection = TextDirection.ltr;
        textPainter.text = TextSpan(
            text: speedList[i],
            style: TextStyle(
                color: Colors.brown,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold));
        textPainter.layout();
        textPainter.paint(
            canvas, Offset(0, centerOffset.dy - centerToSpeedMarkDistance));
        // canvas.drawLine(
        //     Offset(0, centerOffset.dy - centerToSpeedMarkDistance),
        //     Offset(0,
        //         centerOffset.dy - centerToSpeedMarkDistance + speedMarkLength),
        //     speedMarkPaint);

        //  if (counterClick == 0) {
        //   if (i == 11) {
        //     Path linePath = Path();
        //     linePath.moveTo(0, -radius * 0.4);
        //     linePath.lineTo(-radius * 0.01, -radius * 0.35);
        //     linePath.lineTo(-radius * 0.005, 0);
        //     linePath.lineTo(radius * 0.005, 0);
        //     linePath.lineTo(radius * 0.01, -radius * 0.35);
        //     linePath.lineTo(0, -radius * 0.4);
        //     // linePath.moveTo(0, -height * 0.2);
        //     // linePath.lineTo(-width * 0.09, height * 0.05);
        //     // linePath.lineTo(-width * 0.095, height / 2);
        //     // linePath.lineTo(width * 0.05, height / 2);
        //     // linePath.lineTo(width * 0.051, height * 0.05);
        //     // linePath.lineTo(0, height * 0.9);

        //     canvas.drawPath(linePath, speedLinePaint);
        //   }
        // }

        if (counterClick == 6) {
          if (i == 0) {
            Path linePath = Path();
            linePath.moveTo(0, -radius * 0.4);
            linePath.lineTo(-radius * 0.01, -radius * 0.35);
            linePath.lineTo(-radius * 0.005, 0);
            linePath.lineTo(radius * 0.005, 0);
            linePath.lineTo(radius * 0.01, -radius * 0.35);
            linePath.lineTo(0, -radius * 0.4);
            // linePath.moveTo(0, -height * 0.2);
            // linePath.lineTo(-width * 0.09, height * 0.05);
            // linePath.lineTo(-width * 0.095, height / 2);
            // linePath.lineTo(width * 0.05, height / 2);
            // linePath.lineTo(width * 0.051, height * 0.05);
            // linePath.lineTo(0, height * 0.9);

            canvas.drawPath(linePath, speedLinePaint);
          }
        }

        if (counterClick == 7) {
          if (i == 1) {
            Path linePath = Path();
            linePath.moveTo(0, -radius * 0.4);
            linePath.lineTo(-radius * 0.01, -radius * 0.35);
            linePath.lineTo(-radius * 0.005, 0);
            linePath.lineTo(radius * 0.005, 0);
            linePath.lineTo(radius * 0.01, -radius * 0.35);
            linePath.lineTo(0, -radius * 0.4);
            // linePath.moveTo(0, -height * 0.2);
            // linePath.lineTo(-width * 0.09, height * 0.05);
            // linePath.lineTo(-width * 0.095, height / 2);
            // linePath.lineTo(width * 0.05, height / 2);
            // linePath.lineTo(width * 0.051, height * 0.05);
            // linePath.lineTo(0, height * 0.9);

            canvas.drawPath(linePath, speedLinePaint);
          }
        } else if (counterClick == 8) {
          if (i == 2) {
            Path linePath = Path();
            linePath.moveTo(0, -radius * 0.4);
            linePath.lineTo(-radius * 0.01, -radius * 0.35);
            linePath.lineTo(-radius * 0.005, 0);
            linePath.lineTo(radius * 0.005, 0);
            linePath.lineTo(radius * 0.01, -radius * 0.35);
            linePath.lineTo(0, -radius * 0.4);
            // linePath.moveTo(0, -height * 0.2);
            // linePath.lineTo(-width * 0.09, height * 0.05);
            // linePath.lineTo(-width * 0.095, height / 2);
            // linePath.lineTo(width * 0.05, height / 2);
            // linePath.lineTo(width * 0.051, height * 0.05);
            // linePath.lineTo(0, height * 0.9);

            canvas.drawPath(linePath, speedLinePaint);
          }
        } else if (counterClick == 9) {
          if (i == 3) {
            Path linePath = Path();
            linePath.moveTo(0, -radius * 0.4);
            linePath.lineTo(-radius * 0.01, -radius * 0.35);
            linePath.lineTo(-radius * 0.005, 0);
            linePath.lineTo(radius * 0.005, 0);
            linePath.lineTo(radius * 0.01, -radius * 0.35);
            linePath.lineTo(0, -radius * 0.4);
            // linePath.moveTo(0, -height * 0.2);
            // linePath.lineTo(-width * 0.09, height * 0.05);
            // linePath.lineTo(-width * 0.095, height / 2);
            // linePath.lineTo(width * 0.05, height / 2);
            // linePath.lineTo(width * 0.051, height * 0.05);
            // linePath.lineTo(0, height * 0.9);

            canvas.drawPath(linePath, speedLinePaint);
          }
        } else if (counterClick == 10) {
          if (i == 4) {
            Path linePath = Path();
            linePath.moveTo(0, -radius * 0.4);
            linePath.lineTo(-radius * 0.01, -radius * 0.35);
            linePath.lineTo(-radius * 0.005, 0);
            linePath.lineTo(radius * 0.005, 0);
            linePath.lineTo(radius * 0.01, -radius * 0.35);
            linePath.lineTo(0, -radius * 0.4);
            // linePath.moveTo(0, -height * 0.2);
            // linePath.lineTo(-width * 0.09, height * 0.05);
            // linePath.lineTo(-width * 0.095, height / 2);
            // linePath.lineTo(width * 0.05, height / 2);
            // linePath.lineTo(width * 0.051, height * 0.05);
            // linePath.lineTo(0, height * 0.9);

            canvas.drawPath(linePath, speedLinePaint);
          }
        } else if (counterClick == 11) {
          if (i == 5) {
            Path linePath = Path();
            linePath.moveTo(0, -radius * 0.4);
            linePath.lineTo(-radius * 0.01, -radius * 0.35);
            linePath.lineTo(-radius * 0.005, 0);
            linePath.lineTo(radius * 0.005, 0);
            linePath.lineTo(radius * 0.01, -radius * 0.35);
            linePath.lineTo(0, -radius * 0.4);
            // linePath.moveTo(0, -height * 0.2);
            // linePath.lineTo(-width * 0.09, height * 0.05);
            // linePath.lineTo(-width * 0.095, height / 2);
            // linePath.lineTo(width * 0.05, height / 2);
            // linePath.lineTo(width * 0.051, height * 0.05);
            // linePath.lineTo(0, height * 0.9);

            canvas.drawPath(linePath, speedLinePaint);
          }
        } else if (counterClick == 12) {
          if (i == 6) {
            Path linePath = Path();
            linePath.moveTo(0, -radius * 0.4);
            linePath.lineTo(-radius * 0.01, -radius * 0.35);
            linePath.lineTo(-radius * 0.005, 0);
            linePath.lineTo(radius * 0.005, 0);
            linePath.lineTo(radius * 0.01, -radius * 0.35);
            linePath.lineTo(0, -radius * 0.4);
            // linePath.moveTo(0, -height * 0.2);
            // linePath.lineTo(-width * 0.09, height * 0.05);
            // linePath.lineTo(-width * 0.095, height / 2);
            // linePath.lineTo(width * 0.05, height / 2);
            // linePath.lineTo(width * 0.051, height * 0.05);
            // linePath.lineTo(0, height * 0.9);

            canvas.drawPath(linePath, speedLinePaint);
          }
        }

        // if (i == 6) {
        //   Path linePath = Path();
        //   linePath.moveTo(0, -radius * 0.4);
        //   linePath.lineTo(-radius * 0.01, -radius * 0.35);
        //   linePath.lineTo(-radius * 0.005, 0);
        //   linePath.lineTo(radius * 0.005, 0);
        //   linePath.lineTo(radius * 0.01, -radius * 0.35);
        //   linePath.lineTo(0, -radius * 0.4);
        //   // linePath.moveTo(0, -height * 0.2);
        //   // linePath.lineTo(-width * 0.09, height * 0.05);
        //   // linePath.lineTo(-width * 0.095, height / 2);
        //   // linePath.lineTo(width * 0.05, height / 2);
        //   // linePath.lineTo(width * 0.051, height * 0.05);
        //   // linePath.lineTo(0, height * 0.9);

        //   canvas.drawPath(linePath, speedLinePaint);
        // }
      } else if (i >= 11) {
        if (counterClick == 0) {
          if (i == 11) {
            Path linePath = Path();
            linePath.moveTo(0, -radius * 0.4);
            linePath.lineTo(-radius * 0.01, -radius * 0.35);
            linePath.lineTo(-radius * 0.005, 0);
            linePath.lineTo(radius * 0.005, 0);
            linePath.lineTo(radius * 0.01, -radius * 0.35);
            linePath.lineTo(0, -radius * 0.4);
            // linePath.moveTo(0, -height * 0.2);
            // linePath.lineTo(-width * 0.09, height * 0.05);
            // linePath.lineTo(-width * 0.095, height / 2);
            // linePath.lineTo(width * 0.05, height / 2);
            // linePath.lineTo(width * 0.051, height * 0.05);
            // linePath.lineTo(0, height * 0.9);

            canvas.drawPath(linePath, speedLinePaint);
          }
        }

        if (counterClick == 1) {
          if (i == 12) {
            Path linePath = Path();
            linePath.moveTo(0, -radius * 0.4);
            linePath.lineTo(-radius * 0.01, -radius * 0.35);
            linePath.lineTo(-radius * 0.005, 0);
            linePath.lineTo(radius * 0.005, 0);
            linePath.lineTo(radius * 0.01, -radius * 0.35);
            linePath.lineTo(0, -radius * 0.4);
            // linePath.moveTo(0, -height * 0.2);
            // linePath.lineTo(-width * 0.09, height * 0.05);
            // linePath.lineTo(-width * 0.095, height / 2);
            // linePath.lineTo(width * 0.05, height / 2);
            // linePath.lineTo(width * 0.051, height * 0.05);
            // linePath.lineTo(0, height * 0.9);

            canvas.drawPath(linePath, speedLinePaint);
          }
        }

        if (counterClick == 2) {
          if (i == 13) {
            Path linePath = Path();
            linePath.moveTo(0, -radius * 0.4);
            linePath.lineTo(-radius * 0.01, -radius * 0.35);
            linePath.lineTo(-radius * 0.005, 0);
            linePath.lineTo(radius * 0.005, 0);
            linePath.lineTo(radius * 0.01, -radius * 0.35);
            linePath.lineTo(0, -radius * 0.4);
            // linePath.moveTo(0, -height * 0.2);
            // linePath.lineTo(-width * 0.09, height * 0.05);
            // linePath.lineTo(-width * 0.095, height / 2);
            // linePath.lineTo(width * 0.05, height / 2);
            // linePath.lineTo(width * 0.051, height * 0.05);
            // linePath.lineTo(0, height * 0.9);

            canvas.drawPath(linePath, speedLinePaint);
          }
        } else if (counterClick == 3) {
          if (i == 14) {
            Path linePath = Path();
            linePath.moveTo(0, -radius * 0.4);
            linePath.lineTo(-radius * 0.01, -radius * 0.35);
            linePath.lineTo(-radius * 0.005, 0);
            linePath.lineTo(radius * 0.005, 0);
            linePath.lineTo(radius * 0.01, -radius * 0.35);
            linePath.lineTo(0, -radius * 0.4);
            // linePath.moveTo(0, -height * 0.2);
            // linePath.lineTo(-width * 0.09, height * 0.05);
            // linePath.lineTo(-width * 0.095, height / 2);
            // linePath.lineTo(width * 0.05, height / 2);
            // linePath.lineTo(width * 0.051, height * 0.05);
            // linePath.lineTo(0, height * 0.9);

            canvas.drawPath(linePath, speedLinePaint);
          }
        }

        if (counterClick == 4) {
          if (i == 15) {
            Path linePath = Path();
            linePath.moveTo(0, -radius * 0.4);
            linePath.lineTo(-radius * 0.01, -radius * 0.35);
            linePath.lineTo(-radius * 0.005, 0);
            linePath.lineTo(radius * 0.005, 0);
            linePath.lineTo(radius * 0.01, -radius * 0.35);
            linePath.lineTo(0, -radius * 0.4);
            // linePath.moveTo(0, -height * 0.2);
            // linePath.lineTo(-width * 0.09, height * 0.05);
            // linePath.lineTo(-width * 0.095, height / 2);
            // linePath.lineTo(width * 0.05, height / 2);
            // linePath.lineTo(width * 0.051, height * 0.05);
            // linePath.lineTo(0, height * 0.9);

            canvas.drawPath(linePath, speedLinePaint);
          }
        } else if (counterClick == 5) {
          if (i == 16) {
            Path linePath = Path();
            linePath.moveTo(0, -radius * 0.4);
            linePath.lineTo(-radius * 0.01, -radius * 0.35);
            linePath.lineTo(-radius * 0.005, 0);
            linePath.lineTo(radius * 0.005, 0);
            linePath.lineTo(radius * 0.01, -radius * 0.35);
            linePath.lineTo(0, -radius * 0.4);
            // linePath.moveTo(0, -height * 0.2);
            // linePath.lineTo(-width * 0.09, height * 0.05);
            // linePath.lineTo(-width * 0.095, height / 2);
            // linePath.lineTo(width * 0.05, height / 2);
            // linePath.lineTo(width * 0.051, height * 0.05);
            // linePath.lineTo(0, height * 0.9);

            canvas.drawPath(linePath, speedLinePaint);
          }
        }
        // else if (i == 12) {
        //   Path linePath = Path();
        //   linePath.moveTo(0, -radius * 0.4);
        //   linePath.lineTo(-radius * 0.01, -radius * 0.35);
        //   linePath.lineTo(-radius * 0.005, 0);
        //   linePath.lineTo(radius * 0.005, 0);
        //   linePath.lineTo(radius * 0.01, -radius * 0.35);
        //   linePath.lineTo(0, -radius * 0.4);
        //   // linePath.moveTo(0, -height * 0.2);
        //   // linePath.lineTo(-width * 0.09, height * 0.05);
        //   // linePath.lineTo(-width * 0.095, height / 2);
        //   // linePath.lineTo(width * 0.05, height / 2);
        //   // linePath.lineTo(width * 0.051, height * 0.05);
        //   // linePath.lineTo(0, height * 0.9);

        //   canvas.drawPath(linePath, speedLinePaint);
        // } else if (i == 13) {
        //   Path linePath = Path();
        //   linePath.moveTo(0, -radius * 0.4);
        //   linePath.lineTo(-radius * 0.01, -radius * 0.35);
        //   linePath.lineTo(-radius * 0.005, 0);
        //   linePath.lineTo(radius * 0.005, 0);
        //   linePath.lineTo(radius * 0.01, -radius * 0.35);
        //   linePath.lineTo(0, -radius * 0.4);
        //   // linePath.moveTo(0, -height * 0.2);
        //   // linePath.lineTo(-width * 0.09, height * 0.05);
        //   // linePath.lineTo(-width * 0.095, height / 2);
        //   // linePath.lineTo(width * 0.05, height / 2);
        //   // linePath.lineTo(width * 0.051, height * 0.05);
        //   // linePath.lineTo(0, height * 0.9);

        //   canvas.drawPath(linePath, speedLinePaint);
        // } else if (i == 14) {
        //   Path linePath = Path();
        //   linePath.moveTo(0, -radius * 0.4);
        //   linePath.lineTo(-radius * 0.01, -radius * 0.35);
        //   linePath.lineTo(-radius * 0.005, 0);
        //   linePath.lineTo(radius * 0.005, 0);
        //   linePath.lineTo(radius * 0.01, -radius * 0.35);
        //   linePath.lineTo(0, -radius * 0.4);
        //   // linePath.moveTo(0, -height * 0.2);
        //   // linePath.lineTo(-width * 0.09, height * 0.05);
        //   // linePath.lineTo(-width * 0.095, height / 2);
        //   // linePath.lineTo(width * 0.05, height / 2);
        //   // linePath.lineTo(width * 0.051, height * 0.05);
        //   // linePath.lineTo(0, height * 0.9);

        //   canvas.drawPath(linePath, speedLinePaint);
        // }
        // Path linePath = Path();
        // linePath.moveTo(width / 2, height * 0.02);
        // linePath.lineTo(width * 0.49, height * 0.05);
        // linePath.lineTo(width * 0.495, height / 2);
        // linePath.lineTo(width * 0.505, height / 2);
        // linePath.lineTo(width * 0.51, height * 0.05);
        // linePath.lineTo(width / 2, height * 0.02);

        // canvas.drawPath(linePath, speedLinePaint);

        TextPainter textPainter = TextPainter();
        textPainter.textDirection = TextDirection.ltr;
        textPainter.text = TextSpan(
            text: speedList[i],
            style: TextStyle(
                color: Colors.brown,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold));
        textPainter.layout();
        textPainter.paint(
            canvas, Offset(0, centerOffset.dy - centerToSpeedMarkDistance));

        // canvas.drawLine(
        //     Offset(0, centerOffset.dy - centerToSpeedMarkDistance),
        //     Offset(0,
        //         centerOffset.dy - centerToSpeedMarkDistance + speedMarkLength),
        //     speedMarkPaint);
      }
      canvas.rotate(rotationAngle);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(SpeedomterPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(SpeedomterPainter oldDelegate) => true;
}

double degreeToRadian(double degree) {
  return pi / 180 * degree;
}
