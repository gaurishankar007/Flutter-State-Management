import 'package:flutter/material.dart';

import 'color_change_notifier.dart';

class ColorInheritedNotifier extends InheritedNotifier<ColorChangeNotifier> {
  const ColorInheritedNotifier({
    Key? key,
    required ColorChangeNotifier notifier,
    required Widget child,
  }) : super(
          key: key,
          notifier: notifier,
          child: child,
        );

  static Color of(BuildContext context) {
    final inheritedNotifier = context.dependOnInheritedWidgetOfExactType<ColorInheritedNotifier>();

    assert(inheritedNotifier != null, "ColorInheritedNotifier is not found in the context");

    /// if inheritedNotifier or notifier of it is null, it returns 0
    return inheritedNotifier?.notifier?.color ?? Colors.black;
  }
}
