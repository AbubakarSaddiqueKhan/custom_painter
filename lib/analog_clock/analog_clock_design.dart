import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_custom_painter_design/analog_clock/analog_clock_painter.dart';

class AnalogClockDesign extends StatefulWidget {
  const AnalogClockDesign({super.key});

  @override
  State<AnalogClockDesign> createState() => _AnalogClockDesignState();
}

class _AnalogClockDesignState extends State<AnalogClockDesign> {
  DateTime currentDateAndTime = DateTime.now();
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        currentDateAndTime = DateTime.now();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    var clientHeight = screenHeight - kToolbarHeight;
    return Scaffold(
      appBar: AppBar(
        title: Text("Analog Clock Design"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: screenWidth * 0.8,
              height: clientHeight * 0.55,
              // color: Colors.amber,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/images/bakar.jpg"),
                      fit: BoxFit.contain)),
              child: CustomPaint(
                painter: AnalogClockPainter(currentTime: currentDateAndTime),
              ),
            )
          ],
        ),
      ),
    );
  }
}
