import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mobile_app/bloc/exam/bloc.dart';
import 'package:mobile_app/bloc/exam/provider.dart';
import 'package:mobile_app/bloc/exam/model.dart';
import 'package:mobile_app/utils/globals.dart';
import 'ExamInfoView.dart';

class ExamsCalendar extends StatefulWidget {
  const ExamsCalendar({Key? key, required this.cdl, required this.session})
      : super(key: key);
  final String cdl;
  final String session;

  @override
  State<ExamsCalendar> createState() => _ExamsCalendarState();
}

class _ExamsCalendarState extends State<ExamsCalendar> {
  @override
  Widget build(BuildContext context) {
    final ExamBloc _bloc = ExamBloc(ExamApiClient(
        // url: "$BASE_URL/api/data/${widget.cdl.toLowerCase()}/21-22/exam/${widget.session.toLowerCase()}"
        url:
            "$BASE_URL/api/data/${widget.cdl.toLowerCase()}/21-22/exam/${widget.session.toLowerCase()}"))
      ..add(LoadExamEvent());

    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => _bloc,
          child: BlocBuilder<ExamBloc, ExamState>(
            bloc: _bloc,
            builder: (context, state) {
              if (state is ExamLoadingState) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.green,
                ));
              } else if (state is ExamLoadedState) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                  child: EaxmView(exams: state.exams, session: widget.session),
                );
              }
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
                        onPressed: () => BlocProvider.of<ExamBloc>(context)
                            .add(LoadExamEvent()),
                        icon: const Icon(Icons.refresh, color: Colors.green)),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class EaxmView extends StatefulWidget {
  const EaxmView({Key? key, required this.exams, required this.session})
      : super(key: key);
  final List<Exam> exams;
  final String session;

  @override
  State<EaxmView> createState() => _EaxmViewState();
}

class _EaxmViewState extends State<EaxmView> {
  final List<String> _codes = <String>[];

  final List<bool> _isSelected = <bool>[true, false];
  String _currentCode = "";

  @override
  void initState() {
    final c = _getAllClassCodes(widget.exams);
    for (int i = 0; i < c.length; i++) {
      _codes.add(c[i]);
    }
    _currentCode = _codes[0];
    super.initState();
  }

  List<String> _getAllClassCodes(List<Exam> exams) {
    List<String> codes = <String>[];
    for (int i = 0; i < exams.length; i++) {
      if (!codes.contains(exams[i].code)) {
        codes.add(exams[i].code);
      }
    }
    return codes;
  }

  int _getCurrentCall() => _isSelected[0] ? 1 : 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text("Session ${widget.session}",
              style: const TextStyle(
                  fontFamily: "monospace",
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: AutoSizeText(
                  "Appello:",
                  style: TextStyle(fontFamily: "monospace"),
                  minFontSize: 20,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: ToggleButtons(
                children: [
                  Icon(
                      _isSelected[0]
                          ? Icons.looks_one
                          : Icons.looks_one_outlined,
                      color: Colors.green),
                  Icon(
                      _isSelected[1]
                          ? Icons.looks_two
                          : Icons.looks_two_outlined,
                      color: Colors.green),
                ],
                isSelected: _isSelected,
                onPressed: (int index) {
                  setState(() {
                    for (int buttonIndex = 0;
                        buttonIndex < _isSelected.length;
                        buttonIndex++) {
                      _isSelected[buttonIndex] = buttonIndex == index;
                    }
                  });
                },
              ),
            ),
            Expanded(
              flex: 4,
              child: DropdownButton<String>(
                  value: _currentCode,
                  onChanged: (code) {
                    setState(() {
                      _currentCode = code ?? _currentCode;
                    });
                  },
                  items: List<DropdownMenuItem<String>>.generate(_codes.length,
                      (index) {
                    return DropdownMenuItem<String>(
                      child: Text(_codes[index]),
                      value: _codes[index],
                    );
                  })),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(top: 30),
          child: ExamInfoView(widget.exams
              .where((element) =>
                  element.code == _currentCode &&
                  element.call == _getCurrentCall())
              .toList()),
        )
      ],
    );
  }
}



  // Widget _exam(List<Exam> exams) {
  //   final Exam e = exams[0];
  //   _codes = _getAllClassCodes(exams);
  //   _currentCode = _codes[0];

  //   return Container(
  //     child: Column(
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             const Padding(
  //               padding: EdgeInsets.only(right: 10.0),
  //               child: Text(
  //                 "Appello:",
  //                 style: TextStyle(fontFamily: "monospace", fontSize: 20),
  //               ),
  //             ),
  //             ToggleButtons(
  //               children: [
  //                 Icon( _isSelected[0] ? Icons.looks_one : Icons.looks_one_outlined, color: Colors.green),
  //                 Icon( _isSelected[1] ? Icons.looks_two : Icons.looks_two_outlined, color: Colors.green),
  //               ],
  //               isSelected: _isSelected,
  //               onPressed: (int index) {
  //                 setState(() {
  //                   for (int buttonIndex = 0; buttonIndex < _isSelected.length; buttonIndex++) {
  //                     _isSelected[buttonIndex] = buttonIndex == index;
  //                   }
  //                 });
  //               },
  //             )
  //           ],
  //         ),

  //         DropdownButton<String>(
  //           value: _currentCode,
  //           items: List<DropdownMenuItem<String>>.generate(_codes.length, (index) {
  //             return DropdownMenuItem<String>(child: Text(_codes[index]), value: _codes[index]);
  //           }),
  //           onChanged: (s) => setState(() {_currentCode = s!;}),
  //         ),

  //         Container(
  //           child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 children: [
  //                   Text("${e.type}", style: TextStyle(fontSize: 20)),
  //                   Text('\u2022 Codice: ${e.code}'),
  //                   Text('\u2022 Anno: ${e.year}°'),
  //                   Text('\u2022 Data: ${e.date}'),
  //                   Text('\u2022 Ora: ${e.hour}'),
  //                   Text('\u2022 Aula: ${e.room}'),
  //                 ],
  //               ),
  //         )
  //       ],
  //     ),
  //   );
  // }




