import 'package:flutter/material.dart';

import '../count_inherited_widget.dart';
import '../count_value_notifier.dart';
import '../widgets/decrease_count.dart';
import '../widgets/increase_count.dart';

class InheritedWidgetPage extends StatefulWidget {
  final String title;
  const InheritedWidgetPage({super.key, required this.title});

  @override
  State<InheritedWidgetPage> createState() => _InheritedWidgetPageState();
}

class _InheritedWidgetPageState extends State<InheritedWidgetPage> {
  final notifier = CountValueNotifier();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: notifier,
          builder: (context, value, child) {
            return CountInheritedWidget(
              counter: value,
              add: notifier.add,
              subtract: notifier.subtract,
              child: Builder(builder: (context) {
                final inherited = CountInheritedWidget.of(context);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Inherited Widget is provided in this page."),
                    const SizedBox(height: 50),
                    Text("Counter: ${inherited.counter}"),
                    const SizedBox(height: 50),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [IncreaseCount(), DecreaseCount()],
                    )
                  ],
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
