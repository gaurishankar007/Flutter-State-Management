import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HookUseState extends HookWidget {
  const HookUseState({super.key});

  @override
  Widget build(BuildContext context) {
    log("Hook UseState");
    final controller = useTextEditingController();
    final text = useState(""); // This calls build function again

    useEffect(
      () {
        controller.addListener(() {
          text.value = controller.text;
        });
        return null;
      },
      // Avoiding rebuilt after hot reload by watching controller
      // Because useEffect has no memory reference
      [controller],
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Hook UseState")),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("UseCase: useTextEditingController, useState, useEffect"),
            const SizedBox(height: 20, width: double.maxFinite),
            SizedBox(
              width: MediaQuery.of(context).size.width * .6,
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text("You typed: ${text.value}")
          ],
        ),
      ),
    );
  }
}
