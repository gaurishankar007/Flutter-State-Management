import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../count_provider.dart';
import 'buttons.dart';
import 'cheap_count_widget.dart';
import 'count_widget.dart';
import 'expensive_count_widget.dart';

class CountProviderPage extends StatelessWidget {
  final String title;
  const CountProviderPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountProvider(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
          title: Text(title),
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
