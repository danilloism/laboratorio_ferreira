import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/domain/models/models.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/domain/models/models.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/settings.dart';

class SettingsNotifier extends StateNotifier<Setting> {
  final SettingsRepository _repo;

  SettingsNotifier({
    required SettingsRepository settingsRepo,
  })  : _repo = settingsRepo,
        super(settingsRepo.activeStored);

  Future<void> changeTheme(ThemeMode mode) async {
    if (mode == state.themeMode) return;
    final done = await _repo.upsertSetting(SettingsItem.themeMode, mode);
    state = done;
  }

  Future<void> changeSession([Session? session]) async {
    if (session == state.session) return;
    final newValue = await _repo.upsertSetting(SettingsItem.session, session);
    state = newValue;
  }

  Future<void> changeUseMaterial3(bool value) async {
    if (value == state.useMaterial3) return;
    final newValue =
        await _repo.upsertSetting(SettingsItem.useMaterial3, value);
    state = newValue;
  }
}

final settingsNotifierProvider =
    StateNotifierProvider<SettingsNotifier, Setting>((ref) =>
        SettingsNotifier(settingsRepo: ref.watch(settingsRepositoryProvider)));
