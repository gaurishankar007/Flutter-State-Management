import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc/color_bloc.dart';
import 'routes/go_router.dart';

void main() {
  runApp(const InheritedApp());
}

class InheritedApp extends StatelessWidget {
  const InheritedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ColorBloc>(
      lazy: false,
      create: (context) => ColorBloc()..add(LoadColorEvent()),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter State Management',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: goRouter,
      ),
    );
  }
}
