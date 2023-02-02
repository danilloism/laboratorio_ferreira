extension FormattedString<K, V> on Map<K, V> {
  String get formattedString {
    final buffer = StringBuffer()..writeln();
    forEach((key, value) {
      if (value != null) {
        buffer.writeln('$key: $value');
      }
    });

    return buffer.toString();
  }
}
