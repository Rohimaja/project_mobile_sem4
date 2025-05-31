import 'package:flutter/material.dart';

class ThemeNotifier extends ValueNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.light);

  void setTheme(String themeOption) {
    if (themeOption == "Gelap") {
      value = ThemeMode.dark;
    } else {
      value = ThemeMode.light;
    }
  }
}
