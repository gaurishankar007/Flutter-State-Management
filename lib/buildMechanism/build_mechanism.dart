import 'dart:developer';

import 'package:flutter/material.dart';

class BuildMechanism extends StatefulWidget {
  final String title;
  const BuildMechanism({super.key, required this.title});

  @override
  State<BuildMechanism> createState() => _BuildMechanismState();
}

class _BuildMechanismState extends State<BuildMechanism> {
  int count = 0;
  String title = "This widget will be built whenever the main page is rebuilt.";

  @override
  Widget build(BuildContext context) {
    log("Main Page Rebuilt");

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SafeArea(
        child: Column(
          children: [
            Text("Count: ${count.toString()}"),
            const SizedBox(height: 20, width: double.maxFinite),
            Count(count: count),
            const SizedBox(height: 20),
            TextStateful(title: title),
            const SizedBox(height: 10),
            const Text1(),
            const SizedBox(height: 10),
            const Text2(text2Title: "This widget will not be built multiple times."),
            const SizedBox(height: 30),
            const Text("Note: Constant widget will not be rebuilt.")
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

class Count extends StatelessWidget {
  final int count;
  const Count({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    log("Count Rebuilt");

    return Text("Count passed to other widget: ${count.toString()}");
  }
}

class TextStateful extends StatelessWidget {
  final String title;
  const TextStateful({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    log("Text Stateful Rebuilt");

    return Text(title);
  }
}

class Text1 extends StatelessWidget {
  const Text1({super.key});

  @override
  Widget build(BuildContext context) {
    log("Text1 Rebuilt");

    return const Text("This widget will not be built multiple times.");
  }
}

class Text2 extends StatelessWidget {
  final String text2Title;
  const Text2({super.key, required this.text2Title});

  @override
  Widget build(BuildContext context) {
    log("Text2 Rebuilt");

    return Text(text2Title);
  }
}
