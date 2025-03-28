import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class PersonDetail {
  final String uuid;
  final String name;
  final String age;
  final String address;

  PersonDetail({
    required this.name,
    required this.age,
    required this.address,
    String? uuid,
  }) : uuid = uuid ?? const Uuid().v4();

  const PersonDetail.empty()
      : name = "",
        age = "",
        address = "",
        uuid = "";

  String get displayData => "$name is $age years old.";

  PersonDetail update([String? name, String? age, String? address]) =>
      PersonDetail(
        name: name ?? this.name,
        age: age ?? this.age,
        address: address ?? this.address,
        uuid: uuid,
      );

  @override
  bool operator ==(covariant PersonDetail other) => other.uuid == uuid;

  @override
  int get hashCode => uuid.hashCode;
}

class PersonStateNotifier extends StateNotifier<PersonDetail> {
  PersonStateNotifier() : super(PersonDetail.empty());

  void updateName(String newName) {
    state = state.update(newName, null, null);
  }

  void updateAge(String newAge) {
    state = state.update(null, newAge, null);
  }

  void updateAddress(String newAddress) {
    state = state.update(null, null, newAddress);
  }

  void resetPerson() {
    state = PersonDetail.empty();
  }
}
