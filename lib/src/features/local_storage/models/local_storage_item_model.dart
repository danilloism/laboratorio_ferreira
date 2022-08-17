import 'dart:convert';

class LocalStorageItem<T> {
  final String key;
  final T _value;
  String get value => jsonEncode(_value);

  LocalStorageItem(this.key, T value) : _value = value;
}
