import 'package:flutter/cupertino.dart';

class CourseInfo extends ChangeNotifier {
  bool _master = false;

  bool get master => _master;

  void set(bool value) {
    _master = value;
    notifyListeners();
  }
}
