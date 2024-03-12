import 'package:flutter/foundation.dart';

class CountValueNotifier extends ValueNotifier {
  CountValueNotifier() : super(1);

  add() => value++;

  subtract() => value--;
}
