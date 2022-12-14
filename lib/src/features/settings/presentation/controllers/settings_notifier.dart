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
    return ref.read(settingsRepositoryProvider).current;
  }

  Future<void> changeTheme(ThemeMode mode) async {
    if (mode == state.themeMode) return;
    await ref.read(settingsRepositoryProvider).setThemeMode(mode);
    state = state.copyWith(themeMode: mode);
  }

  Future<void> changeSession([Session? session]) async {
    if (session == state.session) return;
    await ref.read(settingsRepositoryProvider).setSession(session);
    state = state.copyWith(session: session);
  }

  Future<void> useMaterial3(bool value) async {
    if (value == state.useMaterial3) return;
    await ref.read(settingsRepositoryProvider).setUseMaterial3(value);
    state = state.copyWith(useMaterial3: value);
  }
}
