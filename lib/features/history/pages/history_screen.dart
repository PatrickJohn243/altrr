import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/app_bar_search.dart';
import '../controllers/history_controller.dart';
import '../widgets/date_section_widget.dart';
import '../widgets/history_empty_state.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late final HistoryController _controller;

  @override
  void initState() {
    super.initState();
    _controller = HistoryController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SafeArea(
        child: Column(
          children: [
            AppBarSearch(
              controller: _controller.searchController,
              hint: 'Search quest history...',
              onChanged: _controller.onSearchChanged,
            ),
            Expanded(
              child: ListenableBuilder(
                listenable: _controller,
                builder: (context, _) {
                  final sections = _controller.filteredSections;
                  return sections.isEmpty
                      ? HistoryEmptyState(query: _controller.query)
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.screenPadding),
                          itemCount: sections.length,
                          itemBuilder: (context, i) =>
                              DateSectionWidget(section: sections[i]),
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
