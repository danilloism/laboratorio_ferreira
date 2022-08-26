import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../../generated/src/features/app/data/models/app_settings.freezed.dart';
part '../../../../../generated/src/features/app/data/models/app_settings.g.dart';

@freezed
class AppSettings with _$AppSettings {
  const factory AppSettings({ThemeMode? themeMode}) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);
}
