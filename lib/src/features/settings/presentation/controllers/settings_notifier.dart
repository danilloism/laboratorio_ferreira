import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/domain/models/models.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/domain/models/models.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../../../../generated/src/features/settings/presentation/controllers/settings_notifier.g.dart';

@Riverpod(keepAlive: true)
class SettingsController extends _$SettingsController {
  @override
  Setting build() {
    return ref.read(settingsRepositoryProvider).activeStored;
  }

  Future<void> changeTheme(ThemeMode mode) async {
    if (mode == state.themeMode) return;
    final done = await ref
        .read(settingsRepositoryProvider)
        .upsertSetting(SettingsItem.themeMode, mode);
    state = done;
  }

  Future<void> changeSession([Session? session]) async {
    if (session == state.session) return;
    final newValue = await ref
        .read(settingsRepositoryProvider)
        .upsertSetting(SettingsItem.session, session);
    state = newValue;
  }

  Future<void> changeUseMaterial3(bool value) async {
    if (value == state.useMaterial3) return;
    final newValue = await ref
        .read(settingsRepositoryProvider)
        .upsertSetting(SettingsItem.useMaterial3, value);
    state = newValue;
  }
}
