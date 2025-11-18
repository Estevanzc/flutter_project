import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode {
    if (_themeMode == ThemeMode.system) {
      return false;
    } else {
      return _themeMode == ThemeMode.dark;
    }
  }

  ThemeMode _simpleThemeMode = ThemeMode.light;
  ThemeMode get simpleThemeMode => _simpleThemeMode;
  bool get isSimpleDarkMode => _simpleThemeMode == ThemeMode.dark;

  void toggleTheme(bool isDark) {
    _simpleThemeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}