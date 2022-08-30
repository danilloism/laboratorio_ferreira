import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/src/core/data/models/roles.dart';

class DateTimeConverter extends TypeConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromSql(String fromDb) {
    final parsed = DateTime.parse(fromDb);
    if (fromDb.endsWith('Z') || fromDb.endsWith('z')) return parsed;

    return parsed.toLocal();
  }

  @override
  String toSql(DateTime value) => value.toIso8601String();
}

class CategoriasConverter extends TypeConverter<Set<Roles>, String> {
  const CategoriasConverter();

  @override
  Set<Roles> fromSql(String fromDb) {
    final data = jsonDecode(fromDb);
    final decoded = data['body'] as List<int>;

    return decoded.map((index) => Roles.values[index]).toSet();
  }

  @override
  String toSql(Set<Roles> value) =>
      jsonEncode(value.map((categoria) => categoria.index).toList());
}

class TelefonesConverter extends TypeConverter<Set<String>, String> {
  const TelefonesConverter();

  @override
  Set<String> fromSql(String fromDb) {
    final data = jsonDecode(fromDb);
    final decoded = data['body'] as List<String>;

    return decoded.toSet();
  }

  @override
  String toSql(Set<String> value) => jsonEncode(value.toList());
}

class BoolConverter extends TypeConverter<bool, int> {
  const BoolConverter();

  @override
  bool fromSql(int fromDb) => fromDb as bool;

  @override
  int toSql(bool value) => value as int;
}

class NullableBoolConverter extends TypeConverter<bool?, int?> {
  const NullableBoolConverter();

  @override
  bool? fromSql(int? fromDb) => fromDb as bool?;

  @override
  int? toSql(bool? value) => value as int?;
}

class ThemeModeConverter extends TypeConverter<ThemeMode, int> {
  const ThemeModeConverter();

  @override
  ThemeMode fromSql(int fromDb) => ThemeMode.values[fromDb];

  @override
  int toSql(ThemeMode value) => value.index;
}
