import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class BasicCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final centerOffset = Offset(width / 2, height / 2);
    final radius = min(width, height) / 2;

    // Path path = Path();
    // path.moveTo(width / 2, 0);
    // path.lineTo(0, height);
    // path.lineTo(width, height);
    // path.lineTo(width / 2, 0);
    // According to the official documentation
    // A description of the style to use when drawing on a [Canvas].
    //  to access the properties of the properties of the paint class you can use the three dot or also know as the case cade operator the terminator is added at the most right side or at the end when you set all of the properties you want's to add based on your requirements

    Paint paint = Paint()
      // ..color = Colors.purple
      // You can create shader using different type of the gradient color
      // Shader is used to add a shade that can be created using a list of colors
      // ..shader = RadialGradient(colors: [
      //   Colors.black,
      //   Colors.orange,
      //   Colors.amber,
      //   Colors.pink,
      //   Colors.purple,
      //   Colors.teal,
      //   Colors.brown
      // ]).createShader(Rect.fromLTWH(0, 0, width, height))
      ..shader = LinearGradient(colors: [
        Colors.black,
        Colors.orange,
        Colors.amber,
        Colors.pink,
        Colors.purple,
        Colors.teal,
        Colors.brown
      ]).createShader(Rect.fromLTWH(0, 0, width, height))

      // ..shader = SweepGradient(colors: [
      //   Colors.black,
      //   Colors.orange,
      //   Colors.amber,
      //   Colors.pink,
      //   Colors.purple,
      //   Colors.teal,
      //   Colors.brown
      // ], startAngle: 1)
      //     .createShader(Rect.fromLTWH(0, 0, width, height))
      ..strokeWidth = 10

      // Blend mode property is used to set the blend mode property
      //  Blend mode enum is used to set the property of teh blend mode
      // Fore more information about the blend mode kindly visit the official documentation or you can also read it from my article
      // ..blendMode = BlendMode.difference
      // The color filter  is used to apply the filter on the color or the paint
      // According to the official documentation
      // A color filter to apply when a shape is drawn or when a layer is composited.
      // A color filter to apply when a shape is drawn or when a layer is composited.
      // ..colorFilter = ColorFilter.mode(Colors.blue, BlendMode.colorDodge)
      // filter quality property is used to set the quality of the image
      // Filter Quality class is used to set the quality of the image
      // According to the official documentation
      // Quality levels for image sampling in [ImageFilter] and [Shader] objects that sample images and for [Canvas] operations that render images.
      // When scaling up typically the quality is lowest at [none], higher at [low] and [medium], and for very large scale factors (over 10x) the highest at [high].
      // When scaling down, [medium] provides the best quality especially when scaling an image to less than half its size or for animating the scale factor between such reductions. Otherwise, [low] and [high] provide similar effects for reductions of between 50% and 100% but the image may lose detail and have dropouts below 50%.
      // To get high quality when scaling images up and down, or when the scale is unknown, [medium] is typically a good balanced choice.
      // ..filterQuality = FilterQuality.high;
      // Image filter is used the filter on the image or background
      // There are different types of filter that you can use based on your condition you must have to try all of them
      // ..imageFilter =
      //     ImageFilter.blur(sigmaX: 1, sigmaY: 2, tileMode: TileMode.mirror)

      // ImageFilter.compose(
      //     outer: ImageFilter.blur(
      //         sigmaX: 2, sigmaY: 1, tileMode: TileMode.decal),
      //     inner: ImageFilter.blur(
      //         sigmaX: 3, sigmaY: 4, tileMode: TileMode.repeated));

      // ImageFilter.dilate(radiusX: 20, radiusY: 30);
      // ImageFilter.erode(radiusX: 40,radiusY: 50);
      // The invert color property is used to set whether the color are inverted or not
      // According to the official documentation
      // Whether the colors of the image are inverted when drawn.
      // Inverting the colors of an image applies a new color filter that will be composed with any user provided color filters. This is primarily used for implementing smart invert on iOS.
      // ..invertColors = true
      // isAntiAlias property is used whether it is anti alias or not
      // Whether to apply anti-aliasing to lines and images drawn on the canvas.
      // Defaults to true.
      // ..isAntiAlias = false
      // Mask filter property is used to add the blur effect on the paint
      // According to the official documentation
      // A mask filter (for example, a blur) to apply to a shape after it has been drawn but before it has been composited into the image.
      // ..maskFilter = MaskFilter.blur(BlurStyle.outer, 4)
      // The stroke cap property is used to set the shape of the ending point of the line
      // The stroke cap enum is used to set the stroke cap property of the paint class
      // There are the following three constant values of the Stroke Cap enum
      // i ) Butt
      // According to the official documentation
      // Begin and end contours with a flat edge and no extension.
      // It will completely fit in the size and don't try to extend from it
      // ..strokeCap = StrokeCap.butt
      // ii ) round
      // The ending point or the joints becomes rounded
      // According to the official documentation
      // Begin and end contours with a semi-circle extension.
      // ..strokeCap = StrokeCap.round
      // iii ) Square
      // Begin and end contours with a half square extension. This is similar to extending each contour by half the stroke width (as given by [Paint.strokeWidth]).
      // Same as the butt but it will extend from the size of the original widget
      // ..strokeCap = StrokeCap.square
      // The stroke join property is used to set the joint's of where two lines meets or the corner or the shape
      // Stroke join enum is used to set the and have the following three constant values
      // i ) bevel
      // It will simple join's the two lines and make it as a simple rectangular shape like the edge of rectangle
      // According to the official documentation
      // Joins between line segments connect the corners of the butt ends of the line segments to give a beveled appearance.
      // ..strokeJoin = StrokeJoin.bevel
      // ii ) Miter
      // It will join the corner's like shape but when it joint it will extend's it's cap like a pin or cone
      // According to the official documentation
      // Joins between line segments form sharp corners.
      // ..strokeJoin = StrokeJoin.miter
      // iii ) Round
      // round is used to make the joining point rounded
      // According to the official documentation
      // Joins between line segments are semi-circular.
      // ..strokeJoin = StrokeJoin.round

      // The stroke miter length is used to set the length of the joining of the lines when the stroke joining miter type is used
      // ..strokeMiterLimit = 20
      // The stroke length property is used to set the widget of the stroke or the width of the line or the width of border's of the rectangle
      // ..strokeWidth = 5;
      // The style property is used to set the painting style whether the painting is filled or only border (stroke)
      // The painting style property is used to set the painting style
      // The default painting style is stroke
      // According to the official documentation
      // Apply the [Paint] to the inside of the shape. For example, when applied to the [Canvas.drawCircle] call, this results in a disc of the given size being painted.
      // ..style = PaintingStyle.fill;
      // According to the official documentation
      // Apply the [Paint] to the edge of the shape. For example, when applied to the [Canvas.drawCircle] call, this results is a hoop of the given size being painted. The line drawn on the edge will be the width given by the [Paint.strokeWidth] property.
      ..style = PaintingStyle.stroke;

    // That's all for the paint class now have  to move toward's the canvas class and see it's properties in detail

    // draw line is used to draw the line
    // canvas.drawLine(Offset(0, 0), Offset(width, height), paint);

    // draw arc is used to draw an arc
    // canvas.drawArc(Rect.fromLTWH(0, 0, width, height), degToRadian(135),
    //     degToRadian(270), true, paint);

    // draw circle is used to draw ghe circle
    // canvas.drawCircle(centerOffset, radius, paint);

    // draw an oval is used to draw an oval
    // canvas.drawOval(Rect.fromLTWH(width * 0.1, 0, width * 0.9, height), paint);

    // path is used to draw the shape based on your custom path
    // Path path = Path();
    // path.moveTo(width / 2, 0);
    // path.lineTo(0, height);
    // path.lineTo(width, height);
    // path.lineTo(width / 2, 0);
    // canvas.drawPath(path, paint);

    // draw point is used to draw a sequence of points
    // canvas.drawPoints(
    //     PointMode.points,
    //     [
    //       Offset(width / 2, 0),
    //       Offset(0, height / 2),
    //       Offset(width / 2, height),
    //       Offset(width, height / 2),
    //       Offset(width / 2, 0)
    //     ],
    //     paint);

    // draw RRect is used to draw the rounded rectangle
    // canvas.drawRRect(
    //     RRect.fromLTRBR(0, 0, width, height, Radius.circular(30)), paint);

    // draw rect is used to draw a rectangle
    // canvas.drawRect(
    //     Rect.fromLTWH(width * 0.1, height * 0.1, width * 0.8, height * 0.8),
    //     paint);

    // draw color is used to draw the color on the canvas and here you can also  add the blend mode
    // canvas.drawColor(Colors.pink, BlendMode.colorBurn);

    //  The draw paint method is used to draw the paint on that widget
    // canvas.drawPaint(paint);

    // draw shadow property is used to set the shadow
    // To set the shadow property you have to give the path the color of the shadow and it's elevation or transparentOccluder
    // The transparentOccluder argument should be true if the occluding object is not opaque.
    // canvas.drawShadow(path, Colors.black, 12, true);

