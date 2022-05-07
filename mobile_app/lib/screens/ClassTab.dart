import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mobile_app/models/Info.dart';
import 'package:mobile_app/utils/TypeWriter.dart';
import 'package:mobile_app/widgets/ClassGrid.dart';

class ClassTab extends StatefulWidget {
  const ClassTab({Key? key}) : super(key: key);

  @override
  State<ClassTab> createState() => _ClassTab();
}

class _ClassTab extends State<ClassTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 28),
            child: Center(
              child: typeWrite("> Corsi offerti", 24),
            ),
          ),
          Flexible(
            child: Provider.of<CourseInfo>(context).master
                ? const ClassGrid(cdl: 'magistrale')
                : const ClassGrid(cdl: 'triennale'),
          )
        ],
      ),
    ));
  }
}
