import 'package:flutter/foundation.dart' show immutable;

import 'thing.dart';

enum AnimalType { cat, dog, bird, unknown }

@immutable
class Animal extends Thing {
  final AnimalType type;

  const Animal({
    required super.name,
    required this.type,
  });

  @override
  String toString() => "Animal, name: $name, type: $type";

  factory Animal.fromJson(Map<String, dynamic> json) {
    String rawAnimalType = (json["type"] as String).toLowerCase().trim();
    final AnimalType animalType;

    switch (rawAnimalType) {
      case "bird":
        animalType = AnimalType.bird;
        break;
      case "dog":
        animalType = AnimalType.dog;
        break;
      case "cat":
        animalType = AnimalType.cat;
        break;
      default:
        animalType = AnimalType.unknown;
    }

    return Animal(
      name: json["name"] as String,
      type: animalType,
    );
  }
}
