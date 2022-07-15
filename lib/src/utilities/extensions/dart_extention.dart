import 'dart:math' as math show Random;

extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(math.Random().nextInt(length));
}

extension Items<T> on Iterable<T> {
  T? getFirstElement() => isNotEmpty ? first : null;
}

extension Validation on dynamic {
  bool valid() {
    if (this != null && this is String) {
      return this.isNotEmpty;
    }
    return false;
  }
}
