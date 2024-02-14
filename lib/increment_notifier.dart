import 'package:flutter/foundation.dart';

class IncrementNotifier extends ChangeNotifier {
  int counter = 1;

  IncrementNotifier();

  add() {
    counter++;
    notifyListeners();
  }

  subtract() {
    counter--;
    notifyListeners();
  }
}

