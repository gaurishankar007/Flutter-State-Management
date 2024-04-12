import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FlutterInBuilt extends StatelessWidget {
  const FlutterInBuilt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("State Management With Flutter In Built Methods"),
            const SizedBox(width: double.maxFinite, height: 20),

            /// Push or Push Named will push a location to the page stack
            ElevatedButton(
              onPressed: () {
                String title = "How build works in stateful widget";
                context.push("/statefulWidgetLifeCycle/$title");
              },
              child: const Text("Stateful Widget Life Cycle"),
            ),
            const SizedBox(height: 30),

            /// Push or Push Named will push a location to the page stack
            ElevatedButton(
              onPressed: () {
                String title = "Inherited Widget With Value Notifier";
                context.push("/inheritedWidget/$title");
              },
              child: const Text("Inherited Widget"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                String title = "Inherited Model With Change Notifier";
                context.pushNamed("inherited model", pathParameters: {"title": title});
              },
              child: const Text("Inherited Model"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                String title = "Inherited Notifier With Change Notifier";
                context.pushNamed("inherited notifier", queryParameters: {"title": title});
              },
              child: const Text("Inherited Notifier"),
            ),
          ],
        ),
      ),
    );
  }
}
