import 'package:flutter/material.dart';

class TColors {
  TColors._();

  static const Color primary = Colors.amber;
  static const Color secondary = Colors.black;
  static const Color accent = Colors.white;

  static const Color selected = Colors.green; // Example highlight color

  static const Gradient linearGradientlight = LinearGradient(
      begin: Alignment(0.0, 0.0),
      end: Alignment(0.707, -0.707),
      colors: [
        Color.fromARGB(255, 238, 224, 187),
        Color.fromARGB(255, 243, 213, 122),
        Color.fromARGB(255, 242, 183, 8),
      ]);

  static const Gradient linearGradientdark = LinearGradient(
      begin: Alignment(0.0, 0.0),
      end: Alignment(0.707, -0.707),
      colors: [
        Color.fromARGB(255, 130, 104, 38), // Darker amber
        Color.fromARGB(255, 156, 124, 18), // Medium amber
        Color.fromARGB(255, 242, 183, 8),
      ]);

  static const Color textprimary = Color(0xff333333);
  static const Color textsecondary = Color(0xff6c757d);
  static const Color textaccent = Colors.white;

  static const Color light = Color(0xfff6f6f6);
  static const Color dark = Color(0xff272727);
  static const Color primaryBackground = Color(0xfff3f5ff);

  static const Color lightContainer = Color(0xfff6f6f6);
  static Color darkContainer = Colors.white.withOpacity(0.1);
}
