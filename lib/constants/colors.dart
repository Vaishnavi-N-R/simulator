import 'package:flutter/material.dart';

class TColors {
  TColors._();

  static const Color primary = Color(0xff4b68ff);
  static const Color secondary = Color(0xffffe24b);
  static const Color accent = Color(0xffb0c7ff);

  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xffff9a9e),
      Color(0xfffad0c4),
      Color(0xfffad0c4)
    ]
  );

  static const Color textprimary = Color(0xff333333);
  static const Color textsecondary = Color(0xff6c757d);
  static const Color textaccent = Colors.white;

  static const Color light = Color(0xfff6f6f6);
  static const Color dark = Color(0xff272727);
  static const Color primaryBackground = Color(0xfff3f5ff);

  static const Color lightContainer = Color(0xfff6f6f6);
  static Color darkContainer = Colors.white.withOpacity(0.1);


}
