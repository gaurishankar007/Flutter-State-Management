import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../all_providers.dart';

class CountStateProviderPage extends ConsumerWidget {
  const CountStateProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// It will rebuild the whole scaffold
    final count = ref.watch(countStateProvider);
    log("Count State");

    ref.listen(countStateProvider, (previous, current) {
      if (previous == 5 && current > 5) {
        const snackBar = SnackBar(
          padding: EdgeInsets.all(10),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green,
          content: Text("Count exceeded 5", style: TextStyle(color: Colors.white)),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text("State Provider")),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: double.maxFinite),
            Text(
              count.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () => ref.read(countStateProvider.notifier).state++,
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => ref.read(countStateProvider.notifier).state--,
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // ref.invalidate(countProvider);
                /// OR
                /// refresh returns the initial state after resetting the state
                final initialValue = ref.refresh(countStateProvider);
                log("$initialValue");
              },
              child: const Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}
