import 'dart:convert';

import 'model.dart';
import 'package:http/http.dart' as http;

class ClassApiClient {
  final String url;
  ClassApiClient({required this.url});

  Future<List<Class>> fetch() async {
    final resp = await http.get(Uri.parse(url));
    final _data = jsonDecode(utf8.decode(resp.bodyBytes));
    // await Future.delayed(const Duration(seconds: 3));  // debug
    // return _data.map((element) => Class.fromJson(element)).toList();
    return List<Class>.generate(_data.length, (index) => Class.fromJson(_data[index]));
  }
}