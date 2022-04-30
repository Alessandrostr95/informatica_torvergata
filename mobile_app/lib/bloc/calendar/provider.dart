import 'dart:convert';

import 'model.dart';
import 'package:http/http.dart' as http;

class CalendarApiClient {
  final String url;
  CalendarApiClient({required this.url});

  Future<Calendar> fetch() async {
    // var calendar = const Calendar(data: {"PROVA": ":)"});
    final resp = await http.get(Uri.parse(url));
    final _data = jsonDecode(resp.body);
    await Future.delayed(const Duration(seconds: 3));
    return Calendar(data: _data[0]);
  }
}