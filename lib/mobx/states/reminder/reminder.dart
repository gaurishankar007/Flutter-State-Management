import 'package:mobx/mobx.dart';

part 'reminder.g.dart';

class Reminder = _Reminder with _$Reminder;

abstract class _Reminder with Store {
  final String id;
  final DateTime createdAt;

  @observable
  String text;

  @observable
  bool isDone;

  _Reminder({
    required this.id,
    required this.createdAt,
    required this.text,
    required this.isDone,
  });

  @override
  bool operator ==(covariant _Reminder other) {
    return identical(this, other) ||
        (id == other.id &&
            text == other.text &&
            isDone == other.isDone &&
            createdAt == other.createdAt);
  }

  @override
  int get hashCode => Object.hash(id, text, isDone, createdAt);
}
