import "package:flutter/material.dart";

class UserThemeProvider with ChangeNotifier {
  double _inputWidth = 480.0;

  double get inputWidth => _inputWidth;

  set inputWidth(double value) {
    _inputWidth = value;
    notifyListeners();
  }
}
