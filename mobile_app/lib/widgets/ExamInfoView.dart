import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import 'package:mobile_app/bloc/exam/model.dart';

class ExamInfoView extends StatelessWidget {
  const ExamInfoView(this.exams, {Key? key}) : super(key: key);
  final List<Exam> exams;

  String _formatDateFromString(String stringDate) {
    try {
      DateTime date = DateTime.parse(stringDate);
      final formatter = DateFormat("dd/MM/yyyy");
      return formatter.format(date);
    } catch (e) {
      return "-";
    }
  }

  @override
  Widget build(BuildContext context) {
    Exam? _scritto;
    try {
      _scritto = exams.firstWhere((element) => element.type == "scritto");
    } catch (e) {
      _scritto = null;
    }

    Exam? _orale;
    try {
      _orale = exams.firstWhere((element) => element.type == "orale");
    } catch (e) {
      _orale = null;
    }

    return Column(
      children: [
        _scritto != null
            ? Column(
                children: [
                  const Text("Scritto",
                      style: TextStyle(
                          fontFamily: "monospace",
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                  const Divider(),
                  _infoRow(icon: Icons.class_, field: _scritto.name),
                  const Divider(),
                  _infoRow(
                      icon: Icons.calendar_today,
                      field: _formatDateFromString(_scritto.date)),
                  const Divider(),
                  _infoRow(icon: Icons.query_builder, field: _scritto.hour),
                  const Divider(),
                  _infoRow(icon: Icons.place, field: _scritto.room),
                ],
              )
            : const Center(),
        const SizedBox(width: 50),
        _orale != null
            ? Column(
                children: [
                  const Text("Orale",
                      style: TextStyle(
                          fontFamily: "monospace",
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                  const Divider(),
                  _infoRow(icon: Icons.class_, field: _orale.name),
                  const Divider(),
                  _infoRow(
                      icon: Icons.calendar_today,
                      field: _formatDateFromString(_orale.date)),
                  const Divider(),
                  _infoRow(icon: Icons.query_builder, field: _orale.hour),
                  const Divider(),
                  _infoRow(icon: Icons.place, field: _orale.room),
                ],
              )
            : const Center(),
      ],
    );
  }

  Widget _infoRow({required IconData icon, required String field}) {
    return Row(
      children: [
        Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(icon, color: Colors.grey)),
        Flexible(
          child: Text(field != "" ? field : "-",
              overflow: TextOverflow.fade,
              style: const TextStyle(fontFamily: "monospace", fontSize: 18)),
        )
      ],
    );
  }
}
