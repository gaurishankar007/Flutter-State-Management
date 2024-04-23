import 'dart:developer';

import 'package:flutter/material.dart';

import 'count.dart';
import 'text1.dart';
import 'text2.dart';
import 'text3.dart';
import 'text4.dart';

class StatefulWidgetLifeCycle extends StatefulWidget {
  final String title;
  const StatefulWidgetLifeCycle({super.key, required this.title});

  @override
  State<StatefulWidgetLifeCycle> createState() => _StatefulWidgetLifeCycleState();
}

class _StatefulWidgetLifeCycleState extends State<StatefulWidgetLifeCycle> {
  int count = 0;
  String title = "Text1 Widget: It will be built multiple times.";
  bool swapText3 = true;

  /// GlobalKey to access the state of Text3 widget.
  /// This is used to demonstrate the lifecycle of Text3 widget.
  /// Using UniqueKey will not work as the activate will not be called.
  GlobalKey<Text3State> text3Key = GlobalKey<Text3State>();

  @override
  void initState() {
    super.initState();
    log("Main Page initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    log("Main Page didChangeDependencies");
  }

  @override
  void deactivate() {
    log("Main Page deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    log("Main Page dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    log("Main Page Rebuilt");

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SafeArea(
        child: Column(
          children: [
            Text("Count: ${count.toString()}"),
            const SizedBox(height: 20, width: double.maxFinite),

            // ----------- Separate Widgets -----------
            Count(count: count),
            const SizedBox(height: 10),
            Text1(title: title),
            const SizedBox(height: 10),
            const Text2(text2Title: "Text2 Widget: It will not be built multiple times."),
            const SizedBox(height: 10),
            // Changing location of Text3 widget in the widget tree.
            // It will is be deactivated at first and then activated
            // when it is built again because of the global state key.
            // If it was not rebuilt with the same global state key,
            // then dispose will be called instead of activate.
            swapText3
                ? Text3(key: text3Key)
                : Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text3(key: text3Key),
                  ),
            const SizedBox(height: 10),
            const Text4(),
            // ----------- End of Separate Widgets -----------

            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => count++),
                  child: const Text("Increment Count"),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => swapText3 = !swapText3),
                  child: const Text("Toggle Text3 Location"),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Notes."),
                  SizedBox(height: 5),
                  Text(
                    "1. Constant widget will not be rebuilt.",
                    style: TextStyle(color: Colors.green),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "3. `didChangeDependencies` of child widget is called "
                    "when the dependency's value is changed "
                    "(i.e. MediaQuery, ThemeData, InheritedWidget, etc.)",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "3. `didUpdateWidget` of non-constant child widget is called "
                    "after setState on parent widget is called.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "4. `activate` of child widget is called "
                    "when it is rebuilt with the same global state key "
                    "in different location of the parent widget (widget tree) ",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
