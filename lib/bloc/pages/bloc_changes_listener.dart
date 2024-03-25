import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/color_bloc.dart';

class BlocChangesListener extends StatelessWidget {
  const BlocChangesListener({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("This widget is updated as per new state"),
        const SizedBox(height: 10),
        BlocConsumer<ColorBloc, ColorState>(
          listenWhen: (previous, current) {
            if (previous is ColorLoading && current is ColorLoaded) return true;
            return false;
          },
          listener: (context, state) {
            if (state is ColorLoaded) {
              const snackBar = SnackBar(
                padding: EdgeInsets.all(10),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.green,
                content: Text("All Colors loaded", style: TextStyle(color: Colors.white)),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            String id = "";
            if (state is ColorLoading) id = state.id;
            if (state is ColorLoaded) id = state.id;

            return Container(
              padding: const EdgeInsets.all(10),
              height: 100,
              width: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(id, textAlign: TextAlign.center),
            );
          },
        ),
      ],
    );
  }
}
