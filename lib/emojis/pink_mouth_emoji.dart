import 'dart:math';

import 'package:flutter/material.dart';

class PinkMouthEmojiPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // size
    final width = size.width;
    final height = size.height;

    // radius
    final outerBorderRadius = min(width, height) / 2;
    final innerFaceRadius = outerBorderRadius * 0.985;
    final eyeballRadius = outerBorderRadius * 0.1;
    final eyeInnerBallRadius = eyeballRadius * 0.45;

    // Eye Ball Offset difference
    final horizontalEyeDifference = outerBorderRadius * 0.4;
    final verticalEyeDifference = outerBorderRadius * 0.35;

    final horizontalInnerEyeDifference = outerBorderRadius * 0.385;
    final verticalInnerEyeDifference = outerBorderRadius * 0.33;

    final mouthVerticalDifference = outerBorderRadius * 0.2;
    final mouthHorizontalDifference = outerBorderRadius * 0.4;

    // offsets
    final centerOffset = Offset(width / 2, height / 2);
    final leftEyeBallOffset = Offset(centerOffset.dx - horizontalEyeDifference,
        centerOffset.dy - verticalEyeDifference);
    final rightEyeBallOffset = Offset(centerOffset.dx + horizontalEyeDifference,
        centerOffset.dy - verticalEyeDifference);

    final leftEyeInnerBallOffset = Offset(
        centerOffset.dx - horizontalInnerEyeDifference,
        centerOffset.dy - verticalInnerEyeDifference);
    final rightEyeInnerBallOffset = Offset(
        centerOffset.dx + horizontalInnerEyeDifference,
        centerOffset.dy - verticalInnerEyeDifference);

    final moutVerticalOffset =
        Offset(centerOffset.dx, centerOffset.dy + mouthVerticalDifference);

    // border paint

    Paint emojiBorderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = outerBorderRadius * 0.06;

    // inner Color Paint
    Paint innerFacePaint = Paint()..color = Colors.lime.shade400;

    // eyesPaint
    final eyeBallPaint = Paint()..color = Colors.black;

    // eye inner ball radius
    final eyeInnerBallPaint = Paint()..color = Colors.white;

    // mouth outer border
    Paint mouthOuterBorderPaint = Paint()
          ..color = Colors.black
          ..strokeWidth = outerBorderRadius * 0.05
        // ..style = PaintingStyle.stroke
        ;

    Paint mouthInnerToungeBorderPaint = Paint()
          ..color = Colors.pink.shade300
          ..strokeWidth = outerBorderRadius * 0.05
        // ..style = PaintingStyle.stroke
        ;

    // draw outer border

    canvas.drawCircle(centerOffset, outerBorderRadius, emojiBorderPaint);

    // draw inner face

    canvas.drawCircle(centerOffset, innerFaceRadius, innerFacePaint);

    // draw left eye
    canvas.drawCircle(leftEyeBallOffset, eyeballRadius, eyeBallPaint);

    // draw right eye
    canvas.drawCircle(rightEyeBallOffset, eyeballRadius, eyeBallPaint);

    // draw left inner eye ball
    canvas.drawCircle(
        leftEyeInnerBallOffset, eyeInnerBallRadius, eyeInnerBallPaint);

    // draw right eye
    canvas.drawCircle(
        rightEyeInnerBallOffset, eyeInnerBallRadius, eyeInnerBallPaint);

    // mouth path
    Path mouthPath = Path();
    // mouthPath.moveTo(width * 0.25, height * 0.58);
    // mouthPath.cubicTo(width * 0.4, height * 0.85, width * 0.6, height * 0.85,
    //     width * 0.75, height * 0.58);

    mouthPath.moveTo(
        centerOffset.dx - mouthHorizontalDifference - outerBorderRadius * 0.025,
        moutVerticalOffset.dy * 0.98);
    mouthPath.cubicTo(
        centerOffset.dx - mouthHorizontalDifference * 0.6,
        moutVerticalOffset.dy * 1.34,
        centerOffset.dx + mouthHorizontalDifference * 0.6,
        moutVerticalOffset.dy * 1.34,
        centerOffset.dx + mouthHorizontalDifference + outerBorderRadius * 0.02,
        moutVerticalOffset.dy * 0.985);

    // draw outer mouth border
    canvas.drawPath(mouthPath, mouthOuterBorderPaint);

    // Inner Mouth
    // mouth path
    Path innerMouthPath = Path();

    innerMouthPath.moveTo(
        centerOffset.dx - mouthHorizontalDifference, moutVerticalOffset.dy);
    innerMouthPath.cubicTo(
        centerOffset.dx - mouthHorizontalDifference * 0.5,
        moutVerticalOffset.dy * 1.3,
        centerOffset.dx + mouthHorizontalDifference * 0.5,
        moutVerticalOffset.dy * 1.3,
        centerOffset.dx + mouthHorizontalDifference,
        moutVerticalOffset.dy);

    // draw outer mouth border
    canvas.drawPath(innerMouthPath, mouthInnerToungeBorderPaint);
  }

  @override
  bool shouldRepaint(PinkMouthEmojiPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(PinkMouthEmojiPainter oldDelegate) => true;
}
