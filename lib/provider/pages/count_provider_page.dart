import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../count_provider.dart';
import '../widgets/buttons.dart';
import '../widgets/cheap_count_widget.dart';
import '../widgets/count_widget.dart';
import '../widgets/expensive_count_widget.dart';

class CountProviderPage extends StatelessWidget {
  final String title;
  const CountProviderPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountProvider(),
      child: Scaffold(
        appBar: AppBar(title: Text(title)),
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
