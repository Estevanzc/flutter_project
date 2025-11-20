import 'package:flutter/material.dart';

class Styles {
  static const TextStyle pageTitle = TextStyle(fontFamily: "Garet");
  static const TextStyle settingsTitle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    fontFamily: "Roboto",
  );
  static const TextStyle settingsOption = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static BoxDecoration cardDark = BoxDecoration(
    color: const Color(0xFF1E1E1E),
    borderRadius: BorderRadius.circular(12),
  );
  static BoxDecoration cardWhite = BoxDecoration(
    color: Colors.grey[300],
    borderRadius: BorderRadius.circular(12),
  );
  static BoxDecoration switchDark = BoxDecoration(
    border: Border.all(color: Colors.white10, width: 2.5),
    borderRadius: BorderRadius.circular(10),
  );
  static BoxDecoration switchWhite = BoxDecoration(
    border: Border.all(color: Colors.grey.shade300, width: 2.5),
    borderRadius: BorderRadius.circular(10),
  );
  static BoxDecoration choosenSwitchDark = BoxDecoration(
    color: Colors.white10,
    borderRadius: BorderRadius.circular(6),
  );
  static BoxDecoration choosenSwitchwhite = BoxDecoration(
    color: Colors.grey[300],
    borderRadius: BorderRadius.circular(6),
  );
  static BoxDecoration taskWhite = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(14),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 8,
        offset: Offset(0, 3),
      ),
    ],
    border: Border.all(
      color: Colors.grey.shade300,
      width: 1,
    ),
  );
  static BoxDecoration taskCompletedWhite = BoxDecoration(
    color: Colors.green.shade50,
    borderRadius: BorderRadius.circular(14),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 8,
        offset: Offset(0, 3),
      ),
    ],
    border: Border.all(
      color: Colors.green.shade200,
      width: 1,
    ),
  );
  static BoxDecoration taskBlack = BoxDecoration(
    color: Colors.white10,
    borderRadius: BorderRadius.circular(14),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 8,
        offset: Offset(0, 3),
      ),
    ],
    border: Border.all(
      color: Colors.grey.shade800,
      width: 1,
    ),
  );
  static BoxDecoration taskCompletedBlack = BoxDecoration(
    color: Color(0xFF1E1E1E),
    borderRadius: BorderRadius.circular(14),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.45),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
    border: Border.all(
      color: Color(0xFF3A3A3A), // subtle border
      width: 1.4,
    ),
  );
}
