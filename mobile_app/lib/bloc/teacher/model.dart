import 'package:equatable/equatable.dart';

class Teacher extends Equatable {
  final String firstName;
  final String lastName;
  final String qualification;
  final String office;
  final String phone;
  final String mail;
  final String website;
  final List<String> classes;

  const Teacher({
    required this.firstName,
    required this.lastName,
    required this.qualification,
    required this.office,
    required this.phone,
    required this.mail,
    required this.website,
    required this.classes
  });

  Teacher.fromJson(Map<String, dynamic> json) :
    firstName = json["first_name"],
    lastName = json["last_name"],
    qualification = json["qualification"],
    office = json["office"],
    phone = json["phone"],
    mail = json["mail"],
    website = json["website"],
    classes = List<String>.generate(json["classes"].length, (index) => json["classes"][index]["name"]);

  @override
  List<Object?> get props => [];
}
