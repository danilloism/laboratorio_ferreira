// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:laboratorio_ferreira_mobile/src/features/local_storage/constants/hive_constants.dart';

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(_getStoredThemeMode());
  final _box = Hive.box<String>(HiveBoxesConstants.appConfig.name);

  Future<void> setMode(ThemeMode mode) async {
    final stored = _box.get('themeMode');
    if (mode.name != stored) {
      await _box.put('themeMode', mode.name);
    }
    state = mode;
  }

  Map<ThemeMode, String> get themeModeMap => const {
        ThemeMode.system: 'Sistema',
        ThemeMode.light: 'Claro',
        ThemeMode.dark: 'Escuro',
      };
}

_getStoredThemeMode() {
  final stored =
      Hive.box<String>(HiveBoxesConstants.appConfig.name).get('themeMode');

  return stored == null ? ThemeMode.system : ThemeMode.values.byName(stored);
}
