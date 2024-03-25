part of 'color_bloc.dart';

@immutable
sealed class ColorEvent {
  const ColorEvent();
}

class LoadColorEvent extends ColorEvent {}

class ChangeColorEvent extends ColorEvent {}

class SearchColorEvent extends ColorEvent {
  final String queries;

  const SearchColorEvent({required this.queries});
}
