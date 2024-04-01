import 'dart:developer';

import 'package:flutter/material.dart';

import '../count_inherited_widget.dart';

class DecreaseCount extends StatelessWidget {
  const DecreaseCount({super.key});

  @override
  Widget build(BuildContext context) {
    final inherited = CountInheritedWidget.of(context);
    log("Count Changed --");

    return Column(
      children: [
        const Text("Sub Widget"),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => inherited.subtract(),
          child: const Text("Decrease"),
        ),
        const SizedBox(height: 10),
        Text("Counter: ${inherited.counter}"),
      ],
    );
  }
}
