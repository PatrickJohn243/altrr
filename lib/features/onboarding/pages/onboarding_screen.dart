import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/controllers/user_profile_provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  // Step 2 — Name
  final _nameController = TextEditingController();

  // Step 3 — Photo
  XFile? _photo;

  // Step 4 — Categories
  final _selectedCategories = <String>{};

  static const _categories = [
    (key: 'physical',   label: 'Physical',   icon: Icons.fitness_center),
    (key: 'mental',     label: 'Mental',     icon: Icons.psychology),
    (key: 'social',     label: 'Social',     icon: Icons.people),
    (key: 'cooking',    label: 'Cooking',    icon: Icons.restaurant),
    (key: 'learning',   label: 'Learning',   icon: Icons.school),
    (key: 'explore',    label: 'Explore',    icon: Icons.travel_explore),
    (key: 'hobby',      label: 'Hobby',      icon: Icons.palette),
    (key: 'reflection', label: 'Reflection', icon: Icons.self_improvement),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _next() {
    if (_currentPage < 3) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  bool get _canProceed {
    switch (_currentPage) {
      case 0: return true;
      case 1: return _nameController.text.trim().isNotEmpty;
      case 2: return true; // photo optional
      case 3: return _selectedCategories.isNotEmpty;
      default: return false;
    }
  }

  Future<void> _pickPhoto() async {
    final picker = ImagePicker();
    final file = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 800,
      maxHeight: 800,
      imageQuality: 85,
    );
    if (file != null) setState(() => _photo = file);
  }

  Future<void> _finish() async {
    final ctrl = UserProfileProvider.of(context);
    await ctrl.saveOnboarding(
      name: _nameController.text.trim(),
      avatarPath: _photo?.path,
      preferredCategories: _selectedCategories.toList(),
    );
    if (mounted) context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SafeArea(
        child: Column(
          children: [
            // Progress dots
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (i) => _Dot(active: i == _currentPage)),
              ),
            ),

            // Pages
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (i) => setState(() => _currentPage = i),
                children: [
                  _WelcomePage(onNext: _next),
                  _NamePage(controller: _nameController, onChanged: () => setState(() {})),
                  _PhotoPage(photo: _photo, onPick: _pickPhoto, onNext: _next),
                  _CategoriesPage(
                    categories: _categories,
                    selected: _selectedCategories,
                    onToggle: (key) => setState(() {
                      if (_selectedCategories.contains(key)) {
                        _selectedCategories.remove(key);
                      } else {
                        _selectedCategories.add(key);
                      }
                    }),
                  ),
                ],
              ),
            ),

            // CTA button
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.screenPadding, 0,
                AppSpacing.screenPadding, AppSpacing.xxl,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _canProceed
                        ? AppColors.accent
                        : AppColors.bgElevated,
                    foregroundColor: _canProceed
                        ? AppColors.textInverse
                        : AppColors.textDisabled,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.button),
                    ),
                  ),
                  onPressed: _canProceed
                      ? (_currentPage == 3 ? _finish : _next)
                      : null,
                  child: Text(
                    _currentPage == 3 ? 'Begin' : 'Continue',
                    style: AppTypography.unboundedBold(
                      12,
                      _canProceed ? AppColors.textInverse : AppColors.textDisabled,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Progress dot ──────────────────────────────────────────────────────────────

class _Dot extends StatelessWidget {
  final bool active;
  const _Dot({required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: active ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: active ? AppColors.accent : AppColors.bgElevated,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

// ── Page 1: Welcome ───────────────────────────────────────────────────────────

class _WelcomePage extends StatelessWidget {
  final VoidCallback onNext;
  const _WelcomePage({required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 48),
          // Lime accent block
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.accent,
              borderRadius: BorderRadius.circular(AppRadius.icon),
            ),
            child: const Icon(
              Icons.bolt,
              color: AppColors.textInverse,
              size: 32,
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),
          Text('Welcome to\nAltrr.', style: AppTypography.unboundedBlack(28, AppColors.textPrimary)),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Altrr assigns you quests — you don\'t pick them.\nComplete them, earn titles, build your streak.',
            style: AppTypography.outfitMedium(14, AppColors.textMuted),
          ),
          const SizedBox(height: AppSpacing.xxl),
          _FeatureRow(icon: Icons.task_alt, text: 'Daily quests assigned to you'),
          const SizedBox(height: AppSpacing.md),
          _FeatureRow(icon: Icons.local_fire_department, text: 'Streak tracking'),
          const SizedBox(height: AppSpacing.md),
          _FeatureRow(icon: Icons.workspace_premium, text: 'Earn titles as you grow'),
        ],
      ),
    );
  }
}

