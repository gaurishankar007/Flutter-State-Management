import 'package:flutter/material.dart';

import 'color_change_notifier.dart';

class ColorInheritedNotifier extends InheritedNotifier<ColorChangeNotifier> {
  const ColorInheritedNotifier({
    super.key,
    required ColorChangeNotifier super.notifier,
    required super.child,
  });

  static ColorInheritedNotifier? of(BuildContext context) {
    final inheritedNotifier = context.dependOnInheritedWidgetOfExactType<ColorInheritedNotifier>();
    return inheritedNotifier;
  }

  static Color ofColor(BuildContext context) {
    final inheritedNotifier = of(context);

    return inheritedNotifier?.notifier?.color ?? Colors.black;
  }

  static List<Color> ofColors(BuildContext context) {
    final inheritedNotifier = of(context);

    return inheritedNotifier?.notifier?.availableColors ?? [];
  }

 
}
