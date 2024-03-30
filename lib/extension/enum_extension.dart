import 'dart:developer';

void main() {
  log(Animal.cat.containsCapitalLetter().toString());
  log(Animal.dog.containsCapitalLetter().toString());
  log(Animal.godFish.containsCapitalLetter().toString());
}

enum Animal {
  cat,
  dog,
  bird,
  godFish,
}

extension on Enum {
  bool containsCapitalLetter() => name.contains(RegExp(r'[A-Z]'));
}
