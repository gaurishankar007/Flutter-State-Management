import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../color_change_notifier.dart';
import '../color_inherited_notifier.dart';

class InheritedNotifierPage extends StatefulWidget {
  final String title;
  const InheritedNotifierPage({super.key, required this.title});

  @override
  State<InheritedNotifierPage> createState() => _InheritedNotifierPageState();
}

class _InheritedNotifierPageState extends State<InheritedNotifierPage> {
  final notifier = ColorChangeNotifier();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: ColorInheritedNotifier(
          notifier: notifier,
          child: Builder(
            builder: (context) {
              final color = ColorInheritedNotifier.ofColor(context);
              final colors = ColorInheritedNotifier.ofColors(context);
              log("Color updated");

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: double.maxFinite),
                  const Text("Inherited Notifier is provided in this page."),
                  const SizedBox(height: 50),
                  const Text("Available Colors"),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      onChanged: (value) => notifier.searchColor(value),
                      decoration: const InputDecoration(
                        hintText: "Search Colors",
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      alignment: WrapAlignment.center,
                      children: [
                        for (int i = 0; i < colors.length; i++)
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: colors[i],
                              borderRadius: BorderRadius.circular(5),
                            ),
                          )
                      ],
                    ),
                  ),
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
