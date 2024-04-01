import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/color_bloc.dart';

class SelectedColor extends StatelessWidget {
  const SelectedColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        const Text("Selected Color"),
        const SizedBox(height: 10),
        BlocBuilder<ColorBloc, ColorState>(
          buildWhen: (previous, current) {
            bool firstLoaded = previous is ColorLoading && current is ColorLoaded;
            bool newColor = previous is ColorLoaded &&
                current is ColorLoaded &&
                previous.color != current.color;
            if (firstLoaded || newColor) return true;
            return false;
          },
          builder: (context, state) {
            Color color = Colors.transparent;
            Widget? child = const Text("Loading...");

            if (state is ColorLoaded) {
              log("New Color Selected");

              color = state.color;
              child = null;
            }
            return Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: color,
                border: child == null ? null : Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(5),
              ),
              alignment: Alignment.center,
              child: child,
            );
          },
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Green color selected:"),
            const SizedBox(width: 10),
            BlocSelector<ColorBloc, ColorState, bool>(
              selector: (state) {
                if (state is ColorLoaded && state.color == Colors.green) return true;
                return false;
              },
              builder: (context, isGreenColor) {
                log("Green Color Selected");
                return Checkbox(
                  value: isGreenColor,
                  activeColor: Colors.green,
                  onChanged: (value) {},
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // ColorBloc bloc = context.read<ColorBloc>();
            /// OR

            ColorBloc bloc = BlocProvider.of<ColorBloc>(context, listen: false);
            bloc.add(ChangeColorEvent());
          },
          child: const Text("Change Color"),
        ),
      ],
    );
  }
}
