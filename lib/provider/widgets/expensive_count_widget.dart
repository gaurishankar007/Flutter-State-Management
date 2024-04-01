import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../count_model.dart';
import '../count_provider.dart';

class ExpensiveCountWidget extends StatelessWidget {
  const ExpensiveCountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final expensiveCount = context.select<CountProvider, ExpensiveCount>(
      (provider) => provider.expensiveCount,
    );
    final lastUpdated = DateTime.now().toIso8601String();
    log("Expensive Count Updated");

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Widget Listening to Provider's expensive count only"),
          const SizedBox(height: 10),
          Text("Expensive Count: ${expensiveCount.count}"),
          const SizedBox(height: 10),
          Text("Last Updated: $lastUpdated"),
        ],
      ),
    );
  }
}
