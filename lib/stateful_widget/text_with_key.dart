import 'dart:developer';

import 'package:flutter/material.dart';

class TextWithKey extends StatefulWidget {
  const TextWithKey({super.key});

  @override
  State<TextWithKey> createState() => TextWithKeyState();
}

class TextWithKeyState extends State<TextWithKey> {
  @override
  void didUpdateWidget(covariant TextWithKey oldWidget) {
    log('didUpdateWidget on Text with key Widget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    log('Text with key Widget deactivated');
    super.deactivate();
  }

  @override
  void activate() {
    super.activate();
    log('Text with key Widget activated');
  }

  @override
  Widget build(BuildContext context) {
    log("Text with key Widget Build");

    return const Text("Text With Key Widget: multiple building.");
  }
}
