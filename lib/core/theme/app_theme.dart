import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.bgPrimary,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.accent,
          onPrimary: AppColors.textInverse,
          surface: AppColors.bgSurface,
          onSurface: AppColors.textPrimary,
        ),
        textTheme: TextTheme(
          displayLarge: AppTypography.unboundedBlack(24, AppColors.textPrimary),
          titleMedium: AppTypography.unboundedBold(12, AppColors.textPrimary),
          bodyMedium: AppTypography.outfitMedium(12, AppColors.textMuted),
        ),
        dividerColor: AppColors.borderSubtle,
      );
}
