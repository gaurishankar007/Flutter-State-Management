import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/color_bloc.dart';
import '../widgets/available_colors.dart';
import '../widgets/bloc_changes_listener.dart';
import '../widgets/selected_color.dart';

class BlocPage extends StatefulWidget {
  const BlocPage({super.key});

  @override
  State<BlocPage> createState() => _BlocPageState();
}

class _BlocPageState extends State<BlocPage> {
  late final ColorBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<ColorBloc>();
  }

  @override
  void dispose() {
    bloc.add(const SearchColorEvent(queries: ""));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bloc")),
      body: SafeArea(
        child: ListView(
          children: const [
            SizedBox(height: 20),
            Center(child: Text("Bloc is provided before initializing material app.")),
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
