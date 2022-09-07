import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/src/config/config.dart';

class AppTheme {
  AppTheme._();

  static ColorScheme get _lightSeedColorScheme => SeedColorScheme.fromSeeds(
        brightness: Brightness.light,
        primaryKey: Cores.verdeEscuro,
        secondaryKey: Cores.verdeClaro,
        tertiaryKey: Cores.marrom,
      );

  static ColorScheme get _darkSeedColorScheme => SeedColorScheme.fromSeeds(
        brightness: Brightness.dark,
        primaryKey: Cores.verdeEscuro,
        secondaryKey: Cores.verde,
        tertiaryKey: Cores.marrom,
      );

  static ThemeData get darkTheme => ThemeData.from(
        colorScheme: _darkSeedColorScheme,
        useMaterial3: true,
      ).copyWith(
        appBarTheme: _appBarTheme,
        inputDecorationTheme: _inputTheme,
      );

  static ThemeData get lightTheme => ThemeData.from(
        colorScheme: _lightSeedColorScheme,
        useMaterial3: true,
      ).copyWith(
        appBarTheme: _appBarTheme,
        inputDecorationTheme: _inputTheme,
        popupMenuTheme: _popUpMenuTheme,
      );

  static AppBarTheme get _appBarTheme =>
      const AppBarTheme(centerTitle: true, toolbarHeight: 65);

  static InputDecorationTheme get _inputTheme =>
      InputDecorationTheme(border: _inputBorder, filled: true);

  static const _popUpMenuTheme = PopupMenuThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50))));

  static InputBorder get _inputBorder => const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide.none,
      );
}
