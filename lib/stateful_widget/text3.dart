

import 'dart:developer';

import 'package:flutter/material.dart';

class Text3 extends StatefulWidget {
  const Text3({super.key});

  @override
  State<Text3> createState() => Text3State();
}

class Text3State extends State<Text3> {
  @override
  void didUpdateWidget(covariant Text3 oldWidget) {
    log("didUpdateWidget on Text3.");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    log('Text3 deactivated');
    super.deactivate();
  }

  @override
  void activate() {
    super.activate();
    log('Text3 activated');
  }

  @override
  void dispose() {
    log('Text3 disposed');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log("Text3 Rebuilt");

    return const Text("Text3 Widget: It will be built multiple times.");
  }
}