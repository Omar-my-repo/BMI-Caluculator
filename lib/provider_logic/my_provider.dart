import 'dart:math';

import 'package:flutter/material.dart';

import '../constants/strings.dart';

class MyProvider with ChangeNotifier {
  int weight = KWeightValue;
  double height = KHeightValue;
  bool isMale = KIsMale;
  double result = 0;

  decreesWeight() {
    if (weight > 30) {
      weight--;
    }
    notifyListeners();
  }

  increaseWeight() {
    if (weight < 160) {
      weight++;
    }
    notifyListeners();
  }

  decreesHeight() {
    height--;
    notifyListeners();
  }

  increaseHeight() {
    height++;
    notifyListeners();
  }

  isMaleTrue() {
    isMale = true;
    notifyListeners();
  }

  isMaleFalse() {
    isMale = false;
    notifyListeners();
  }

  setResult() {
    result=weight/(pow(height / 100, 2));
    notifyListeners();
  }
}
