import 'package:flutter/material.dart';

import 'count_value_notifier.dart';

class CountInheritedNotifier extends InheritedNotifier<CountValueNotifier> {
  const CountInheritedNotifier({
    Key? key,
    required CountValueNotifier notifier,
    required Widget child,
  }) : super(
          key: key,
          notifier: notifier,
          child: child,
        );

  static int of(BuildContext context) {
    final inheritedNotifier = context.dependOnInheritedWidgetOfExactType<CountInheritedNotifier>();

    /// if inheritedNotifier or notifier of it is null, it returns 0
    return inheritedNotifier?.notifier?.value ?? 0;
  }
}
