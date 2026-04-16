import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../core/controllers/user_profile_provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/image_utils.dart';
import '../../../../core/widgets/app_bar_back.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _nameController = TextEditingController();
  String? _imagePath;
  bool _initialized = false;
  bool _saving = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      final profile = UserProfileProvider.of(context);
      _nameController.text = profile.name;
      _imagePath = profile.avatarPath;
      _initialized = true;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final path = await ImageUtils.pickFromGallery();
    if (path != null) setState(() => _imagePath = path);
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    final profile = UserProfileProvider.of(context);
    await profile.save(_nameController.text, _imagePath);
    if (mounted) Navigator.of(context).pop();
  }

  String get _initials {
    final name = _nameController.text.trim();
    if (name.isEmpty) return '?';
    final parts = name.split(' ').where((p) => p.isNotEmpty).toList();
    if (parts.length >= 2) return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    return name.substring(0, name.length.clamp(0, 2)).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarBack(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSpacing.xl),


                    Center(
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 96,
                              height: 96,
                              decoration: BoxDecoration(
                                color: AppColors.bgSurface,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.borderMid,
                                  width: 2,
                                ),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: _imagePath != null
                                  ? Image.file(
                                      File(_imagePath!),
                                      fit: BoxFit.cover,
                                    )
                                  : Center(
                                      child: ListenableBuilder(
                                        listenable: _nameController,
                                        builder: (context, _) => Text(
                                          _initials,
                                          style:
                                              AppTypography.unboundedBlack(
                                            28,
                                            AppColors.accent,
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: AppColors.accent,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.bgPrimary,
                                    width: 2,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.camera_alt,
                                  size: 13,
                                  color: AppColors.textInverse,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Center(
                      child: Text(
                        'Tap to change photo',
                        style: AppTypography.outfitMedium(
                          12,
                          AppColors.textMuted,
                        ),
                      ),
                    ),

                    const SizedBox(height: AppSpacing.xxl),


                    Text('NAME', style: AppTypography.sectionLabel),
                    const SizedBox(height: AppSpacing.sm),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.bgSurface,
                        borderRadius: BorderRadius.circular(AppRadius.button),
                        border: Border.all(color: AppColors.borderSubtle),
                      ),
                      child: TextField(
                        controller: _nameController,
                        style: AppTypography.outfitMedium(
                          14,
                          AppColors.textPrimary,
                        ),
                        cursorColor: AppColors.accent,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          hintText: 'Your name',
                          hintStyle: AppTypography.outfitMedium(
                            14,
                            AppColors.textMuted,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: AppSpacing.xxxl),
                  ],
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.screenPadding,
                0,
                AppSpacing.screenPadding,
                AppSpacing.xl,
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saving ? null : _save,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    foregroundColor: AppColors.textInverse,
                    disabledBackgroundColor: AppColors.accentDim,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.button),
                    ),
                    elevation: 0,
                  ),
                  child: _saving
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.textInverse,
                          ),
                        )
                      : Text('Save changes', style: AppTypography.ctaButton),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
