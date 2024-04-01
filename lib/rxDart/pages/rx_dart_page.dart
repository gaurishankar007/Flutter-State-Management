import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RxDartPage extends StatelessWidget {
  const RxDartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rx Dart")),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.push("/streamCombination"),
              child: const Text("Stream Combination"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => context.push("/stringStreaming"),
              child: const Text("String Streaming (BehaviorSubject)"),
            ),
            const SizedBox(height: 30, width: double.maxFinite),
            ElevatedButton(
              onPressed: () => context.push("/stateStreaming"),
              child: const Text("State Streaming (BehaviorSubject)"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => context.push("/filterStreaming"),
              child: const Text("Filter Streaming (Behavior Subject)"),
            ),
          ],
        ),
      ),
    );
  }
}
