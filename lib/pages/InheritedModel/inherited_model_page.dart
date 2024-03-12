import 'package:flutter/material.dart';

import '../../notifier/count_notifier.dart';
import '../../inherited/count_inherited_model.dart';
import 'counter1_value.dart';
import 'counter2_value.dart';

class InheritedModelPage extends StatefulWidget {
  const InheritedModelPage({super.key});

  @override
  State<InheritedModelPage> createState() => _InheritedModelPageState();
}

class _InheritedModelPageState extends State<InheritedModelPage> {
  final notifier = CountNotifier();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inherited Model With Change Notifier"),
      ),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: notifier,
          builder: (context, child) {
            return CountInheritedModel(
              counter1: notifier.counter1,
              counter2: notifier.counter2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Inherited Model is provided in this page."),
                  const SizedBox(height: 50),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Counter1Value(), Counter2Value()],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () => notifier.add(),
                        child: const Text("Increase Counter 1"),
                      ),
                      ElevatedButton(
                        onPressed: () => notifier.add(first: false),
                        child: const Text("Increase Counter 1"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () => notifier.subtract(),
                        child: const Text("Decrease Counter 1"),
                      ),
                      ElevatedButton(
                        onPressed: () => notifier.subtract(first: false),
                        child: const Text("Decrease Counter 2"),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
