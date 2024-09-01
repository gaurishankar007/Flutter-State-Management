import 'dart:math';

import 'package:flutter/material.dart';

import 'debounce_time.dart';

class ColorChangeNotifier extends ChangeNotifier {
  final debounceTime = DebounceTime(delay: const Duration(milliseconds: 1000));
  static final Map<String, Color> _colorMap = {
    "green": Colors.green,
    "red": Colors.red,
    "blue": Colors.blue,
    "indigo": Colors.indigo,
    "purple": Colors.purple,
    "pink": Colors.pink,
    "orange": Colors.orange,
    "brown": Colors.brown,
    "yellow": Colors.yellow,
    "amber": Colors.amber,
    "cyan": Colors.cyan,
    "teal": Colors.teal,
  };
  Color color = Colors.green;
  List<Color> availableColors = _colorMap.values.toList();

  ColorChangeNotifier();

  changeColor() {
    int index = Random().nextInt(_colorMap.values.length);
    Color newColor = _colorMap.values.toList()[index];

    if (newColor != color) {
      color = newColor;
      notifyListeners();
    } else {
      changeColor();
    }
  }

  searchColor(String query) => debounceTime.run(() => filterColor(query));

  filterColor(String query) {
    if (query.isEmpty) {
      availableColors = _colorMap.values.toList();
      notifyListeners();
      return;
    }

    List<Color> searchedColors = [];
    _colorMap.forEach((key, value) {
      if (key.contains(query)) searchedColors.add(value);
    });

    availableColors = searchedColors;
    notifyListeners();
  }
}
