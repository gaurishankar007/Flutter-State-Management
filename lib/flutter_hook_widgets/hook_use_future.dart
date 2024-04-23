import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HookUseFuture extends HookWidget {
  const HookUseFuture({super.key});

  Future<Image> getImage() async {
    String url =
        "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg";
    final assetBundle = NetworkAssetBundle(Uri.parse(url));
    final byteData = await assetBundle.load(url);
    final data = byteData.buffer.asUint8List();
    return Image.memory(data, height: 200, width: 200);
  }

  @override
  Widget build(BuildContext context) {
    log("Hook UseFuture");

    /// Creating future and holding the complex object [Image]
    final future = useMemoized<Future<Image>>(() => getImage());

    /// Consuming the future
    final snapshot = useFuture(future); // This calls build function again

    return Scaffold(
      appBar: AppBar(title: const Text("Hook UseFuture")),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("UseCase: useMemoized, useFuture"),
            const SizedBox(height: 20, width: double.maxFinite),
            snapshot.hasData ? snapshot.requireData : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
