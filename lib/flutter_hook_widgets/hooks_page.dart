import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HooksPage extends StatelessWidget {
  const HooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Hooks")),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "Flutter hooks are stateless widget with it's own hooks.",
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.push("/hookUseState"),
              child: const Text("UseState"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.push("/hookUseFuture"),
              child: const Text("UseFuture"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.push("/hookUseListenable"),
              child: const Text("UseListenable"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.push("/hookUseAnimationController"),
              child: const Text("UseAnimationController"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.push("/hookUseStreamController"),
              child: const Text("UseStreamController"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.push("/hookUseReducer"),
              child: const Text("UseReducer"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.push("/hookUseAppLifeCycleState"),
              child: const Text("UseAppLifecycleState"),
            ),
          ],
        ),
      ),
    );
  }
}
