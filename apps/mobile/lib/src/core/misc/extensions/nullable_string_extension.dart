extension IsNullOrBlankExtension on String? {
  bool get isNullOrBlank {
    if (this == null) return true;
    final nonNullValue = this!;
    return nonNullValue.isEmpty;
  }
}
