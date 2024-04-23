
import 'dart:developer';

import 'package:flutter/material.dart';

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