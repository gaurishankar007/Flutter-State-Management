import 'dart:developer';

import 'package:flutter/material.dart';

class BlueContainer extends StatefulWidget {
  const BlueContainer({super.key});

  @override
  State<BlueContainer> createState() => _BlueContainerState();
}

class _BlueContainerState extends State<BlueContainer> {
  @override
  void deactivate() {
    super.deactivate();
    log("Blue Container deactivated");
  }

  @override
  Widget build(BuildContext context) {
    log("Blue Container Widget Build");
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.blue,
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
