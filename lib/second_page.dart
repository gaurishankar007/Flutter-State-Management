import 'package:flutter/material.dart';

import 'count_down_inherited.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final inherited = CountDownInherited.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(child: Text("${inherited.counter}")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => inherited.subtract(),
        child: const Icon(Icons.minimize),
      ),
    );
  }
}
