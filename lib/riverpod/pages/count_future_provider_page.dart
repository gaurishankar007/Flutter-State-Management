import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../all_providers.dart';

class CountFutureProviderPage extends ConsumerStatefulWidget {
  const CountFutureProviderPage({super.key});

  @override
  ConsumerState<CountFutureProviderPage> createState() => _CountFutureProviderPageState();
}

class _CountFutureProviderPageState extends ConsumerState<CountFutureProviderPage> {
  @override
  Widget build(BuildContext context) {
    final AsyncValue<int> count = ref.watch(countFutureProvider);
    log("Count Future");

    return Scaffold(
      appBar: AppBar(title: const Text("Future Provider")),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Future Value"),
            const SizedBox(width: double.maxFinite, height: 10),
            count.when(
              data: (data) => Text(
                data.toString(),
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => ref.read(countStateProvider2.notifier).state = 19,
              child: const Text("Find Square of 19"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => ref.read(countStateProvider2.notifier).state = 3796,
              child: const Text("Find Square of 3796"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => ref.invalidate(countStateProvider2),
              child: const Text("Reset Count State"),
            ),
            const SizedBox(height: 5),
            const Text("This will reset count provider value and future provide will be rebuilt"),
          ],
        ),
      ),
    );
  }
}
