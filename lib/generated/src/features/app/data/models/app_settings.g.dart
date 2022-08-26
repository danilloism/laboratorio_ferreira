// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../../src/features/app/data/models/app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppSettings _$$_AppSettingsFromJson(Map<String, dynamic> json) =>
    _$_AppSettings(
      themeMode: $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']),
    );

const _$$_AppSettingsFieldMap = <String, String>{
  'themeMode': 'themeMode',
};

Map<String, dynamic> _$$_AppSettingsToJson(_$_AppSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('themeMode', _$ThemeModeEnumMap[instance.themeMode]);
  return val;
}

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
