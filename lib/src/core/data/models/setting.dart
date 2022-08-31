import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/models/session.dart';

part '../../../../generated/src/core/data/models/setting.freezed.dart';

@freezed
class Setting with _$Setting {
  const factory Setting({
    @Default(ThemeMode.system) ThemeMode themeMode,
    Session? session,
    @Default(true) bool active,
  }) = _Setting;
}
