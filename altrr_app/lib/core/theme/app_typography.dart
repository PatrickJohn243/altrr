import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTypography {
  // --- Unbounded ---
  static TextStyle unboundedBlack(double size, Color color) =>
      GoogleFonts.unbounded(fontSize: size, fontWeight: FontWeight.w900, color: color);

  static TextStyle unboundedExtraBold(double size, Color color) =>
      GoogleFonts.unbounded(fontSize: size, fontWeight: FontWeight.w800, color: color);

  static TextStyle unboundedBold(double size, Color color) =>
      GoogleFonts.unbounded(fontSize: size, fontWeight: FontWeight.w700, color: color);

  static TextStyle unboundedMedium(double size, Color color) =>
      GoogleFonts.unbounded(fontSize: size, fontWeight: FontWeight.w500, color: color);

  // --- Outfit ---
  static TextStyle outfitBold(double size, Color color) =>
      GoogleFonts.outfit(fontSize: size, fontWeight: FontWeight.w700, color: color);

  static TextStyle outfitSemiBold(double size, Color color) =>
      GoogleFonts.outfit(fontSize: size, fontWeight: FontWeight.w600, color: color);

  static TextStyle outfitMedium(double size, Color color) =>
      GoogleFonts.outfit(fontSize: size, fontWeight: FontWeight.w500, color: color);

  // --- Named styles ---
  static TextStyle get screenTitle => unboundedBlack(24, AppColors.textPrimary);
  static TextStyle get questTitle => unboundedBlack(20, AppColors.textInverse);
  static TextStyle get questDescription => unboundedExtraBold(16, AppColors.textInverse);
  static TextStyle get sectionLabel =>
      unboundedBold(12, AppColors.textMuted).copyWith(letterSpacing: 1.26);
  static TextStyle get cardTitle => unboundedBold(12, AppColors.textPrimary);
  static TextStyle get categoryLabel =>
      unboundedExtraBold(10, AppColors.accent).copyWith(letterSpacing: 0.36);
  static TextStyle get ctaButton =>
      unboundedBold(12, AppColors.textInverse).copyWith(letterSpacing: 0.11);
  static TextStyle get bodyMedium => outfitMedium(12, AppColors.textMuted);
  static TextStyle get bodySemiBold => outfitSemiBold(12, AppColors.textPrimary);
  static TextStyle get caption => outfitSemiBold(9, AppColors.textMuted);
  static TextStyle get greeting => outfitMedium(12, AppColors.textMuted);
}
