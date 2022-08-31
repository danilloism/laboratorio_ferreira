// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../src/core/data/models/setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Setting _$$_SettingFromJson(Map<String, dynamic> json) => _$_Setting(
      themeMode: $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
          ThemeMode.system,
      session: json['session'] == null
          ? null
          : Session.fromJson(json['session'] as Object),
      active: json['active'] as bool? ?? true,
      id: json['id'] as int?,
    );

const _$$_SettingFieldMap = <String, String>{
  'themeMode': 'themeMode',
  'session': 'session',
  'active': 'active',
  'id': 'id',
};

Map<String, dynamic> _$$_SettingToJson(_$_Setting instance) {
  final val = <String, dynamic>{
    'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('session', instance.session);
  val['active'] = instance.active;
  writeNotNull('id', instance.id);
  return val;
}

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
