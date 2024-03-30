import 'dart:math';

void main() {
  int? a = 0;
  int? b = 0;
  int sum = a + b;

  log(sum);
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
