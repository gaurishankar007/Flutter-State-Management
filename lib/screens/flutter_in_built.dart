import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FlutterInBuilt extends StatelessWidget {
  const FlutterInBuilt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        title: const Text("Flutter"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: double.maxFinite, height: 20),

            /// Push or Push Named will push a location to the page stack
            ElevatedButton(
              onPressed: () {
                String title = "Stateful Widget";
                context.push("/statefulWidgetLifeCycle/$title");
              },
              child: const Text("Stateful Widget Life Cycle"),
            ),
            const SizedBox(height: 30),

            /// Push or Push Named will push a location to the page stack
            ElevatedButton(
              onPressed: () {
                String title = "Inherited Widget";
                context.push("/inheritedWidget/$title");
              },
              child: const Text("Inherited Widget"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                String title = "Inherited Model";
                context.pushNamed("inherited model", pathParameters: {"title": title});
              },
              child: const Text("Inherited Model"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                String title = "Inherited Notifier";
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
