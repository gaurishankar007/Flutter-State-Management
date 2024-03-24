import 'package:flutter/material.dart';

import '../count_inherited_model.dart';

class Counter1Value extends StatelessWidget {
  const Counter1Value({super.key});

  @override
  Widget build(BuildContext context) {
    final inherited = CountInheritedModel.of(context, aspect: CounterType.counter1);
    debugPrint("Counter1 Updated");

    return Text("Counter1: ${inherited.counter1}");
  }
}
