import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/domain/models/models.dart';

part '../../../../../generated/src/features/settings/domain/models/setting.freezed.dart';

@freezed
class Setting with _$Setting {
  const factory Setting({
    Session? session,
    @Default(ThemeMode.system) ThemeMode themeMode,
    @Default(true) bool useMaterial3,
  }) = _Setting;
}
