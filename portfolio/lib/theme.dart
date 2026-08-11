import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Цветовая палитра и типографика сайта.
class AppTheme {
  AppTheme._();

  static const Color bg = Color(0xFF070B16);
  static const Color bgAlt = Color(0xFF0B1120);
  static const Color surface = Color(0xFF101830);
  static const Color surfaceLight = Color(0xFF182242);
  static const Color stroke = Color(0xFF223055);

  static const Color primary = Color(0xFF7C6CFF); // фиолетовый
  static const Color accent = Color(0xFF3DDC97); // android-зелёный
  static const Color accentBlue = Color(0xFF4FC3F7); // голубой

  static const Color textPrimary = Color(0xFFF2F5FF);
  static const Color textSecondary = Color(0xFF9AA7C7);
  static const Color textMuted = Color(0xFF66739A);

  static const LinearGradient heroGradient = LinearGradient(
    colors: [primary, accentBlue, accent],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static TextStyle display(BuildContext context, {double size = 56}) =>
      GoogleFonts.unbounded(
        fontSize: size,
        fontWeight: FontWeight.w700,
        color: textPrimary,
        height: 1.08,
      );

  static TextStyle heading({double size = 34}) => GoogleFonts.unbounded(
        fontSize: size,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        height: 1.15,
      );

  static TextStyle subtitle({double size = 18}) => GoogleFonts.manrope(
        fontSize: size,
        fontWeight: FontWeight.w500,
        color: textSecondary,
        height: 1.6,
      );

  static TextStyle body({double size = 16}) => GoogleFonts.manrope(
        fontSize: size,
        fontWeight: FontWeight.w400,
        color: textSecondary,
        height: 1.65,
      );

  static TextStyle label({double size = 14}) => GoogleFonts.manrope(
        fontSize: size,
        fontWeight: FontWeight.w700,
        letterSpacing: 2.2,
        color: accent,
      );

  static TextStyle mono({double size = 14, Color color = accent}) =>
      GoogleFonts.jetBrainsMono(
        fontSize: size,
        fontWeight: FontWeight.w500,
        color: color,
        height: 1.5,
      );
}
