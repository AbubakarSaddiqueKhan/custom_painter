import 'package:flutter/material.dart';
import 'package:flutter_custom_painter_design/boat_floating_painter.dart';

class FloatingBoatDesign extends StatefulWidget {
  const FloatingBoatDesign({super.key});

  @override
  State<FloatingBoatDesign> createState() => _FloatingBoatDesignState();
}

class _FloatingBoatDesignState extends State<FloatingBoatDesign> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    var clientHeight = screenHeight - kToolbarHeight;
    return Scaffold(
        appBar: AppBar(
          title: Text("Floating Boat Design"),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: screenWidth,
                height: clientHeight * 0.4,
                color: Colors.blue.shade200,
                child: CustomPaint(
                  painter: FloatingWaterPainter(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: screenWidth * 0.8,
                height: clientHeight * 0.6,
                // color: Colors.amber,
                child: CustomPaint(
                  painter: FloatingBoatPainter(),
                ),
              ),
            )
          ],
        ));
  }
}
