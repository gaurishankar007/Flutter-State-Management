import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HookExample5 extends HookWidget {
  const HookExample5({super.key});

  String get url =>
      "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg";

  @override
  Widget build(BuildContext context) {
    log("Hook Example5");

    late final StreamController<double> controller;
    controller = useStreamController<double>(onListen: () {
      controller.sink.add(0.0);
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("UseCase: useStreamController"),
            const SizedBox(height: 100, width: double.maxFinite),
            StreamBuilder<double>(
              stream: controller.stream,
              builder: (context, snapshot) {
                final rotation = snapshot.data ?? 0.0;
                return GestureDetector(
                  onTap: () {
                    controller.sink.add(rotation + 45.0);
                  },
                  child: RotationTransition(
                    turns: AlwaysStoppedAnimation(rotation / 360),
                    child: Center(child: Image.network(url)),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
