import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mobile_app/models/Info.dart';
import 'package:mobile_app/utils/TypeWriter.dart';
import 'package:mobile_app/widgets/TeacherTable.dart';

class ListTeacherTab extends StatefulWidget {
  const ListTeacherTab({Key? key}) : super(key: key);

  @override
  State<ListTeacherTab> createState() => _ListTeacherTabState();
}

class _ListTeacherTabState extends State<ListTeacherTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 28),
            child: Center(
              child: typeWrite("> Lista docenti ",
                  24), // non capisco perche' non fa il rebuild.
            ),
          ),
          Flexible(
            child: Provider.of<CourseInfo>(context).master
                ? const TeacherTable(cdl: 'magistrale')
                : const TeacherTable(cdl: 'triennale'),
          )
        ],
      ),
    ));
  }
}
