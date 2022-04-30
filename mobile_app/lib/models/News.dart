import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:expandable/expandable.dart';
import 'package:provider/provider.dart';
import 'package:equatable/equatable.dart';

class NewsNotifier extends ChangeNotifier {
  bool _fetching = true;
  List<News>? _news = [];

  bool get isFetching => _fetching;
  List<News>? get news => _news;

  void fetching(bool value) {
    _fetching = value;
    notifyListeners();
  }

  Future<void> fecth() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    // _news = News.examples;
    _news = null;
    _fetching = false;
    notifyListeners();
  }
}

class News extends ChangeNotifier {
  final String title;
  final String author;
  final DateTime date;
  final String content;

  News({
    required this.title,
    required this.author,
    required this.date,
    required this.content,
  });

  static String loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi orci erat, feugiat at luctus pellentesque, euismod id erat. Duis ultricies, ex at auctor semper, est purus congue ipsum, ut bibendum augue quam nec neque. Nam in nulla consequat, interdum elit nec, vestibulum odio. Praesent euismod, orci ut pellentesque facilisis, est ligula ornare dolor, vel congue magna est eu orci.";
  static final examples = [
    News(title: "Titolo 1", author: "Autore 1", date: DateTime.now(), content: loremIpsum),
    News(title: "Titolo 2", author: "Autore 2", date: DateTime.now(), content: loremIpsum),
    News(title: "Titolo 3", author: "Autore 3", date: DateTime.now(), content: loremIpsum),
    News(title: "Titolo 4", author: "Autore 4", date: DateTime.now(), content: loremIpsum),
    News(title: "Titolo 5", author: "Autore 5", date: DateTime.now(), content: loremIpsum),
    News(title: "Titolo 6", author: "Autore 6", date: DateTime.now(), content: loremIpsum),
    News(title: "Titolo 7", author: "Autore 7", date: DateTime.now(), content: loremIpsum),
    News(title: "Titolo 8", author: "Autore 8", date: DateTime.now(), content: loremIpsum),
  ];

  static List<Card> newsWidgetFrom(List<News> news) {
    final DateFormat df = DateFormat("dd/MM/yyyy HH:mm");
    return news.map((e) {
      return Card(
        clipBehavior: Clip.antiAlias,
        elevation: 3,

        child: ExpandablePanel(

          header: ListTile(
            contentPadding: const EdgeInsets.only(top: 8, left: 16),
            title: Text(e.title, style: const TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Autore: ${e.author}",
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
                Text(
                  "Data: ${df.format(e.date)}",
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                )
              ],
            ),
          ),

          expanded: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(e.content),
          ),

          collapsed: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(e.content, softWrap: true, maxLines: 1, overflow: TextOverflow.ellipsis,),
          ),
        ),
      );
    }).toList();
  }
}