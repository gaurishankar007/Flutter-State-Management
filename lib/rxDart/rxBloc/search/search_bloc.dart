import 'package:flutter/foundation.dart' show immutable;
import 'package:rxdart/rxdart.dart';

import '../../model/thing.dart';
import '../../repository/api.dart';
import 'search_result.dart';

/// It is not a flutter_bloc or any other package
/// It is a custom class for managing state
@immutable
class SearchBloc {
  final Sink<String> search;
  final Stream<SearchResult?> results;

  /// Private constructor to avoid creating these instance parameters
  /// The factory constructor will create these instance parameters
  const SearchBloc._({required this.search, required this.results});

  /// Sink always should be disposed
  void dispose() {
    search.close();
  }

  factory SearchBloc({required Api api}) {
    final textController = BehaviorSubject<String>();

    Stream<String> stringStream = textController
        .distinct()
        // Waits duration before emitting data
        .debounceTime(const Duration(milliseconds: 500));

    // Change data types asynchronously
    Stream<SearchResult?> resultStream = stringStream.switchMap<SearchResult?>(
      (String searchTerm) {
        // If text field is empty, then return null i.e snapshot will not have data
        if (searchTerm.isEmpty) return Stream<SearchResult?>.value(null);

        // returns a stream from a future function
        Stream<List<Thing>> thingListStream =
            Rx.fromCallable(() => api.search(searchTerm)).delay(const Duration(seconds: 1));

        // Change data types synchronously from List of Thing to SearchResult
        Stream<SearchResult?> searchResultStream = thingListStream
            .map<SearchResult?>((results) {
              if (results.isEmpty) return const SearchResultEmpty();
              return SearchResultWithResult(results);
            })
            // Starting the stream from loading state
            .startWith(const SearchResultLoading())
            // Emitting error whenever error occurs i.e while fetching data from api
            .onErrorReturnWith((error, _) => SearchResultError(error));

        return searchResultStream;
      },
    );

    return SearchBloc._(search: textController.sink, results: resultStream);
  }
}
