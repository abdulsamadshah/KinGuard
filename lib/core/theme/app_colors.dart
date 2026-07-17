import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Brand Colors
  static const Color primary = Color(0xFFE12AFB);
  static const Color secondary = Color(0xFF8E51FF);

  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, secondary],
  );

  // Text
  static const Color textPrimary = Color(0xFF1A1A1A);

  static const Color textSecondary = Color(0xFF6B7280);

  static const Color textWhite = Colors.white;

  // Background
  static const Color background = Color(0xFFF8F9FD);

  static const Color card = Colors.white;

  // Status
  static const Color success = Color(0xFF22C55E);

  static const Color warning = Color(0xFFF59E0B);

  static const Color error = Color(0xFFEF4444);

  // SOS
  static const Color sosRed = Color(0xFFDC2626);

  // Border
  static const Color border = Color(0xFFE5E7EB);

  // Grey Shades
  static const Color grey100 = Color(0xFFF3F4F6);

  static const Color grey200 = Color(0xFFE5E7EB);

  static const Color grey300 = Color(0xFFD1D5DB);

  static const List<Color> kBrandGradient = [Color(0xffE12AFB), Color(0xff8E51FF)];

}
