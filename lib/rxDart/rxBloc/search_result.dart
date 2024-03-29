import 'package:flutter/foundation.dart' show immutable;
import '../model/thing.dart';

@immutable
abstract class SearchResult {
  const SearchResult();
}

@immutable
class SearchResultLoading implements SearchResult {
  const SearchResultLoading();
}

@immutable
class SearchResultError implements SearchResult {
  final Object error;
  const SearchResultError(this.error);
}

@immutable
class SearchResultEmpty implements SearchResult {
  const SearchResultEmpty();
}

@immutable
class SearchResultWithResult implements SearchResult {
  final List<Thing> results;
  const SearchResultWithResult(this.results);
}