// The draw vertices property is used to set the shapes based on the given vertices
    // canvas.drawVertices(
    //     Vertices(VertexMode.triangles,
    //         [Offset(width / 2, 0), Offset(0, height), Offset(width, height)]),
    //     BlendMode.clear,
    //     paint);

    // According to the official documentation
    // Returns the conservative bounds of the combined result of all clip methods executed within the current save stack of this [Canvas] object, as measured in the destination coordinate space in which the [Picture] will be rendered.

    // print(canvas.getDestinationClipBounds());

    // Returns the conservative bounds of the combined result of all clip methods executed within the current save stack of this [Canvas] object, as measured in the local coordinate space under which rendering operations are currently performed.
    // print(canvas.getLocalClipBounds());

    // Returns the number of items on the save stack, including the initial state. This means it returns 1 for a clean canvas, and that each call to [save] and [saveLayer] increments it, and that each matching call to [restore] decrements it.
    // This number cannot go below 1.
    // print(canvas.getSaveCount());
    // Returns the current transform including the combined result of all transform methods executed since the creation of this [Canvas] object, and respecting the save/restore history.
    // Methods that can change the current transform include [translate], [scale], [rotate], [skew], and [transform]. The [restore] method can also modify the current transform by restoring it to the same value it had before its associated [save] or [saveLayer] call.
    // print(canvas.getTransform());

    // Restore will restore the previous layer of the canvas
    // According to the official documentation
    // Pops the current save stack, if there is anything to pop. Otherwise, does nothing.
    // Use [save] and [saveLayer] to push state onto the stack.
    // If the state was pushed with [saveLayer], then this call will also cause the new layer to be composited into the previous layer.
    // canvas.restore();

    // restore to count works same as the simple restore but instead of moving to previous and last one it will move back by skipping given number of index
    // canvas.restoreToCount(2);

    // rotate property is used to rotate the canvas in clockwise direction upto the given radian's
    // canvas.rotate(degToRadian(20));
    // save method is used to save the canvas
    // According to the official documentation
    // Saves a copy of the current transform and clip on the save stack.
    // Call [restore] to pop the save stack.
    // canvas.save();
    // [saveLayer], which does the same thing but additionally also groups the commands done until the matching [restore].
    // According to the official documentation
    // Saves a copy of the current transform and clip on the save stack, and then creates a new group which subsequent calls will become a part of. When the save stack is later popped, the group will be flattened into a layer and have the given paint's [Paint.colorFilter] and [Paint.blendMode] applied.
    // canvas.saveLayer(Rect.fromLTWH(0, 0, width, height), paint);

    // this method is used to draw the paint on the canvas or to draw the text on the canvas

    //

    // final textStyle = TextStyle(
    //     color: Colors.brown, fontSize: 20, fontStyle: FontStyle.italic);
    // final textSpan = TextSpan(
    //   text: "Abubakar Saddique".toString(),
    //   style: textStyle,
    // );
    // final textPainter = TextPainter(
    //   text: textSpan,
    //   textDirection: TextDirection.ltr,
    // );
    // textPainter.layout(
    //   minWidth: 0,
    //   maxWidth: size.width,
    // );
    // final offset = Offset(50, 100);
    // textPainter.paint(canvas, offset);

    //
    // canvas.translate(width /2 , height / 2);
  }

  @override
  bool shouldRepaint(BasicCustomPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BasicCustomPainter oldDelegate) => false;
}

double degToRadian(double degree) {
  return pi / 180 * degree;
}
