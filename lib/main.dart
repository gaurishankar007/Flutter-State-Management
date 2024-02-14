import 'package:flutter/material.dart';

import 'Increment_notifier.dart';
import 'count_down_inherited.dart';
import 'home.dart';

void main() {
  runApp(InheritedApp());
}

class InheritedApp extends StatelessWidget {
  InheritedApp({super.key});

  final notifier = IncrementNotifier();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: notifier,
      builder: (context, child) {
        return CountDownInherited(
          counter: notifier.counter,
          add: notifier.add,
          subtract: notifier.subtract,
          child: MaterialApp(
            title: 'Inherited Widget With Change Notifier',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            home: const Home(),
          ),
        );
      },
    );
  }
}
