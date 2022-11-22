import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/config/config.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/presentation/controllers/settings_notifier.dart';

class AppTheme {
  const AppTheme({this.useMaterial3 = false});
  final bool useMaterial3;

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

  static InputDecorationTheme get _inputTheme => const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
        ),
        filled: true,
      );
}

final appThemeProvider = Provider((ref) {
  final useMaterial3 =
      ref.watch(settingsNotifierProvider.select((value) => value.useMaterial3));
  return AppTheme(useMaterial3: useMaterial3);
});
