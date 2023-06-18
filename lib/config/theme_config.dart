import 'package:flutter/material.dart';

class AppThemeConfig {
  static final mainTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'SpaceMono',
      brightness: Brightness.dark,
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
      )));
}
