import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FlutterPackage extends StatelessWidget {
  const FlutterPackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        title: const Text("Packages"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: double.maxFinite, height: 20),
            ElevatedButton(
              onPressed: () => context.pushNamed("flutter hooks"),
              child: const Text("Flutter Hooks"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => context.push(
                Uri(
                  path: "/provider",
                  queryParameters: {"title": "Provider"},
                ).toString(),
              ),
              child: const Text("Provider"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => context.pushNamed("bloc"),
              child: const Text("Bloc"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => context.pushNamed("riverpod"),
              child: const Text("Riverpod"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => context.pushNamed("rxDart"),
              child: const Text("Rx Dart"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => context.pushNamed("mobx"),
              child: const Text("Mobx"),
            ),
          ],
        ),
      ),
    );
  }
}
