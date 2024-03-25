part of 'color_bloc.dart';

@immutable
sealed class ColorState {}

final class ColorLoading extends ColorState {
  final String id;
  ColorLoading() : id = Uuid().v4();
}

final class ColorLoaded extends ColorState {
  final String id;
  final List<Color> colors;
  final Color color;

  ColorLoaded({
    required this.colors,
    required this.color,
  }) : id = Uuid().v4();

  ColorLoaded copyWith({
    List<Color>? colors,
    Color? color,
  }) =>
      ColorLoaded(
        colors: colors ?? this.colors,
        color: color ?? this.color,
      );
}
