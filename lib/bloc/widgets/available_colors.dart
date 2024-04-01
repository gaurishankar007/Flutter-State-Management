import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/color_bloc.dart';

class AvailableColors extends StatelessWidget {
  const AvailableColors({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("Available Colors"),
        const SizedBox(height: 10),
        BlocBuilder<ColorBloc, ColorState>(
          buildWhen: (previous, current) {
            if (previous is ColorLoading && current is ColorLoaded) return true;
            return false;
          },
          builder: (context, state) {
            if (state is ColorLoading) return const SizedBox.shrink();

            log("Search Form");
            return SizedBox(
              width: 300,
              child: TextFormField(
                onChanged: (value) =>
                    context.read<ColorBloc>().add(SearchColorEvent(queries: value)),
                decoration: const InputDecoration(
                  hintText: "Search Colors",
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 10),
        BlocBuilder<ColorBloc, ColorState>(
          buildWhen: (previous, current) {
            bool firstLoaded = previous is ColorLoading && current is ColorLoaded;
            bool newColor = previous is ColorLoaded &&
                current is ColorLoaded &&
                previous.colors != current.colors;
            if (firstLoaded || newColor) return true;
            return false;
          },
          builder: (context, state) {
            if (state is ColorLoaded) {
              log("Available Colors Loaded");
              List<Color> colors = state.colors;

              if (colors.isEmpty) return const Text("No Colors Found");

              return Padding(
                padding: const EdgeInsets.all(10),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: [
                    for (int i = 0; i < colors.length; i++)
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: colors[i],
                          borderRadius: BorderRadius.circular(5),
                        ),
                      )
                  ],
                ),
              );
            }

            return const SizedBox.square(
              dimension: 40,
              child: CircularProgressIndicator(strokeWidth: 2),
            );
          },
        ),
      ],
    );
  }
}
