import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

import '../reminder/reminder.dart';

part 'reminder_state.g.dart';

extension ToInt on bool {
  int toInteger() => this ? 1 : 0;
}

extension Sorted on List<Reminder> {
  List<Reminder> sorted() => [...this]..sort(
      (lhs, rhs) {
        final isDone = lhs.isDone.toInteger().compareTo(rhs.isDone.toInteger());

        if (isDone != 0) return isDone;
        return lhs.createdAt.compareTo(rhs.createdAt);
      },
    );
}

class ReminderState = _ReminderState with _$ReminderState;

abstract class _ReminderState with Store {
  @observable
  bool isLoading = false;

  @observable
  String? message;

  @observable
  ObservableList<Reminder> reminders = ObservableList<Reminder>();

  @computed
  ObservableList<Reminder> get sortedReminders =>
      ObservableList.of(reminders.sorted());

  @action
  Future<bool> getReminders() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 2));

    final reminders = [
      Reminder(
        id: const Uuid().v4(),
        createdAt: DateTime.now(),
        text: "Test Reminder",
        isDone: false,
      ),
    ];
    this.reminders = ObservableList.of(reminders);

    isLoading = false;
    return true;
  }

  @action
  Future<bool> add(String reminderName) async {
    await Future.delayed(const Duration(seconds: 1));
    message = "Reminder $reminderName has been added successfully.";

    final reminder = Reminder(
      id: const Uuid().v4(),
      createdAt: DateTime.now(),
      text: reminderName,
      isDone: false,
    );
    reminders.add(reminder);

    await Future.delayed(const Duration(seconds: 1));
    message = null;
    return true;
  }

  @action
  Future<bool> modify(
    Reminder reminder, {
    required bool isDone,
  }) async {
    reminders.firstWhere((element) => element.id == reminder.id).isDone =
        isDone;

    return true;
  }

  @action
  Future<bool> delete(Reminder reminder) async {
    reminders.removeWhere((element) => element.id == reminder.id);
    return true;
  }
}
