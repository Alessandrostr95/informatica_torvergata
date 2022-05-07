import 'dart:convert';

import 'model.dart';
import 'package:http/http.dart' as http;

class NewsApiClient {
  final String url;
  NewsApiClient({required this.url});

  Future<List<News>> fetch() async {
    var resp = await http.get(Uri.parse(url));
    final _data = jsonDecode(utf8.decode(resp.bodyBytes));
    // await Future.delayed(const Duration(seconds: 3));
    final news = List<News>.generate(_data.length, (index) => News.fromJson(_data[index]));
    return news;
  }
}