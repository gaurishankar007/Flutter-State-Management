import 'package:flutter/material.dart';

import '../../inherited/count_inherited_model.dart';

class Counter2Value extends StatelessWidget {
  const Counter2Value({super.key});

  @override
  Widget build(BuildContext context) {
    final inherited = CountInheritedModel.of(context, aspect: CounterType.counter2);
    debugPrint("Counter2 Updated");

    return Text("Counter2: ${inherited.counter2}");
  }
}
