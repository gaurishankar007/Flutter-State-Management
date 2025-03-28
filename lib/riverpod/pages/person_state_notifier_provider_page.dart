import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../all_providers.dart';

class PersonStateNotifierProviderPage extends ConsumerWidget {
  const PersonStateNotifierProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.watch(personStateNotifierProvider
        .select((p) => (p.name, p.age))); // Ignores address changes
    final notifier = ref.read(personStateNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text("Person State Notifier Provider Detail")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${person.$1}", style: TextStyle(fontSize: 18)),
            Text("Age: ${person.$2}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: "Update Name"),
              onChanged: (value) => notifier.updateName(value),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Update Age"),
              onChanged: (value) => notifier.updateAge(value),
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Update Address"),
              onChanged: (value) =>
                  notifier.updateAddress(value), // Won't trigger rebuild
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => notifier.resetPerson(),
              child: Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}
