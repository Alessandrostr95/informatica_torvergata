import 'package:flutter/material.dart';

import 'package:sliding_switch/sliding_switch.dart';
import 'package:provider/provider.dart';

import 'package:mobile_app/models/Info.dart';

class CourseSwitcher extends StatelessWidget {
  const CourseSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CourseInfo>(
      builder: (context, info, child) {
        return SlidingSwitch(
          value: info.master ? true : false,
          width: 200,
          height: 50,
          onChanged: (value) {
            info.set(value);
          },
          onTap: () {},
          onDoubleTap: () {},
          onSwipe: () {},
          animationDuration: const Duration(milliseconds: 300),
          textOff: "Triennale",
          textOn: "Magistrale",
          colorOn: Colors.white,
          colorOff: Colors.white,
          background: const Color(0xffe4e5eb),
          buttonColor: Colors.green[800]!,
          inactiveColor: Colors.green[800]!,
        );
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   print(Provider.of<CourseInfo>(context).master);

  //   return SlidingSwitch(
  //     value: Provider.of<CourseInfo>(context).master ? true : false,
  //     width: 200,
  //     height: 50,

  //     onChanged: (value) {
  //       Provider.of<CourseInfo>(context).set(value);
  //     },
  //     onTap: () {},
  //     onDoubleTap: () {},
  //     onSwipe: () {},

  //     animationDuration: const Duration(milliseconds: 300),

  //     textOff: "Triennale",
  //     textOn: "Magistrale",

  //     colorOn: Colors.white,
  //     colorOff: Colors.white,
  //     background: const Color(0xffe4e5eb),
  //     buttonColor: Colors.green[800]!,
  //     inactiveColor: Colors.green[800]!,
  //   );
  // }
}
