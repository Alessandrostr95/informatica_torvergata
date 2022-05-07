import 'package:equatable/equatable.dart';

class Class extends Equatable {
  final String code;
  final String name;
  final String sector;
  final int courseYear;
  final String year;
  final int cfu;
  final List prerequisites;
  final List teachers;

  const Class({
    required this.code,
    required this.name,
    required this.sector,
    required this.courseYear,
    required this.year,
    required this.cfu,
    this.prerequisites = const [],
    this.teachers = const []
  });

  Class.fromJson(Map<String, dynamic> json) :
    code = json["code"],
    name = json["name"],
    sector = json["sector"],
    courseYear = json["course_year"],
    year = json["year"],
    cfu = json["cfu"],
    prerequisites = json["prerequisites"],
    teachers = json["teachers"];

  @override
  List<Object?> get props => [];
}
