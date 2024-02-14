import 'package:flutter/material.dart';

import 'count_down_inherited.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final inherited = CountDownInherited.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(child: Text("${inherited.counter}")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => inherited.add(),
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
