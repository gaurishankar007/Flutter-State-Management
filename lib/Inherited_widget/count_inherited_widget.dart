import 'package:flutter/widgets.dart';

class CountInheritedWidget extends InheritedWidget {
  final int counter;
  final Function() add;
  final Function() subtract;

  const CountInheritedWidget({
    super.key,
    required super.child,
    required this.counter,
    required this.add,
    required this.subtract,
  });

  static CountInheritedWidget? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CountInheritedWidget>();
  }

  static CountInheritedWidget of(BuildContext context) {
    final CountInheritedWidget? result = maybeOf(context);
    assert(result != null, 'No CountWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant CountInheritedWidget oldWidget) {
    return counter != oldWidget.counter;
  }
}
