import 'dart:convert';

import 'model.dart';
import 'package:http/http.dart' as http;

class CalendarApiClient {
  final String url;
  CalendarApiClient({required this.url});

  Future<Calendar> fetch() async {
    final resp = await http.get(Uri.parse(url));
    final _data = jsonDecode(utf8.decode(resp.bodyBytes));
    // await Future.delayed(const Duration(seconds: 3));
    return Calendar(data: _data);
  }
}