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
}
