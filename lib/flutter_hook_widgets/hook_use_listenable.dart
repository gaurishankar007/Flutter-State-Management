import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CountDown extends ValueNotifier<int> {
  late final StreamSubscription<int> subscription;

  CountDown({required int from}) : super(from) {
    final stream = Stream.periodic(const Duration(seconds: 1), (count) => from - (count + 1))
        .takeWhile((value) => value >= 0);

    subscription = stream.listen((count) {
      value = count;
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}

class HookUseListenable extends HookWidget {
  const HookUseListenable({super.key});

  @override
  Widget build(BuildContext context) {
    log("Hook UseListenable");

    /// Creating CountDown and holding is
    /// Avoiding recreation of CountDown after build functions run agains
    final countDown = useMemoized(() => CountDown(from: 20));

    /// Consuming the countDown
    final notifier = useListenable(countDown); // This calls build function again

    return Scaffold(
      appBar: AppBar(title: const Text("Hook UseListenable")),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("UseCase: useMemoized, useListenable"),
            const SizedBox(height: 20, width: double.maxFinite),
            Text(notifier.value.toString()),
          ],
        ),
      ),
    );
  }
}
