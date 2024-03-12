import 'package:flutter/foundation.dart';

class CountNotifier extends ChangeNotifier {
  int counter1 = 1;
  int counter2 = 1;

  CountNotifier();

  add({bool first = true}) {
    first ? counter1++ : counter2++;
    notifyListeners();
  }

  subtract({bool first = true}) {
    first ? counter1-- : counter2--;
    notifyListeners();
  }
}
