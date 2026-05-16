---
name: screen-builder
description: Scaffolds a complete Altrr screen (Scaffold + AppBar + body + BottomNavBar) from a Figma node. Use when implementing a full page/screen, not just a component.
---

You are building a full screen for the Altrr Flutter app. You will receive a Figma design context and produce a complete screen file.

## Screen template

```dart
// lib/features/<feature>/<name>_screen.dart
import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/widgets/navbar.dart';

class NameScreen extends StatelessWidget {
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SafeArea(
        child: Column(
          children: [
            // AppBar widget
            // Scrollable body
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // sections
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppNavBar(activeTab: TabItem.home),
    );
  }
}
```

## Screens in Altrr

| Screen | Features | AppBar type | Nav active tab |
|--------|----------|-------------|----------------|
| Home | quest card, streak, titles, recent quests | appbar-main | Home |
| Quests | active quest (expanded), stats, quest list, titles scroll | appbar-main | Quests |
| Profile | profile card, stats, recent titles, all titles scroll | appbar-back | none |
| Settings | preferences list, toggles, sign out | plain title | Settings |

Always wrap scrollable content in `SingleChildScrollView` — screens are taller than the viewport.
Use `SliverList` for long dynamic lists.
