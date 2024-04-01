import 'package:flutter/foundation.dart' show immutable;

enum LivingBeingType { animal, person }

@immutable
class LivingBeing {
  final LivingBeingType type;
  final String name;

  const LivingBeing({
    required this.type,
    required this.name,
  });
}
