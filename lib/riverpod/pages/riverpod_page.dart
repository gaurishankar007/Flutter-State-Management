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
            const Center(child: Text("Riverpod is provided in main app with provider scope.")),
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
              onPressed: () => context.push("/stateNotifierProvider"),
              child: const Text("State Notifier Provider"),
            ),
          ],
        ),
      ),
    );
  }
}
