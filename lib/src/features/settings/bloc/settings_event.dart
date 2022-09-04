import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/data/models/setting.dart';

part '../../../../generated/src/features/settings/bloc/settings_event.freezed.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const SettingsEvent._();

  const factory SettingsEvent.themeModeChanged(ThemeMode mode) =
      _ThemeModeChanged;

  const factory SettingsEvent.activeSettingChanged(Setting setting) =
      _ActiveSettingChanged;
}
