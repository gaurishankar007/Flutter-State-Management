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
            const Text("Behavior Subject Functionalities"),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => context.push("/stringStreaming"),
              child: const Text("String Streaming"),
            ),
            const SizedBox(height: 30, width: double.maxFinite),
            ElevatedButton(
              onPressed: () => context.push("/stateStreaming"),
              child: const Text("State Streaming"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => context.push("/filterStreaming"),
              child: const Text("Filter Streaming"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => context.push("/textFieldValidation"),
              child: const Text("Text Field Validation"),
            ),
          ],
        ),
      ),
    );
  }
}
