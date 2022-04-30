import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/bloc/calendar/bloc.dart';
import 'package:mobile_app/bloc/calendar/provider.dart';
import 'package:provider/provider.dart';

import 'package:mobile_app/models/Info.dart';

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
        final String cdl =
            "Calendario orari ${info.master ? 'Magistrale' : 'Triennale'}";

        return Column(
          children: [
            Center(
              child: Text(
                cdl,
                style: const TextStyle(fontSize: 30),
              ),
            ),
            info.master
                ? const CalendarWidget(cdl: 'magistrale')
                : const CalendarWidget(cdl: 'triennale')
          ],
        );
      },
    );
  }
}

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({ Key? key, required this.cdl }) : super(key: key);
  final String cdl;

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> with AutomaticKeepAliveClientMixin {
@override
  Widget build(BuildContext context) {
    super.build(context);

    final CalendarBloc _bloc = CalendarBloc(CalendarApiClient(
        url: "http://localhost:8080/api/data/${widget.cdl.toLowerCase()}/21-22/calendar/2"))
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
            return Container(
              padding: const EdgeInsets.all(4),
              child: Text(widget.cdl + ":" + state.calendar.data.toString()), // TODO ;)
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
                      icon: const Icon(Icons.refresh, color: Colors.green)),
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
}