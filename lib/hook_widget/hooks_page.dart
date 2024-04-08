import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HooksPage extends StatelessWidget {
  const HooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "Flutter hooks are stateless widget and manage states with hooks.",
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.push("/hookExample1"),
              child: const Text("TextEditingController State"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.push("/hookExample2"),
              child: const Text("Future"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.push("/hookExample3"),
              child: const Text("Listenable"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.push("/hookExample4"),
              child: const Text("AnimationController ScrollController"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.push("/hookExample5"),
              child: const Text("StreamController"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.push("/hookExample6"),
              child: const Text("Reducer"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.push("/hookExample7"),
              child: const Text("AppLifecycleState"),
            ),
          ],
        ),
      ),
    );
  }
}
