import 'dart:convert';

import 'model.dart';
import 'package:http/http.dart' as http;

class TeacherApiClient {
  final String url;
  TeacherApiClient({required this.url});

  Future<List<Teacher>> fetch() async {
    final resp = await http.get(Uri.parse(url));
    final _data = jsonDecode(utf8.decode(resp.bodyBytes));
    await Future.delayed(const Duration(seconds: 3));
    // return _data.map((element) => Teacher.fromJson(element)).toList();
    return List<Teacher>.generate(_data.length, (index) => Teacher.fromJson(_data[index]));
  }
}