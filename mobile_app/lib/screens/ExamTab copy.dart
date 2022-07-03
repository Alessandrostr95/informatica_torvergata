import 'package:flutter/material.dart';

class ExamsTab extends StatelessWidget {
  const ExamsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          "Coming soon...",
          textScaleFactor: 2,
          style: TextStyle(fontFamily: "monospace", fontWeight: FontWeight.bold),
        ),
        SizedBox.square(
          dimension: MediaQuery.of(context).size.width * 0.5,
          child: Image.asset(
            "assets/images/coding.png",
            fit: BoxFit.fill,
          ),
        )
      ],
    ));
  }
}
