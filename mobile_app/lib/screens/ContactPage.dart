import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);
  static String PAGE_ROUTE = "/contact";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
            const Text(
              "Coming soon...",
              textScaleFactor: 2,
              style:
                  TextStyle(fontFamily: "monospace", fontWeight: FontWeight.bold),
            ),
            SizedBox.square(
              dimension: MediaQuery.of(context).size.width * 0.5,
              child: Image.asset(
                "assets/images/coding.png",
                fit: BoxFit.fill,
              ),
            )
                ],
              ),
          ),
        ));
  }
}
