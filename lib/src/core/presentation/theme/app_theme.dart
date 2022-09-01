import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/src/configs/colors.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorSchemeSeed: Cores.verdeEscuro,
  appBarTheme: const AppBarTheme(centerTitle: true),
);

class AppTheme {
  AppTheme._();

  static ThemeData get _originalDark => FlexThemeData.dark(
        scheme: FlexScheme.mallardGreen,
        useMaterial3: true,
        appBarStyle: FlexAppBarStyle.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3ErrorColors: true,
        appBarElevation: 4,
      );

  static ThemeData get _originalLight => FlexThemeData.light(
        scheme: FlexScheme.mallardGreen,
        useMaterial3: true,
        appBarStyle: FlexAppBarStyle.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3ErrorColors: true,
        appBarElevation: 4,
      );

  static ElevatedButtonThemeData get _elevatedButtonTheme =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          elevation: 1,
        ),
      );

  static const _popUpMenuTheme = PopupMenuThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))));

  static ShapeBorder get _appBarShapeBorder => const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      );

  static double get _toolbarHeight => 85;

  static InputBorder get _inputBorder => const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide.none,
      );

  static FloatingActionButtonThemeData get _floatingButton =>
      const FloatingActionButtonThemeData(shape: CircleBorder(), elevation: 1);

  static ThemeData get dark => _originalDark.copyWith(
        appBarTheme: _originalDark.appBarTheme.copyWith(
          centerTitle: true,
          toolbarHeight: _toolbarHeight,
          shape: _appBarShapeBorder,
        ),
        inputDecorationTheme: _originalDark.inputDecorationTheme.copyWith(
          border: _inputBorder,
        ),
        elevatedButtonTheme: _elevatedButtonTheme,
        popupMenuTheme: _popUpMenuTheme,
        shadowColor: FlexColor.greenDarkPrimary,
        floatingActionButtonTheme: _floatingButton,
      );

  static ThemeData get light => _originalLight.copyWith(
        appBarTheme: _originalLight.appBarTheme.copyWith(
          centerTitle: true,
          toolbarHeight: _toolbarHeight,
          shape: _appBarShapeBorder,
        ),
        inputDecorationTheme: _originalLight.inputDecorationTheme.copyWith(
          border: _inputBorder,
        ),
        elevatedButtonTheme: _elevatedButtonTheme,
        popupMenuTheme: _popUpMenuTheme,
        shadowColor: FlexColor.greenDarkPrimary,
        floatingActionButtonTheme: _floatingButton,
      );
}
