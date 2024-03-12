import 'package:flutter/material.dart';

import 'pages/home.dart';

void main() {
  runApp(const InheritedApp());
}

class InheritedApp extends StatelessWidget {
  const InheritedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter State Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
