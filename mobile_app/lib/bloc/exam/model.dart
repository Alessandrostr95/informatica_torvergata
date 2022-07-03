import 'package:equatable/equatable.dart';

class Exam extends Equatable {
  final String code;
  final String name;
  final int courseYear;
  final String year;
  final String session;
  final int call;
  final String type;
  final String date;
  final String hour;
  final String room;
  final int cfu;
  final String sector;

  const Exam({
    required this.code,
    required this.name,
    required this.courseYear,
    required this.year,
    required this.session,
    required this.call,
    required this.type,
    required this.date,
    required this.hour,
    required this.room,
    required this.cfu,
    required this.sector,
  });

  Exam.fromJson(Map<String, dynamic> json) :
    code = json["code"],
    name = json["name"],
    courseYear = json["course_year"],
    year = json["year"],
    session = json["session"],
    call = json["call"],
    type = json["type"],
    date = json["date"],
    hour = json["hour"],
    room = json["room"],
    cfu = json["cfu"],
    sector = json["sector"];

  @override
  List<Object?> get props => [];
}
