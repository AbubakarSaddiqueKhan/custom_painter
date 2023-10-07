import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_custom_painter_design/analog_clock/analog_clock_painter.dart';
import 'package:flutter_custom_painter_design/logos/apple_logo_painter.dart';
import 'package:flutter_custom_painter_design/my_clock_article/my_clock_painter.dart';

class AppleLogoDesign extends StatefulWidget {
  const AppleLogoDesign({super.key});

  @override
  State<AppleLogoDesign> createState() => _AppleLogoDesignState();
}

class _AppleLogoDesignState extends State<AppleLogoDesign> {
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
        title: Text("Apple Logo Design"),
        centerTitle: true,
      ),
      body: Stack(children: [
        Positioned(
          top: clientHeight * 0.15,
          left: screenWidth * 0.3,
          child: Container(
            width: screenWidth * 0.39,
            height: clientHeight * 0.7,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/images/apple_logo.png"),
                    fit: BoxFit.fill)),
          ),
        ),
        Positioned(
          top: clientHeight * 0.15,
          left: screenWidth * 0.3,
          child: Container(
            width: screenWidth * 0.39,
            height: clientHeight * 0.7,
            // color: Colors.amber,

            child: CustomPaint(
              painter: AppleLogoPainter(),
            ),
          ),
        ),
      ]),
    );
  }
}
