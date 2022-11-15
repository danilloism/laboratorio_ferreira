// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../../src/features/settings/domain/models/setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Setting _$$_SettingFromJson(Map<String, dynamic> json) => _$_Setting(
      session: json['session'] == null
          ? null
          : Session.fromJson(json['session'] as Object),
      themeMode: $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
          ThemeMode.system,
    );

const _$$_SettingFieldMap = <String, String>{
  'session': 'session',
  'themeMode': 'themeMode',
};

Map<String, dynamic> _$$_SettingToJson(_$_Setting instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('session', instance.session?.toJson());
  val['themeMode'] = _$ThemeModeEnumMap[instance.themeMode]!;
  return val;
}

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
