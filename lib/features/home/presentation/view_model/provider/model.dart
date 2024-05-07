import 'package:flutter/material.dart';

class Mystate extends ChangeNotifier {
  int _number = 0;
  bool _isSelected = false;
  bool get isSelected => _isSelected;
  int get number => _number;
  void setPage(int page) {
    _number = page;
    notifyListeners();
  }

  void setisSelected(bool value) {
    _isSelected = value;

    notifyListeners();
  }
}
