import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/count_model.dart';
import '../../providers/count_provider.dart';

class CheapCountWidget extends StatelessWidget {
  const CheapCountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    /// if the selected object is different, then the widget will be rebuilt
    final cheapCount = context.select<CountProvider, CheapCount>(
      (provider) => provider.cheapCount,
    );
    final lastUpdated = DateTime.now().toIso8601String();
    debugPrint("Cheap Count Updated");

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Widget Listening to Provider's cheap count only"),
          const SizedBox(height: 10),
          Text("Cheap Count: ${cheapCount.count}"),
          const SizedBox(height: 10),
          Text("Last Updated: $lastUpdated"),
        ],
      ),
    );
  }
}
