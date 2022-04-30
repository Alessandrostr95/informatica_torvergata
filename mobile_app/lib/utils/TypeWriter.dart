import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

Widget typeWrite(String text) {
  TextStyle textStyle = const TextStyle(
    fontSize: 18,
    fontFamily: "monospace",
    color: Colors.black
  );

  return SizedBox(
    width: 250,
    height: 50,
    child: DefaultTextStyle(
      style: textStyle,
      child: AnimatedTextKit(
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