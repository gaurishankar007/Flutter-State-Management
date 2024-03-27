import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Person {
  final String uuid;
  final String name;
  final String age;

  Person({
    required this.name,
    required this.age,
    String? uuid,
  }) : uuid = uuid ?? const Uuid().v4();

  String get displayData => "$name is $age years old.";

  Person update([String? name, String? age]) => Person(
        name: name ?? this.name,
        age: age ?? this.age,
        uuid: uuid,
      );

  @override
  bool operator ==(covariant Person other) => other.uuid == uuid;

  @override
  int get hashCode => uuid.hashCode;
}

class PersonChangeNotifier extends ChangeNotifier {
  final List<Person> _persons = [];

  int get count => _persons.length;
  UnmodifiableListView<Person> get persons => UnmodifiableListView(_persons);

  addPerson(Person person) {
    _persons.add(person);
    notifyListeners();
  }

  removePerson(Person person) {
    _persons.remove(person);
    notifyListeners();
  }

  update(Person updatePerson) {
    final index = _persons.indexOf(updatePerson);
    final oldPerson = _persons[index];

    if (oldPerson.name != updatePerson.name || oldPerson.age != updatePerson.age) {
      _persons[index] = oldPerson.update(updatePerson.name, updatePerson.age);
      notifyListeners();
    }
  }
}
