import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/generated/colors.gen.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/presentation/controllers/settings_notifier.dart';

class AppTheme {
  const AppTheme({this.useMaterial3 = false});
  final bool useMaterial3;

  static ColorScheme get _lightSeedColorScheme => SeedColorScheme.fromSeeds(
        brightness: Brightness.light,
        primaryKey: ColorName.verdeEscuro,
        secondaryKey: ColorName.verdeClaro,
        tertiaryKey: ColorName.marrom,
      );

  static ColorScheme get _darkSeedColorScheme => SeedColorScheme.fromSeeds(
        brightness: Brightness.dark,
        primaryKey: ColorName.verdeEscuro,
        secondaryKey: ColorName.verde,
        tertiaryKey: ColorName.marrom,
      );

  ThemeData get darkTheme => ThemeData.from(
        colorScheme: _darkSeedColorScheme,
        useMaterial3: useMaterial3,
      ).copyWith(
        appBarTheme: _appBarTheme,
        inputDecorationTheme: _inputTheme,
      );

  ThemeData get lightTheme => ThemeData.from(
        colorScheme: _lightSeedColorScheme,
        useMaterial3: useMaterial3,
      ).copyWith(
        appBarTheme: _appBarTheme,
        inputDecorationTheme: _inputTheme,
      );

  static AppBarTheme get _appBarTheme =>
      const AppBarTheme(centerTitle: true, toolbarHeight: 80);

  static InputDecorationTheme get _inputTheme => InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: _borderRadius,
          borderSide: BorderSide.none,
        ),
        filled: true,
      );

  static BorderRadius get _borderRadius =>
      const BorderRadius.all(Radius.circular(10));
}

final appThemeProvider = Provider((ref) {
  final useMaterial3 =
      ref.watch(settingsNotifierProvider.select((value) => value.useMaterial3));
  return AppTheme(useMaterial3: useMaterial3);
});
