import 'dart:io';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';

class PhotoPage extends StatelessWidget {
  final String? photoPath;
  final VoidCallback onPick;
  final VoidCallback onNext;

  const PhotoPage({
    super.key,
    required this.photoPath,
    required this.onPick,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 48),
          Text('Add a photo\n(optional)',
              style: AppTypography.unboundedBlack(24, AppColors.textPrimary)),
          const SizedBox(height: AppSpacing.sm),
          Text('Shows on your profile card.',
              style: AppTypography.outfitMedium(13, AppColors.textMuted)),
          const SizedBox(height: AppSpacing.xxl),
          Center(
            child: GestureDetector(
              onTap: onPick,
              child: photoPath == null
                  ? Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: AppColors.bgSurface,
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: AppColors.borderMid, width: 2),
                      ),
                      child: const Icon(
                        Icons.add_a_photo_outlined,
                        size: 36,
                        color: AppColors.textMuted,
                      ),
                    )
                  : Stack(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: FileImage(File(photoPath!)),
                        ),
                        Positioned(
                          bottom: 4,
                          right: 4,
                          child: GestureDetector(
                            onTap: onPick,
                            child: Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: AppColors.accent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: AppColors.bgPrimary, width: 2),
                              ),
                              child: const Icon(Icons.edit,
                                  size: 14, color: AppColors.textInverse),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
          if (photoPath == null) ...[
            const SizedBox(height: AppSpacing.xl),
            Center(
              child: TextButton(
                onPressed: onNext,
                child: Text(
                  'Skip for now',
                  style: AppTypography.outfitMedium(13, AppColors.textMuted),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
