import 'dart:math';

import 'package:flutter/material.dart';

class ColorChangeNotifier extends ChangeNotifier {
  final List<Color> _colors = [
    Colors.green,
    Colors.red,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.pink,
    Colors.orange,
  ];
  Color color = Colors.green;

  ColorChangeNotifier();

  changeColor() {
    int index = Random().nextInt(_colors.length);
    Color newColor = _colors[index];
    
    if (newColor != color) {
      color = newColor;
      notifyListeners();
    } else {
      changeColor();
    }
  }
}
