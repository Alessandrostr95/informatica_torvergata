import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mobile_app/models/Info.dart';

class ListTeacherTab extends StatelessWidget {
  const ListTeacherTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CourseInfo>(
      builder: (context, info, child) {
        return Center(
          child: Text(
            "Docenti della ${info.master ? 'Magistrale' : 'Triennale'}",
            style: const TextStyle(fontSize: 30),
          ),
        );
      },
    );
  }
}
