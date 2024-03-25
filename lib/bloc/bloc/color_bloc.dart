import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  List<Color> colors = [];
  Color color = Colors.black;

  final Map<String, Color> _colorMap = {
    "green": Colors.green,
    "red": Colors.red,
    "blue": Colors.blue,
    "indigo": Colors.indigo,
    "purple": Colors.purple,
    "pink": Colors.pink,
    "orange": Colors.orange,
    "brown": Colors.brown,
    "yellow": Colors.yellow,
    "amber": Colors.amber,
    "cyan": Colors.cyan,
    "teal": Colors.teal,
  };

  ColorBloc() : super(ColorLoading()) {
    on<LoadColorEvent>(_loadColors);
    on<ChangeColorEvent>(_changeColor);
    on<SearchColorEvent>(_searchColor);
    on<ResetColorEvent>(_resetColors);
  }

  ColorLoaded get _loadedState => ColorLoaded(colors: colors, color: color);

  _loadColors(LoadColorEvent event, emit) async {
    await Future.delayed(const Duration(seconds: 5));

    colors = _colorMap.values.map((e) => e).toList();

    emit(_loadedState);
  }

  _changeColor(ChangeColorEvent event, emit) {
    if (state is ColorLoading) return;

    int index = Random().nextInt(colors.length);
    Color newColor = colors[index];

    if (newColor != color) {
      color = newColor;
      emit(_loadedState.copyWith(color: color));
    } else {
      add(ChangeColorEvent());
    }
  }

  _searchColor(SearchColorEvent event, emit) {
    String queries = event.queries.trim();
    if (queries.isEmpty) return emit(_loadedState);

    List<Color> searchedColors = [];
    _colorMap.forEach((key, value) {
      if (key.contains(queries)) searchedColors.add(value);
    });

    emit(_loadedState.copyWith(colors: searchedColors));
  }

  _resetColors(ResetColorEvent event, emit) {
    color = Colors.black;
    colors = _colorMap.values.map((e) => e).toList();
    emit(_loadedState);
  }
}
