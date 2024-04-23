
import 'dart:developer';

import 'package:flutter/material.dart';

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
