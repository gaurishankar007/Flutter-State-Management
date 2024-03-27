import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../all_providers.dart';

class CountStreamProviderPage extends StatelessWidget {
  const CountStreamProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stream Provider")),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Stream Value"),
            const SizedBox(width: double.maxFinite, height: 10),
            Consumer(
              builder: (context, ref, child) {
                final AsyncValue<int> count = ref.watch(countStreamProvider(10));
                log("Count Stream");

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      count.when(
                        data: (int value) => value.toString(),
                        error: (Object error, stackTrace) => error.toString(),
                        loading: () => "0",
                      ),
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => ref.invalidate(countStreamProvider),
                      child: const Text("Restart State"),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
