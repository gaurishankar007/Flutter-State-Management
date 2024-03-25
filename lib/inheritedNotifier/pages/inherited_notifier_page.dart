import 'dart:developer';

import 'package:flutter/material.dart';

import '../color_change_notifier.dart';
import '../color_inherited_notifier.dart';

class InheritedNotifierPage extends StatefulWidget {
  const InheritedNotifierPage({super.key});

  @override
  State<InheritedNotifierPage> createState() => _InheritedNotifierPageState();
}

class _InheritedNotifierPageState extends State<InheritedNotifierPage> {
  final notifier = ColorChangeNotifier();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inherited Notifier With Change Notifier"),
      ),
      body: SafeArea(
        child: ColorInheritedNotifier(
          notifier: notifier,
          child: Builder(
            builder: (context) {
              final color = ColorInheritedNotifier.of(context);
              log("Color updated");

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: double.maxFinite),
                  const Text("Inherited Notifier is provided in this page."),
                  const SizedBox(height: 50),
                  Container(height: 200, width: 200, color: color),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () => notifier.changeColor(),
                    child: const Text("Change Color"),
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
