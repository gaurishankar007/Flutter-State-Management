import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/count_provider.dart';

class Buttons extends StatefulWidget {
  const Buttons({super.key});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  late final CountProvider countProvider;

  @override
  void initState() {
    super.initState();

    /// Listen false will not notify the changes to avoid rebuilds
    countProvider = Provider.of<CountProvider>(context, listen: false);
  }

  @override
  void dispose() {
    countProvider.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          /// Read does not listen to changes
          onPressed: () => context.read<CountProvider>().start(),
          child: const Text("Start"),
        ),
        ElevatedButton(
          onPressed: () => context.read<CountProvider>().stop(),
          child: const Text("Stop"),
        ),
      ],
    );
  }
}
