import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RiverpodPage extends StatelessWidget {
  const RiverpodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Riverpod")),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "Riverpod is provided in main app with provider scope.",
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => context.push("/stateProvider"),
              child: const Text("State Provider"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => context.push("/futureProvider"),
              child: const Text("Future Provider"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => context.push("/streamProvider"),
              child: const Text("Stream Provider"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => context.push("/changeNotifierProvider"),
              child: const Text("Change Notifier Provider"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => context.push("/fimStateNotifierProvider"),
              child: const Text("Film State Notifier Provider"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => context.push("/personStateNotifierProvider"),
              child: const Text("Person State Notifier Provider"),
            ),
          ],
        ),
      ),
    );
  }
}
