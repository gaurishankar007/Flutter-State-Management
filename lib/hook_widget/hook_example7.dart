import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HookExample7 extends HookWidget {
  const HookExample7({super.key});

  String get url =>
      "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg";

  @override
  Widget build(BuildContext context) {
    log("Hook Example7");
    final appLifeCycle = useAppLifecycleState();

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("UseCase: useAppLifeCycleState"),
            const SizedBox(height: 20, width: double.maxFinite),
            Opacity(
              opacity: appLifeCycle == AppLifecycleState.resumed ? 1.0 : 0.5,
              child: Center(child: Image.network(url)),
            ),
          ],
        ),
      ),
    );
  }
}
