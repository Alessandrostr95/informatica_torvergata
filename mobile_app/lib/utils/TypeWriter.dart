import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

Widget typeWrite(String text, [double fontSize = 18]) {
  TextStyle textStyle = TextStyle(
    fontSize: fontSize,
    fontFamily: "monospace",
    color: Colors.black
  );

  return SizedBox(
    width: 250,
    height: 50,
    child: DefaultTextStyle(
      style: textStyle,
      child: AnimatedTextKit(
        totalRepeatCount: 1,
        repeatForever: false,
        onTap: () {},
        animatedTexts: [
          TypewriterAnimatedText(
            text,
            cursor: "|",
            speed: const Duration(milliseconds: 75),
          )
        ]
      ),
    ),
  );
}