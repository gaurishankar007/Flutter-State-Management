import 'dart:developer';

import 'package:flutter/material.dart';

class GreenContainer extends StatefulWidget {
  const GreenContainer({super.key});

  @override
  State<GreenContainer> createState() => _GreenContainerState();
}

class _GreenContainerState extends State<GreenContainer> {
  @override
  void deactivate() {
    super.deactivate();
    log("Green Container deactivated");
  }

  @override
  Widget build(BuildContext context) {
    log("Green Container Widget Build");
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: const Text(
        "I am inside horizontal page view. Scroll me.",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
