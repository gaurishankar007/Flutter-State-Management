import 'dart:convert';
import 'dart:io';

import '../model/thing.dart';

import '../model/animal.dart';
import '../model/person.dart';

typedef SearchTerm = String;

class Api {
  List<Animal>? _animals;
  List<Person>? _persons;
  Api();

  Future<List<Thing>> search(SearchTerm searchTerm) async {
    final term = searchTerm.trim().toLowerCase();

    // search in the cache
    final cacheResults = _extractThingsUsingSearchTerm(term);
    if (cacheResults != null) return cacheResults;

    // start calling api
    final persons = await _getJson("http://192.168.1.80:5500/lib/rxDart/json/persons.json")
        .then((json) => json.map((e) => Person.fromJson(e)));
    _persons = persons.toList();

    final animals = await _getJson("http://192.168.1.80:5500/lib/rxDart/json/animals.json")
        .then((json) => json.map((e) => Animal.fromJson(e)));
    _animals = animals.toList();

    return _extractThingsUsingSearchTerm(term) ?? [];
  }

  List<Thing>? _extractThingsUsingSearchTerm(SearchTerm term) {
    final cachedAnimals = _animals;
    final cachedPersons = _persons;

    if (cachedAnimals != null && cachedPersons != null) {
      List<Thing> result = [];

      // animal loop
      for (final animal in cachedAnimals) {
        if (animal.name.trimmedContains(term) || animal.type.name.trimmedContains(term)) {
          result.add(animal);
        }
      }
      // person loop
      for (final person in cachedPersons) {
        if (person.name.trimmedContains(term) || person.age.toString().trimmedContains(term)) {
          result.add(person);
        }
      }

      return result;
    }

    return null;
  }

  Future<List<dynamic>> _getJson(String url) async {
    Uri uri = Uri.parse(url);
    HttpClientRequest request = await HttpClient().getUrl(uri);
    HttpClientResponse response = await request.close();
    String jsonString = await response.transform(utf8.decoder).join();

    final list = json.decode(jsonString) as List;
    return list;
  }
}

extension TrimmedCaseInsensitiveContain on String {
  bool trimmedContains(String other) => trim().toLowerCase().contains(other.trim().toLowerCase());
}
