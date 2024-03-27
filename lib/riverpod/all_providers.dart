import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'notifier/film_state_notifier.dart';
import 'notifier/person_change_notifier.dart';
import 'repository/repository.dart';

/// Provider
final repositoryProvider = Provider<Repository>((ref) => RepositoryImplementation());

/// State Provider
final countStateProvider = StateProvider<int>((ref) => 0);

/// Future Provider
/// Auto Dispose will reset the state after the widget has been dispose
final countFutureProvider = FutureProvider.autoDispose<int>((ref) {
  final count = ref.watch(countStateProvider2);

  final repository = ref.read(repositoryProvider);

  return repository.getSquare(count);
});
final countStateProvider2 = StateProvider.autoDispose<int>((ref) => 0);

/// Stream Provider
final countStreamProvider = StreamProvider.autoDispose.family<int, int>((ref, initialValue) {
  final repository = ref.read(repositoryProvider);
  return repository.getCountStream(initialValue);
});

/// Change Notifier Provider
final personChangeNotifierProvider =
    ChangeNotifierProvider.autoDispose<PersonChangeNotifier>((ref) => PersonChangeNotifier());

/// State Notifier Provider
final filmStateNotifierProvider =
    StateNotifierProvider<FilmStateNotifier, List<Film>>((ref) => FilmStateNotifier());
final favoriteStatusStateProvider = StateProvider<FavoriteStatus>((ref) => FavoriteStatus.all);
final favoriteFilmProvider =
    Provider((ref) => ref.watch(filmStateNotifierProvider).where((e) => e.isFavorite));
final notFavoriteFilmProvider =
    Provider((ref) => ref.watch(filmStateNotifierProvider).where((e) => !e.isFavorite));
