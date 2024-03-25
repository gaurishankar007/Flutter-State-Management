import 'package:flutter/material.dart';

import 'available_colors.dart';
import 'bloc_changes_listener.dart';
import 'selected_color.dart';

class BlocPage extends StatelessWidget {
  const BlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bloc")),
      body: const SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text("Bloc is provided before initializing material app."),
            SizedBox(height: 30),
            BlocChangesListener(),
            SizedBox(height: 50, width: double.maxFinite),
            AvailableColors(),
            SizedBox(height: 50),
            SelectedColor(),
          ],
        ),
      ),
    );
  }
}
