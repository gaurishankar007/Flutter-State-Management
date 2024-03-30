import 'dart:developer';

void main() {
  final map = {
    "name": "Foo",
    "age": 20,
  };

  final String age = map.find("age", (age) => "Your age is $age.");
  final String address = map.find("agee", (address) => "Your address is $address.");

  log(age);
  log(address);
}

/// Finds value from a map and returns a new value with the function
extension Find<K, V, R> on Map<K, V> {
  R? find<T>(K key, R? Function(T value) cast) {
    final value = this[key];

    if (value != null && value is T) return cast(value as T);
    return null;
  }
}
