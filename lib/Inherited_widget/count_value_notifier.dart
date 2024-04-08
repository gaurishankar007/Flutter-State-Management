import 'package:flutter/foundation.dart';

class CountValueNotifier extends ValueNotifier<int> {
  CountValueNotifier() : super(1);

  add() => value++;

  subtract() => value--;
}
