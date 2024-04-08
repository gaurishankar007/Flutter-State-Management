import 'dart:math';

void main() {
  int? a = 0;
  int? b = 0;
  int sum = a + b;

  log(sum);

  int square1 = 2.square();
  double square2 = 2.5.square();

  log(square1);
  log(square2);
}

/// Allows addition of two nullable value with the result of zero
extension OptionalInfixAddition<T extends num> on T? {
  T operator +(T? other) {
    /// shadow is left side
    final shadow = this;
    if (shadow != null) {
      return shadow + (other ?? 0) as T;
    }

    return ((shadow ?? 0) as T) + (other ?? 0) as T;
  }
}

extension<T extends num> on T {
  T square() => (this * this) as T;
}
