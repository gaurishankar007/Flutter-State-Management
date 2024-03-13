import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/count_provider.dart';

class CountWidget extends StatelessWidget {
  const CountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    /// Watch listen to the changes
    final countProvider = context.watch<CountProvider>();
    final lastUpdated = DateTime.now().toIso8601String();

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Widget Listening to Provider changes"),
          const SizedBox(height: 10),
          Text("Uuid: ${countProvider.id}"),
          const SizedBox(height: 10),
          Text("Last Updated: $lastUpdated"),
        ],
      ),

      /// Listen to the provider changes
      /// Child will not be rebuilt
      /// Only Column with it's children except the child
      //     Consumer<CountProvider>(
      //   builder: (context, provider, child) {
      //     return Column(
      //       children: [
      //         /// Will  rebuilt
      //         const Text("Widget Listening to Provider changes"),
      //         const SizedBox(height: 10),
      //         Text("Uuid: ${provider.id}"),
      //         const SizedBox(height: 10),

      //         /// Will not rebuilt
      //         child!,
      //       ],
      //     );
      //   },
      //   child: Text("Last Updated: ${DateTime.now().toIso8601String()}"),
      // ),
    );
  }
}
