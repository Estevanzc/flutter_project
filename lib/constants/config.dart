
import 'package:flutter/material.dart';

class Config {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue[200],
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue[200],
    )
    // ... other light theme properties
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue[200], // You can keep this or change it
    scaffoldBackgroundColor: Color(0xFF121212), // Common dark background
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF1F1F1F),
    )
    // ... other dark theme properties
  );
}