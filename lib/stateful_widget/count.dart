import 'dart:developer';

import 'package:flutter/material.dart';

class Count extends StatefulWidget {
  final int count;
  const Count({super.key, required this.count});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    count = widget.count;
  }

  @override
  void didUpdateWidget(covariant Count oldWidget) {
    log("didUpdateWidget on Count Widget.");
    if (oldWidget.count != widget.count) {
      log("New count value assigned.");
      setState(() => count = widget.count);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    log("Count Widget Build");

    return Text("Count Widget: $count");
  }
}
