import 'package:flutter/foundation.dart' show immutable;

import 'thing.dart';

@immutable
class Man extends Thing {
  final int age;

  const Man({
    required super.name,
    required this.age,
  });

  @override
  String toString() => "Person, name: $name, age: $age";

  Man.fromJson(Map<String, dynamic> json)
      : age = json["age"] as int,
        super(name: json["name"] as String);
}
