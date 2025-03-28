import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../all_providers.dart';
import '../notifier/film_state_notifier.dart';

class FilmStateNotifierProviderPage extends StatelessWidget {
  const FilmStateNotifierProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Film State Notifier Provider")),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: double.maxFinite),
            const FavoriteStatusWidget(),
            const SizedBox(height: 20),
            Consumer(
              builder: (context, ref, child) {
                final favoriteStatus = ref.watch(favoriteStatusStateProvider);

                switch (favoriteStatus) {
                  case FavoriteStatus.all:
                    return FilmWidget(provider: filmStateNotifierProvider);
                  case FavoriteStatus.favorite:
                    return FilmWidget(provider: favoriteFilmProvider);
                  case FavoriteStatus.notFavorite:
                    return FilmWidget(provider: notFavoriteFilmProvider);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FilmWidget extends ConsumerWidget {
  final AlwaysAliveProviderBase<Iterable<Film>> provider;
  const FilmWidget({super.key, required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final films = ref.watch(provider);
    log("Films Notifier");

    return Expanded(
      child: ListView.separated(
        itemCount: films.length,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final film = films.elementAt(index);
          final favoriteIcon = Icon(film.isFavorite ? Icons.favorite : Icons.favorite_border);

          return ListTile(
            title: Text(film.title),
            subtitle: Text(film.description),
            trailing: IconButton(
              onPressed: () =>
                  ref.read(filmStateNotifierProvider.notifier).update(film, !film.isFavorite),
              icon: favoriteIcon,
            ),
          );
        },
      ),
    );
  }
}

class FavoriteStatusWidget extends StatelessWidget {
  const FavoriteStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        log("Favorite Status Notifier");

        return DropdownButton(
          value: ref.watch(favoriteStatusStateProvider),
          items: FavoriteStatus.values
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e.name.split(".").last),
                ),
              )
              .toList(),
          onChanged: (value) => ref.read(favoriteStatusStateProvider.notifier).state = value!,
        );
      },
    );
  }
}
