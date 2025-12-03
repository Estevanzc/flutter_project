import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  // --- THEME LOGIC ---
  ThemeMode _simpleThemeMode = ThemeMode.light;

  ThemeMode get simpleThemeMode => _simpleThemeMode;
  bool get isSimpleDarkMode => _simpleThemeMode == ThemeMode.dark;

  // --- FONT LOGIC (NEW) ---
  String _fontFamily = 'Roboto';
  double _fontSize = 16.0;

  String get fontFamily => _fontFamily;
  double get fontSize => _fontSize;

  // Constructor: Load settings when app starts
  ThemeProvider() {
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    
    // Load Theme
    bool isDark = prefs.getBool('isDark') ?? false;
    _simpleThemeMode = isDark ? ThemeMode.dark : ThemeMode.light;

    // Load Fonts
    _fontFamily = prefs.getString('fontFamily') ?? 'Roboto';
    _fontSize = prefs.getDouble('fontSize') ?? 16.0;

    notifyListeners();
  }

  // Toggle Theme & Save
  void toggleTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    _simpleThemeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    await prefs.setBool('isDark', isDark);
    notifyListeners();
  }

  // Change Font Family & Save
  void setFontFamily(String newFont) async {
    final prefs = await SharedPreferences.getInstance();
    _fontFamily = newFont;
    await prefs.setString('fontFamily', newFont);
    notifyListeners();
  }

  // Change Font Size & Save
  void setFontSize(double newSize) async {
    final prefs = await SharedPreferences.getInstance();
    _fontSize = newSize;
    await prefs.setDouble('fontSize', newSize);
    notifyListeners();
  }
}