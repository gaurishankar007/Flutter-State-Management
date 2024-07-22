import 'dart:developer';

import 'package:flutter/material.dart';

class StatelessText extends StatelessWidget {
  const StatelessText({super.key});

  @override
  Widget build(BuildContext context) {
    log("Stateless Text Widget Build");

    return const Text("Stateless Text Widget: No multiple building.");
  }
}
