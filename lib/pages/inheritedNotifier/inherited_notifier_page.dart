import 'package:flutter/material.dart';

import '../../notifier/count_inherited_notifier.dart';
import '../../notifier/count_value_notifier.dart';

class InheritedNotifierPage extends StatefulWidget {
  const InheritedNotifierPage({super.key});

  @override
  State<InheritedNotifierPage> createState() => _InheritedNotifierPageState();
}

class _InheritedNotifierPageState extends State<InheritedNotifierPage> {
  final notifier = CountValueNotifier();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inherited Notifier With Value Notifier"),
      ),
      body: SafeArea(
        child: CountInheritedNotifier(
          notifier: notifier,
          child: Builder(
            builder: (context) {
              final count = CountInheritedNotifier.of(context);
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: double.maxFinite),
                  const Text("Inherited Notifier is provided in this page."),
                  const SizedBox(height: 50),
                  Text("Counter: $count"),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () => notifier.add(),
                    child: const Text("increase"),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => notifier.subtract(),
                    child: const Text("Decrease"),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
