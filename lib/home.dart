import 'package:flutter/material.dart';

import 'InheritedModel/pages/inherited_model_page.dart';
import 'InheritedWidget/pages/inherited_widget_page.dart';
import 'bloc/pages/bloc_page.dart';
import 'inheritedNotifier/pages/inherited_notifier_page.dart';
import 'provider/pages/count_provider_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: double.maxFinite),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (builder) => const InheritedWidgetPage()),
              ),
              child: const Text("Inherited Widget"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (builder) => const InheritedModelPage()),
              ),
              child: const Text("Inherited Model"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (builder) => const InheritedNotifierPage()),
              ),
              child: const Text("Inherited Notifier"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (builder) => const CountProviderPage()),
              ),
              child: const Text("Provider"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (builder) => const BlocPage()),
              ),
              child: const Text("Bloc"),
            ),
          ],
        ),
      ),
    );
  }
}
