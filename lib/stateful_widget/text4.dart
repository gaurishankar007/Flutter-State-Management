import 'dart:developer';

import 'package:flutter/material.dart';

class Text4 extends StatelessWidget {
  const Text4({super.key});

  @override
  Widget build(BuildContext context) {
    log("Text4 Rebuilt");

    return const Text("Text4 Widget: It will not be built multiple times.");
  }
}
