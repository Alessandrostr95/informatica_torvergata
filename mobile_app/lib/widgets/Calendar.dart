import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:time_planner/time_planner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';

import 'package:mobile_app/bloc/calendar/bloc.dart';
import 'package:mobile_app/bloc/calendar/provider.dart';
import 'package:mobile_app/utils/globals.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key, required this.cdl, required this.years})
      : super(key: key);
  final String cdl;
  final int years;

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final CalendarBloc _bloc = CalendarBloc(CalendarApiClient(
        url:
            "$BASE_URL/api/data/${widget.cdl.toLowerCase()}/21-22/calendar/${SEMESTER.toString()}"))
      ..add(LoadCalendarEvent());

    return BlocProvider(
      create: (context) => _bloc,
      child: BlocBuilder<CalendarBloc, CalendarState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is CalendarLoadingState) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.green,
            ));
          } else if (state is CalendarLoadedState) {
            // return Container(
            //   padding: const EdgeInsets.all(4),
            //   child: Text(widget.cdl + ":" + state.calendar.data.toString()),
            // );
            return DefaultTabController(
              length: widget.years,
              child: Scaffold(
                appBar: AppBar(
                  // title: Text("Orari ${widget.cdl}"),
                  automaticallyImplyLeading: false,
                  flexibleSpace: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TabBar(
                        tabs: List.generate(
                          widget.years,
                          (index) => Tab(text: "${index + 1}° anno"),
                        ).toList(),
                      )
                    ],
                  ),
                ),
                body: TabBarView(
                    children: List.generate(widget.years, (index) {
                  final data = state.calendar.data;
                  final nthYearCalendar = data
                      .where((element) => element["coures_year"] == index + 1)
                      .toList();
                  final tasks = nthYearCalendar
                      .map((element) => _toTask(element))
                      .toList();
                  return Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: _getTimePlanner(tasks),
                  );
                }).toList()),
              ),
            );
          } else if (state is CalendarErrorState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Ops! Something went wrong... :(",
                    style: TextStyle(
                      fontFamily: "monospace",
                      color: Colors.green,
                    ),
                  ),
                  IconButton(
                    onPressed: () => BlocProvider.of<CalendarBloc>(context)
                        .add(LoadCalendarEvent()),
                    icon: const Icon(Icons.refresh, color: Colors.green),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  /// Given
  TimePlanner _getTimePlanner(List<TimePlannerTask> tasks) {
    return TimePlanner(
      startHour: 9,
      endHour: 18,
      currentTimeAnimation: false,
      headers: const [
        TimePlannerTitle(
          title: "Lunedì",
        ),
        TimePlannerTitle(
          title: "Martedì",
        ),
        TimePlannerTitle(
          title: "Mercoledì",
        ),
        TimePlannerTitle(
          title: "Giovedì",
        ),
        TimePlannerTitle(
          title: "Venerdì",
        ),
      ],
      tasks: tasks,
      style: TimePlannerStyle(
        dividerColor: Colors.green[800],
        showScrollBar: true,
        cellWidth: 130,
      ),
    );
  }

  /// Given a calendar record, returns a relative TimePlannerTask widget
  TimePlannerTask _toTask(Map item) {
    final startTime = (item["start_time"] as String)
        .split(":")
        .map((e) => int.parse(e))
        .toList();
    final endTime = (item["end_time"] as String)
        .split(":")
        .map((e) => int.parse(e))
        .toList();
    final int duration = (endTime[0] - startTime[0]) * 60;

    return TimePlannerTask(
      dateTime: TimePlannerDateTime(
          day: item["day"] as int, hour: startTime[0], minutes: startTime[1]),
      minutesDuration: duration,
      color: Colors.green[800],
      child: Padding(
        padding: const EdgeInsets.all(8),
        // child: Text(
        //   item["name"],
        //   style: const TextStyle(
        //     color: Colors.white,
        //     fontWeight: FontWeight.bold,
        //     fontSize: 10,
        //   ),
        //   softWrap: true,
        //   textAlign: TextAlign.center,
        // ),
        child: AutoSizeText(
          item["name"],
          wrapWords: false,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      onTap: () => showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: "label",
        pageBuilder: (context, anim1, anim2) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AlertDialog(
              title: Text(
                item["name"],
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('\u2022 Codice: ${item["code"]}'),
                    Text('\u2022 Inizio lezione: ${item["start_time"]}'),
                    Text('\u2022 Fine lezione: ${item["end_time"]}'),
                    Text('\u2022 Aula: ${item["room"]}'),
                    Text('\u2022 Edificio: ${item["building"]}'),
                  ],
                ),
              ),
            ),
          );
        },
        transitionBuilder: (context, anim1, anim2, child) {
          return CircularRevealAnimation(
              child: child,
              animation: anim1,
              centerAlignment: Alignment.center);
        },
      ),
    );
  }
}
