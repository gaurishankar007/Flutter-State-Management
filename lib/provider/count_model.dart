import 'package:uuid/uuid.dart';

class CountModel {
  final String id;
  final int count;

  CountModel(this.count) : id = const Uuid().v4();
  
  @override
  bool operator ==(covariant CountModel other) => id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class CheapCount extends CountModel {
  CheapCount(super.count);
}

class ExpensiveCount extends CountModel {
  ExpensiveCount(super.count);
}
