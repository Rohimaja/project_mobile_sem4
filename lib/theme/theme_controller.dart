import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _storage = GetStorage();

  void applyTheme(String selectedTheme) {
    ThemeMode themeMode;

    if (selectedTheme == "Gelap") {
      themeMode = ThemeMode.dark;
    } else if (selectedTheme == "Cerah") {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.system;
    }

    _storage.write('theme', selectedTheme);
    Get.changeThemeMode(themeMode);
  }

  ThemeMode getThemeModeFromStorage() {
    String? themePref = _storage.read('theme');
    switch (themePref) {
      case "Gelap":
        return ThemeMode.dark;
      case "Cerah":
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }
}
