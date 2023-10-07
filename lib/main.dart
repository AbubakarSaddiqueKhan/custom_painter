import 'package:flutter/material.dart';
import 'package:flutter_custom_painter_design/analog_clock/analog_clock_design.dart';
import 'package:flutter_custom_painter_design/custom_painter_page_design.dart';
import 'package:flutter_custom_painter_design/emojis/emoji_painter_design.dart';
import 'package:flutter_custom_painter_design/floating_boat_design.dart';
import 'package:flutter_custom_painter_design/logos/apple_logo_design.dart';
import 'package:flutter_custom_painter_design/my_clock_article/my_clock_design.dart';
import 'package:flutter_custom_painter_design/particle_system/paricle_system_design.dart';
import 'package:flutter_custom_painter_design/speedometer/speedometer_design.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyClockDesign();
  }
}
