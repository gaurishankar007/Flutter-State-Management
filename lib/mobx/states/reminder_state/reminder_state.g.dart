// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReminderState on _ReminderState, Store {
  Computed<ObservableList<Reminder>>? _$sortedRemindersComputed;

  @override
  ObservableList<Reminder> get sortedReminders => (_$sortedRemindersComputed ??=
          Computed<ObservableList<Reminder>>(() => super.sortedReminders,
              name: '_ReminderState.sortedReminders'))
      .value;

  late final _$isLoadingAtom =
      Atom(name: '_ReminderState.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$messageAtom =
      Atom(name: '_ReminderState.message', context: context);

  @override
  String? get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String? value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$remindersAtom =
      Atom(name: '_ReminderState.reminders', context: context);

  @override
  ObservableList<Reminder> get reminders {
    _$remindersAtom.reportRead();
    return super.reminders;
  }

  @override
  set reminders(ObservableList<Reminder> value) {
    _$remindersAtom.reportWrite(value, super.reminders, () {
      super.reminders = value;
    });
  }

  late final _$getRemindersAsyncAction =
      AsyncAction('_ReminderState.getReminders', context: context);

  @override
  Future<bool> getReminders() {
    return _$getRemindersAsyncAction.run(() => super.getReminders());
  }

  late final _$addAsyncAction =
      AsyncAction('_ReminderState.add', context: context);

  @override
  Future<bool> add(String reminderName) {
    return _$addAsyncAction.run(() => super.add(reminderName));
  }

  late final _$modifyAsyncAction =
      AsyncAction('_ReminderState.modify', context: context);

  @override
  Future<bool> modify(Reminder reminder, {required bool isDone}) {
    return _$modifyAsyncAction
        .run(() => super.modify(reminder, isDone: isDone));
  }

  late final _$deleteAsyncAction =
      AsyncAction('_ReminderState.delete', context: context);

  @override
  Future<bool> delete(Reminder reminder) {
    return _$deleteAsyncAction.run(() => super.delete(reminder));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
message: ${message},
reminders: ${reminders},
sortedReminders: ${sortedReminders}
    ''';
  }
}
