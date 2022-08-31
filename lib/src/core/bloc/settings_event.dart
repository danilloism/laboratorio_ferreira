import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';

part '../../../generated/src/core/bloc/settings_event.freezed.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const SettingsEvent._();

  const factory SettingsEvent.themeModeChanged(ThemeMode mode) =
      _ThemeModeChanged;

  const factory SettingsEvent.activeSettingChanged(Setting setting) =
      _ActiveSettingChanged;
}
