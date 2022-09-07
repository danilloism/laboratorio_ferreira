extension NullableStringExt on String? {
  bool get isEmpty {
    if (this == null) return true;
    final nonNullValue = this!;
    return nonNullValue.isEmpty;
  }
}
