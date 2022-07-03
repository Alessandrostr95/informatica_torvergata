import 'dart:convert';

import 'model.dart';
import 'package:http/http.dart' as http;

class ExamApiClient {
  final String url;
  ExamApiClient({required this.url});

  Future<List<Exam>> fetch() async {
    final resp = await http.get(Uri.parse(url));
    final _data = jsonDecode(utf8.decode(resp.bodyBytes));
    // await Future.delayed(const Duration(seconds: 3));
    return List<Exam>.generate(_data.length, (index) => Exam.fromJson(_data[index]));
  }
}