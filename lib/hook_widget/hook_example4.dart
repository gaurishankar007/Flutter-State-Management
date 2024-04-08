import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HookExample4 extends HookWidget {
  const HookExample4({super.key});

  String get url =>
      "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg";
  double get imageHeight => 300.0;

  @override
  Widget build(BuildContext context) {
    dev.log("Hook Example4");

    final opacity = useAnimationController(
      duration: const Duration(seconds: 1),
      initialValue: 1.0,
      upperBound: 1.0,
      lowerBound: 0.0,
    );
    final size = useAnimationController(
      duration: const Duration(seconds: 1),
      initialValue: 1.0,
      upperBound: 1.0,
      lowerBound: 0.0,
    );
    final controller = useScrollController();

    useEffect(() {
      controller.addListener(() {
        /// Height of the image after scrolling
        final newHeight = max(imageHeight - controller.offset, 0.0);
        final normalizedValue = newHeight / imageHeight;
        opacity.value = normalizedValue;
        size.value = normalizedValue;
      });
      return null;
    }, [controller]);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("UseCase: useAnimationController, useScrollController"),
            const SizedBox(height: 20, width: double.maxFinite),
            SizeTransition(
              sizeFactor: size,
              axis: Axis.vertical,
              axisAlignment: -1,
              child: FadeTransition(
                opacity: opacity,
                child: Image.network(
                  url,
                  height: imageHeight,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: controller,
                itemCount: 100,
                itemBuilder: (context, index) {
                  return ListTile(
                    dense: true,
                    title: Text("Person ${index + 1}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
