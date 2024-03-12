import 'package:flutter/widgets.dart';

class CountInheritedModel extends InheritedModel<CounterType> {
  final int counter1;
  final int counter2;

  const CountInheritedModel({
    super.key,
    required super.child,
    required this.counter1,
    required this.counter2,
  });

  static CountInheritedModel of(BuildContext context, {required CounterType aspect}) {
    final CountInheritedModel? result =
        InheritedModel.inheritFrom<CountInheritedModel>(context, aspect: aspect);
    assert(result != null, 'No CountModel found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant CountInheritedModel oldWidget) {
    return counter1 != oldWidget.counter1 || counter2 != oldWidget.counter2;
  }

  /// Update Specific dependent or widget only
  @override
  bool updateShouldNotifyDependent(
    covariant CountInheritedModel oldWidget,
    Set<CounterType> dependencies,
  ) {
    if (dependencies.contains(CounterType.counter1) && counter1 != oldWidget.counter1) return true;
    if (dependencies.contains(CounterType.counter2) && counter2 != oldWidget.counter2) return true;

    return false;
  }
}

enum CounterType {
  counter1,
  counter2,
}
