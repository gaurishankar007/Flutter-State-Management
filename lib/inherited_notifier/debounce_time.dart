import 'dart:async';

import 'package:flutter/material.dart';

class DebounceTime {
  final Duration delay;
  Timer? _timer;

  DebounceTime({
    required this.delay,
  });

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }
}
