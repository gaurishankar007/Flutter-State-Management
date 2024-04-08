import 'package:flutter/material.dart';

import 'color_change_notifier.dart';

class ColorInheritedNotifier extends InheritedNotifier<ColorChangeNotifier> {
  const ColorInheritedNotifier({
    super.key,
    required ColorChangeNotifier super.notifier,
    required super.child,
  });

  static Color of(BuildContext context) {
    final inheritedNotifier = context.dependOnInheritedWidgetOfExactType<ColorInheritedNotifier>();

    assert(inheritedNotifier != null, "ColorInheritedNotifier is not found in the context");

    /// if inheritedNotifier or notifier of it is null, it returns 0
    return inheritedNotifier?.notifier?.color ?? Colors.black;
  }
}
