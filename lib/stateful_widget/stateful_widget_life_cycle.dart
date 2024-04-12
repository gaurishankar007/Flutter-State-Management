import 'dart:developer';

import 'package:flutter/material.dart';

class StatefulWidgetLifeCycle extends StatefulWidget {
  final String title;
  const StatefulWidgetLifeCycle({super.key, required this.title});

  @override
  State<StatefulWidgetLifeCycle> createState() => _StatefulWidgetLifeCycleState();
}

class _StatefulWidgetLifeCycleState extends State<StatefulWidgetLifeCycle> {
  int count = 0;
  String title = "Text1 Widget: It will be built multiple times.";

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

            // Separate Widgets
            Count(count: count),
            const SizedBox(height: 10),
            Text1(title: title),
            const SizedBox(height: 10),
            const Text2(text2Title: "Text2 Widget: It will not be built multiple times."),
            const SizedBox(height: 10),
            const Text3(),
            // End of New Widgets

            const SizedBox(height: 30),
            const Text("Notes."),
            const SizedBox(height: 5),
            const Text(
              "1. Constant widget will not be rebuilt.",
              style: TextStyle(color: Colors.green),
            ),
            const Text(
              "2. `didUpdateWidget` of child (Non-constant) is called after setState on parent is called.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => count++),
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}

class Count extends StatefulWidget {
  final int count;
  const Count({super.key, required this.count});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  @override
  void didUpdateWidget(covariant Count oldWidget) {
    if (oldWidget.count != widget.count) {
      log("didUpdateWidget on Count due to count change.");
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    log("Count Rebuilt");

    return Text("Count Widget: ${widget.count.toString()}");
  }
}

class Text1 extends StatefulWidget {
  final String title;
  const Text1({super.key, required this.title});

  @override
  State<Text1> createState() => _Text1State();
}

class _Text1State extends State<Text1> {
  @override
  void didUpdateWidget(covariant Text1 oldWidget) {
    log("didUpdateWidget on Text1 deu to reassign of title.");
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    log("Text1 Rebuilt");

    return Text(widget.title);
  }
}

class Text2 extends StatefulWidget {
  final String text2Title;
  const Text2({super.key, required this.text2Title});

  @override
  State<Text2> createState() => _Text2State();
}

class _Text2State extends State<Text2> {
  @override
  void didUpdateWidget(covariant Text2 oldWidget) {
    log("didUpdateWidget on Text2.");
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    log("Text2 Rebuilt");

    return Text(widget.text2Title);
  }
}

class Text3 extends StatelessWidget {
  const Text3({super.key});

  @override
  Widget build(BuildContext context) {
    log("Text3 Rebuilt");

    return const Text("Text3 Widget: It wii not be built multiple times.");
  }
}
