import 'package:flutter/material.dart';
import 'package:flutter_custom_painter_design/emojis/pink_mouth_emoji.dart';

class EmojiPainterDesign extends StatefulWidget {
  const EmojiPainterDesign({super.key});

  @override
  State<EmojiPainterDesign> createState() => _EmojiPainterDesignState();
}

class _EmojiPainterDesignState extends State<EmojiPainterDesign> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    var clientHeight = screenHeight - kToolbarHeight;
    return Scaffold(
      appBar: AppBar(
        title: Text("Emoji Painter"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: screenWidth * 0.4,
              height: clientHeight * 0.3,
              child: CustomPaint(
                painter: PinkMouthEmojiPainter(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
