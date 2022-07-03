import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mobile_app/models/Info.dart';
import 'package:mobile_app/utils/TypeWriter.dart';
import 'package:mobile_app/widgets/ExamsCalendar.dart';
import 'package:mobile_app/utils/globals.dart';

class ExamTab extends StatefulWidget {
  const ExamTab({Key? key}) : super(key: key);

  @override
  State<ExamTab> createState() => _ExamTabState();
}

class _ExamTabState extends State<ExamTab> {
  @override
  Widget build(BuildContext context) {

    final ButtonStyle _btnStyle = ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(60),
      elevation: 12,
      primary: Colors.green[800],
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: "monospace"
      )
    );

    final String _cdl = Provider.of<CourseInfo>(context).master ? MAGISTRALE : TRIENNALE;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 28),
              child: Center(
                child: typeWrite("> Calendario esami", 21),
              ),
            ),
            Expanded(
              child: FractionallySizedBox(
                widthFactor: 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: _btnStyle,
                      onPressed: () => _onButtonPressed(_cdl, "invernale"),
                      child: const Text("Invernale")
                    ),
                    ElevatedButton(
                      style: _btnStyle,
                      onPressed: () => _onButtonPressed(_cdl, "estiva anticipata"),
                      child: const Text("Estiva anticipata")
                    ),
                    ElevatedButton(
                      style: _btnStyle,
                      onPressed: () => _onButtonPressed(_cdl, "estiva"),
                      child: const Text("Estiva")
                    ),
                    ElevatedButton(
                      style: _btnStyle,
                      onPressed: () => _onButtonPressed(_cdl, "autunnale"),
                      child: const Text("Autunnale")
                    ),
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onButtonPressed(String cdl, String session) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ExamsCalendar(cdl: cdl, session: session)
      )
    );
  }
}