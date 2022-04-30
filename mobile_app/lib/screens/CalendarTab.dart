import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mobile_app/models/Info.dart';
import 'package:mobile_app/widgets/Calendar.dart';

class CalendarTab extends StatefulWidget {
  const CalendarTab({Key? key}) : super(key: key);

  @override
  State<CalendarTab> createState() => _CalendarTabState();
}

class _CalendarTabState extends State<CalendarTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CourseInfo>(
      builder: (context, info, child) {
        return info.master
            ? const CalendarWidget(cdl: 'magistrale', years: 2)
            : const CalendarWidget(cdl: 'triennale', years: 3);
      },
    );
  }
}