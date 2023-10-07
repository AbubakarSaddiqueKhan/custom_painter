import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_custom_painter_design/particle_system/particle_system_painter.dart';

class ParticleSystemDesign extends StatefulWidget {
  const ParticleSystemDesign({super.key});

  @override
  State<ParticleSystemDesign> createState() => _ParticleSystemDesignState();
}

class _ParticleSystemDesignState extends State<ParticleSystemDesign> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 400), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    var clientHeight = screenHeight - kToolbarHeight;
    return Scaffold(
      appBar: AppBar(
        title: Text("Particle System Design"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: screenWidth,
          height: clientHeight,
          color: Colors.black,
          child: CustomPaint(
            painter: ParticleSystemPainter(),
          ),
        ),
      ),
    );
  }
}
