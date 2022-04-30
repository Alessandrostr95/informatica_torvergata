import 'model.dart';
import 'package:http/http.dart' as http;

class NewsApiClient {
  final String url;
  NewsApiClient({required this.url});

  Future<List<News>> fetch() async {
    var news = <News>[];
    await Future.delayed(const Duration(seconds: 3));
    news = News.examples;
    return news;
  }
}