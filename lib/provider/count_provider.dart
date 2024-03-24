import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';

import 'count_model.dart';

class CountProvider extends ChangeNotifier {
  late String id;
  late CheapCount _cheapCount;
  late ExpensiveCount _expensiveCount;
  late StreamSubscription _cheapSubscription;
  late StreamSubscription _expensiveSubscription;
  bool _started = false;

  CountProvider()
      : id = const Uuid().v4(),
        _cheapCount = CheapCount(0),
        _expensiveCount = ExpensiveCount(0) {
    start();
  }

  @override
  notifyListeners() {
    id = const Uuid().v4();
    super.notifyListeners();
  }

  CheapCount get cheapCount => _cheapCount;
  ExpensiveCount get expensiveCount => _expensiveCount;

  void start() {
    if (_started) return;

    _cheapSubscription =
        Stream.periodic(const Duration(seconds: 1), (int count) => count).listen((count) {
      count++;
      _cheapCount = CheapCount(count);
      notifyListeners();
    });

    _expensiveSubscription =
        Stream.periodic(const Duration(seconds: 5), (int count) => count).listen((count) {
      count++;
      _expensiveCount = ExpensiveCount(count);
      notifyListeners();
    });

    _started = true;
  }

  void stop() {
    _resetCounts();
    _cancelSubscriptions();
    _started = false;
    notifyListeners();
  }

  _resetCounts() {
    _cheapCount = CheapCount(0);
    _expensiveCount = ExpensiveCount(0);
  }

  _cancelSubscriptions() {
    _cheapSubscription.cancel();
    _expensiveSubscription.cancel();
  }
}
