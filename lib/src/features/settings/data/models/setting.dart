import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';

part '../../../../../generated/src/features/settings/data/models/setting.freezed.dart';
part '../../../../../generated/src/features/settings/data/models/setting.g.dart';

@freezed
class Setting with _$Setting {
  const factory Setting({
    Session? session,
    @Default(ThemeMode.system) ThemeMode themeMode,
  }) = _Setting;

  factory Setting.fromJson(Map<String, dynamic> json) =>
      _$SettingFromJson(json);
}
