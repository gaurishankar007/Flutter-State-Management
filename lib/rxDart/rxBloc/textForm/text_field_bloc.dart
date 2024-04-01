import 'package:flutter/foundation.dart' show immutable;
import 'package:rxdart/rxdart.dart';

@immutable
class TextFieldBloc {
  final Sink<String?> setFirstName; // write-only
  final Sink<String?> setLastName; // write-only
  final Stream<String> fullName;

  const TextFieldBloc._({
    required this.setFirstName,
    required this.setLastName,
    required this.fullName,
  });

  void dispose() {
    setFirstName.close();
    setLastName.close();
  }

  factory TextFieldBloc() {
    final firstNameSubject = BehaviorSubject<String?>();
    final lastNameSubject = BehaviorSubject<String?>();

    final Stream<String> fullName = Rx.combineLatest2(
      firstNameSubject.startWith(null),
      lastNameSubject.startWith(null),
      (String? firstName, String? lastName) {
        if (firstName != null && firstName.isNotEmpty && lastName != null && lastName.isNotEmpty) {
          return '$firstName $lastName';
        } else {
          return 'Both first and last name must be provided';
        }
      },
    );

    return TextFieldBloc._(
      setFirstName: firstNameSubject.sink,
      setLastName: lastNameSubject.sink,
      fullName: fullName,
    );
  }
}
