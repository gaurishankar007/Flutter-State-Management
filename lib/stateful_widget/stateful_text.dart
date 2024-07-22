import 'dart:developer';

import 'package:flutter/material.dart';

class StatefulText extends StatefulWidget {
  final String text2Title;
  const StatefulText({super.key, required this.text2Title});

  @override
  State<StatefulText> createState() => _StatefulTextState();
}

class _StatefulTextState extends State<StatefulText> {
  @override
  void didUpdateWidget(covariant StatefulText oldWidget) {
    log("didUpdateWidget on Stateful Widget.");
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    log("Stateful Text Widget Build");
    return Text("Stateful Text Widget: ${widget.text2Title}");
  }
}
