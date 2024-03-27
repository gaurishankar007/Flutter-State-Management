import 'package:flutter_riverpod/flutter_riverpod.dart';

class Film {
  final String id;
  final String title;
  final String description;
  final bool isFavorite;

  const Film({
    required this.id,
    required this.title,
    required this.description,
    required this.isFavorite,
  });

  Film favorite(bool isFavorite) => Film(
        id: id,
        title: title,
        description: description,
        isFavorite: isFavorite,
      );

  @override
  bool operator ==(covariant Film other) => other.id == id && other.isFavorite == isFavorite;

  @override
  int get hashCode => Object.hashAll([id, isFavorite]);
}

const allFilms = [
  Film(
    id: "1",
    title: "Avatar",
    description: "Description of the Avatar",
    isFavorite: false,
  ),
  Film(
    id: "2",
    title: "Inception",
    description: "Description of the Inception",
    isFavorite: false,
  ),
  Film(
    id: "3",
    title: "Andhadhun",
    description: "Description of the Andhadhun",
    isFavorite: false,
  ),
  Film(
    id: "4",
    title: "Arjun The Warrior Prince",
    description: "Description of the Arjun The Warrior Prince",
    isFavorite: false,
  ),
];

enum FavoriteStatus {
  all,
  favorite,
  notFavorite,
}

class FilmStateNotifier extends StateNotifier<List<Film>> {
  FilmStateNotifier() : super(allFilms);

  void update(Film film, bool isFavorite) {
    state = state.map((e) => e.id == film.id ? e.favorite(isFavorite) : e).toList();
  }
}
