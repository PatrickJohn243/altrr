import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/controllers/user_profile_provider.dart';
import '../../../core/utils/image_utils.dart';
import '../../../shared/data/quest_categories.dart';
import '../widgets/categories_page.dart';
import '../widgets/name_page.dart';
import '../widgets/photo_page.dart';
import '../widgets/welcome_page.dart';

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
  final _nameFocusNode = FocusNode();

  String? _photoPath;
  final _selectedCategories = <String>{};

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    _nameFocusNode.dispose();
    super.dispose();
  }

  void _next() {
    if (_currentPage < 3) {
      FocusScope.of(context).unfocus();
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _back() {
    if (_currentPage > 0) {
      FocusScope.of(context).unfocus();
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  bool get _canProceed {
    switch (_currentPage) {
      case 0:
        return true;
      case 1:
        return _nameController.text.trim().isNotEmpty;
      case 2:
        return true; // photo optional
      case 3:
        return _selectedCategories.isNotEmpty;
      default:
        return false;
    }
  }

  Future<void> _pickPhoto() async {
    final path = await ImageUtils.pickFromGallery(
      maxWidth: 800,
      maxHeight: 800,
      quality: 85,
    );
    if (path != null) setState(() => _photoPath = path);
  }

  Future<void> _finish() async {
    final ctrl = UserProfileProvider.of(context);
    await ctrl.saveOnboarding(
      name: _nameController.text.trim(),
      avatarPath: _photoPath,
      preferredCategories: _selectedCategories.toList(),
    );
    if (mounted) context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            // Progress dots + back button
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 8),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (_currentPage > 0)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: AppSpacing.screenPadding),
                        child: GestureDetector(
                          onTap: _back,
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: AppColors.bgSurface,
                              borderRadius: BorderRadius.circular(AppRadius.button),
                              border: Border.all(color: AppColors.borderMid),
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              size: 14,
                              color: AppColors.textMuted,
                            ),
                          ),
                        ),
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (i) => _Dot(active: i == _currentPage)),
                  ),
                ],
              ),
            ),

            // Pages
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (i) {
                  setState(() => _currentPage = i);
                  if (i == 1) {
                    Future.delayed(const Duration(milliseconds: 350), () {
                      if (mounted) _nameFocusNode.requestFocus();
                    });
                  }
                },
                children: [
                  WelcomePage(onNext: _next),
                  NamePage(controller: _nameController, focusNode: _nameFocusNode),
                  PhotoPage(
                      photoPath: _photoPath, onPick: _pickPhoto, onNext: _next),
                  CategoriesPage(
                    categories: QuestCategories.all,
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
                AppSpacing.screenPadding,
                0,
                AppSpacing.screenPadding,
                AppSpacing.xxl,
              ),
              child: ListenableBuilder(
                listenable: _nameController,
                builder: (context, _) {
                  final canProceed = _canProceed;
                  return SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: canProceed
                            ? AppColors.accent
                            : AppColors.bgElevated,
                        foregroundColor: canProceed
                            ? AppColors.textInverse
                            : AppColors.textDisabled,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppRadius.button),
                        ),
                      ),
                      onPressed: canProceed
                          ? (_currentPage == 3 ? _finish : _next)
                          : null,
                      child: Text(
                        _currentPage == 3 ? 'Begin' : 'Continue',
                        style: AppTypography.unboundedBold(
                          12,
                          canProceed
                              ? AppColors.textInverse
                              : AppColors.textDisabled,
                        ),
                      ),
                    ),
                  );
                },
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

