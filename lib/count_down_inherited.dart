import 'package:flutter/widgets.dart';

class CountDownInherited extends InheritedWidget {
  final int counter;
  final Function() add;
  final Function() subtract;

  const CountDownInherited({
    super.key,
    required super.child,
    required this.counter,
    required this.add,
    required this.subtract,
  });

  static CountDownInherited? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CountDownInherited>();
  }

  static CountDownInherited of(BuildContext context) {
    final CountDownInherited? result = maybeOf(context);
    assert(result != null, 'No CountDown found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant CountDownInherited oldWidget) {
    return counter != oldWidget.counter;
  }
}
