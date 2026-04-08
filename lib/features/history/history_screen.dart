import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/widgets/app_bar_search.dart';
import '../../core/widgets/quest_row_card.dart';
import '../../core/widgets/section_header.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sections = _filteredSections(_query);

    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SafeArea(
        child: Column(
          children: [
            AppBarSearch(
              controller: _searchController,
              hint: 'Search quest history...',
              onChanged: (value) => setState(() => _query = value),
            ),
            Expanded(
              child: sections.isEmpty
                  ? _EmptyState(query: _query)
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.screenPadding,
                      ),
                      itemCount: sections.length,
                      itemBuilder: (context, i) => _DateSectionWidget(
                        section: sections[i],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Data ──────────────────────────────────────────────────────────────────────

class _QuestEntry {
  final String category;
  final String title;
  final String date;
  final bool isSkipped;
  final IconData icon;

  const _QuestEntry({
    required this.category,
    required this.title,
    required this.date,
    required this.icon,
    this.isSkipped = false,
  });
}

class _HistorySection {
  final String label;
  final List<_QuestEntry> quests;

  const _HistorySection({required this.label, required this.quests});
}

const _allSections = [
  _HistorySection(label: 'YESTERDAY', quests: [
    _QuestEntry(
      category: 'Food',
      title: "A Cook's First Attempt",
      date: 'Apr 7',
      icon: Icons.restaurant,
    ),
    _QuestEntry(
      category: 'People',
      title: 'Strike Up a Conversation',
      date: 'Apr 7',
      icon: Icons.people,
      isSkipped: true,
    ),
  ]),
  _HistorySection(label: 'APR 6', quests: [
    _QuestEntry(
      category: 'Travel',
      title: "The Wanderer's Walk",
      date: 'Apr 6',
      icon: Icons.directions_walk,
    ),
    _QuestEntry(
      category: 'Gym',
      title: 'Morning Run',
      date: 'Apr 6',
      icon: Icons.fitness_center,
    ),
  ]),
  _HistorySection(label: 'APR 5', quests: [
    _QuestEntry(
      category: 'People',
      title: 'Conversationalist',
      date: 'Apr 5',
      icon: Icons.people,
    ),
  ]),
  _HistorySection(label: 'APR 4', quests: [
    _QuestEntry(
      category: 'Food',
      title: 'Try Something New',
      date: 'Apr 4',
      icon: Icons.restaurant,
      isSkipped: true,
    ),
    _QuestEntry(
      category: 'Travel',
      title: 'Landmark Hunt',
      date: 'Apr 4',
      icon: Icons.travel_explore,
    ),
  ]),
  _HistorySection(label: 'APR 3', quests: [
    _QuestEntry(
      category: 'Gym',
      title: 'Push Your Limits',
      date: 'Apr 3',
      icon: Icons.fitness_center,
    ),
  ]),
  _HistorySection(label: 'MAR 31', quests: [
    _QuestEntry(
      category: 'People',
      title: 'Say Yes to Plans',
      date: 'Mar 31',
      icon: Icons.people,
    ),
    _QuestEntry(
      category: 'Travel',
      title: 'Off the Beaten Path',
      date: 'Mar 31',
      icon: Icons.directions_walk,
      isSkipped: true,
    ),
  ]),
];

List<_HistorySection> _filteredSections(String query) {
  if (query.isEmpty) return _allSections;
  final q = query.toLowerCase();
  return _allSections
      .map((s) => _HistorySection(
            label: s.label,
            quests: s.quests
                .where((e) =>
                    e.title.toLowerCase().contains(q) ||
                    e.category.toLowerCase().contains(q))
                .toList(),
          ))
      .where((s) => s.quests.isNotEmpty)
      .toList();
}

// ── Widgets ───────────────────────────────────────────────────────────────────

class _DateSectionWidget extends StatelessWidget {
  final _HistorySection section;

  const _DateSectionWidget({required this.section});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(label: section.label),
        const SizedBox(height: AppSpacing.itemGap),
        ...section.quests.map((entry) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.itemGap),
              child: QuestRowCard(
                icon: Icon(entry.icon, size: 18, color: AppColors.textMuted),
                category: entry.category,
                questTitle: entry.title,
                date: entry.date,
                isSkipped: entry.isSkipped,
              ),
            )),
        const SizedBox(height: AppSpacing.sm),
      ],
    );
  }
}

class _EmptyState extends StatelessWidget {
  final String query;

  const _EmptyState({required this.query});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.search_off, color: AppColors.textMuted, size: 32),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'No quests matching "$query"',
            style: const TextStyle(color: AppColors.textMuted),
          ),
        ],
      ),
    );
  }
}
