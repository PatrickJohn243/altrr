import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';

class SubmissionInputCard extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;

  const SubmissionInputCard({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.card)),
        border: Border(
          top: BorderSide(color: AppColors.borderSubtle),
          left: BorderSide(color: AppColors.borderSubtle),
          right: BorderSide(color: AppColors.borderSubtle),
          bottom: BorderSide(color: AppColors.borderSubtle, width: 3),
        ),
      ),
      child: TextField(
        controller: controller,
        style: AppTypography.outfitMedium(13, AppColors.textPrimary),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, size: 16, color: AppColors.textMuted),
          hintText: hint,
          hintStyle: AppTypography.bodyMedium,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