class _FeatureRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const _FeatureRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: AppColors.accentSubtle,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 16, color: AppColors.accent),
        ),
        const SizedBox(width: AppSpacing.md),
        Text(text, style: AppTypography.outfitSemiBold(13, AppColors.textPrimary)),
      ],
    );
  }
}

// ── Page 2: Name ──────────────────────────────────────────────────────────────

class _NamePage extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onChanged;
  const _NamePage({required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 48),
          Text('What should\nwe call you?', style: AppTypography.unboundedBlack(24, AppColors.textPrimary)),
          const SizedBox(height: AppSpacing.sm),
          Text('This shows on your profile.', style: AppTypography.outfitMedium(13, AppColors.textMuted)),
          const SizedBox(height: AppSpacing.xxl),
          TextField(
            controller: controller,
            onChanged: (_) => onChanged(),
            autofocus: true,
            style: AppTypography.outfitSemiBold(16, AppColors.textPrimary),
            cursorColor: AppColors.accent,
            decoration: InputDecoration(
              hintText: 'Your name',
              hintStyle: AppTypography.outfitMedium(16, AppColors.textMuted),
              filled: true,
              fillColor: AppColors.bgSurface,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.button),
                borderSide: const BorderSide(color: AppColors.borderMid),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.button),
                borderSide: const BorderSide(color: AppColors.borderMid),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.button),
                borderSide: const BorderSide(color: AppColors.accent, width: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Page 3: Photo ─────────────────────────────────────────────────────────────

class _PhotoPage extends StatelessWidget {
  final XFile? photo;
  final VoidCallback onPick;
  final VoidCallback onNext;
  const _PhotoPage({required this.photo, required this.onPick, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 48),
          Text('Add a photo\n(optional)', style: AppTypography.unboundedBlack(24, AppColors.textPrimary)),
          const SizedBox(height: AppSpacing.sm),
          Text('Shows on your profile card.', style: AppTypography.outfitMedium(13, AppColors.textMuted)),
          const SizedBox(height: AppSpacing.xxl),
          Center(
            child: GestureDetector(
              onTap: onPick,
              child: photo == null
                  ? Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: AppColors.bgSurface,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.borderMid, width: 2),
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
                          backgroundImage: FileImage(File(photo!.path)),
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
                                border: Border.all(color: AppColors.bgPrimary, width: 2),
                              ),
                              child: const Icon(Icons.edit, size: 14, color: AppColors.textInverse),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
          if (photo == null) ...[
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

// ── Page 4: Categories ────────────────────────────────────────────────────────

class _CategoriesPage extends StatelessWidget {
  final List<({String key, String label, IconData icon})> categories;
  final Set<String> selected;
  final ValueChanged<String> onToggle;

  const _CategoriesPage({
    required this.categories,
    required this.selected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 48),
          Text('What interests\nyou?', style: AppTypography.unboundedBlack(24, AppColors.textPrimary)),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Altrr starts here — then takes you further.',
            style: AppTypography.outfitMedium(13, AppColors.textMuted),
          ),
          const SizedBox(height: AppSpacing.xxl),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: AppSpacing.md,
              crossAxisSpacing: AppSpacing.md,
              childAspectRatio: 2.6,
              physics: const NeverScrollableScrollPhysics(),
              children: categories.map((c) {
                final isOn = selected.contains(c.key);
                return GestureDetector(
                  onTap: () => onToggle(c.key),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    decoration: BoxDecoration(
                      color: isOn ? AppColors.accentSubtle : AppColors.bgSurface,
                      borderRadius: BorderRadius.circular(AppRadius.button),
                      border: Border.all(
                        color: isOn ? AppColors.accent : AppColors.borderMid,
                        width: isOn ? 1.5 : 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          c.icon,
                          size: 18,
                          color: isOn ? AppColors.accent : AppColors.textMuted,
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Text(
                          c.label,
                          style: isOn
                              ? AppTypography.unboundedBold(11, AppColors.accent)
                              : AppTypography.unboundedBold(11, AppColors.textMuted),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
