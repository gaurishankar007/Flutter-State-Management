import 'package:flutter/material.dart';

import 'count_down_inherited.dart';
import 'first_page.dart';
import 'second_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final inherited = CountDownInherited.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text("Counter: ${inherited.counter}")),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (builder) => const FirstPage()),
              ),
              child: const Text("First Page"),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (builder) => const SecondPage()),
              ),
              child: const Text("Second Page"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => inherited.add(),
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
