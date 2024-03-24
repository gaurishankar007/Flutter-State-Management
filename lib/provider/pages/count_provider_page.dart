import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../count_provider.dart';
import 'buttons.dart';
import 'cheap_count_widget.dart';
import 'count_widget.dart';
import 'expensive_count_widget.dart';

class CountProviderPage extends StatelessWidget {
  const CountProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Provider"),
        ),
        body: const SafeArea(
          child: Column(
            children: [
              Text("Provider is provided in this page."),
              SizedBox(height: 50),
              CheapCountWidget(),
              SizedBox(height: 50),
              ExpensiveCountWidget(),
              SizedBox(height: 50),
              CountWidget(),
              SizedBox(height: 50),
              Buttons(),
            ],
          ),
        ),
      ),
    );
  }
}
