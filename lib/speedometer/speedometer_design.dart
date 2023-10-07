import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_custom_painter_design/analog_clock/analog_clock_painter.dart';
import 'package:flutter_custom_painter_design/speedometer/speedometer_painter.dart';

class SpeedoMeterDesign extends StatefulWidget {
  const SpeedoMeterDesign({super.key});

  @override
  State<SpeedoMeterDesign> createState() => _SpeedoMeterDesignState();
}

class _SpeedoMeterDesignState extends State<SpeedoMeterDesign> {
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

  int countClicks = 0;

  void addOneInCountNumber() {
    if (countClicks >= 0 && countClicks < 13) {
      setState(() {
        countClicks = countClicks + 1;
      });
    } else {
      setState(() {
        countClicks = 12;
      });
    }
    print(countClicks);
  }

  void removeOneFromCountNumber() {
    if (countClicks >= 0 && countClicks < 13) {
      setState(() {
        countClicks = countClicks - 1;
      });
    } else {
      countClicks = 1;
    }
    print(countClicks);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    var clientHeight = screenHeight - kToolbarHeight;
    return Scaffold(
      appBar: AppBar(
        title: Text("Speedometer Design"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: screenWidth * 0.4,
              height: clientHeight * 0.7,
              // color: Colors.amber,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/images/bakar.jpg"),
                      fit: BoxFit.contain)),
              child: CustomPaint(
                painter: SpeedomterPainter(counterClick: countClicks),
              ),
            ),
            ButtonBar(
              children: [
                FloatingActionButton(
                  onPressed: addOneInCountNumber,
                  child: Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: removeOneFromCountNumber,
                  child: Icon(Icons.remove),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
