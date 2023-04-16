import 'package:flutter/material.dart';

class DashboardProvider with ChangeNotifier {
  int indexTombol = 0;

  void saatdiklik(int index) {
    indexTombol = index;
    notifyListeners();
  }
}
