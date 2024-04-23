
import 'dart:developer';

import 'package:flutter/material.dart';

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
