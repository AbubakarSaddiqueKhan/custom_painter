import 'package:flutter/material.dart';
import 'package:flutter_custom_painter_design/custom_painter_design.dart';

class CustomPainterScreenDesign extends StatefulWidget {
  const CustomPainterScreenDesign({super.key});

  @override
  State<CustomPainterScreenDesign> createState() =>
      _CustomPainterScreenDesignState();
}

class _CustomPainterScreenDesignState extends State<CustomPainterScreenDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Painter"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  // color: Colors.amber.shade200,
                  // image: DecorationImage(
                  //     image: NetworkImage(
                  //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIfWEXbpXO5OCnTu06ycd96UlHV6DuP-xLiA&usqp=CAU",
                  //     ),
                  //     fit: BoxFit.fill)
                  ),
              child: CustomPaint(
                painter: BasicCustomPainter(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
