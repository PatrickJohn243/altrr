import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../../../core/database/isar_service.dart';
import '../../../shared/models/earned_title.dart';

export '../../../shared/models/earned_title.dart';

// ── Filter ────────────────────────────────────────────────────────────────────

enum TitleFilter { all, quest, time, gacha, newOnly }

extension TitleFilterLabel on TitleFilter {
  String get label {
    switch (this) {
      case TitleFilter.all:
        return 'All';
      case TitleFilter.quest:
        return 'Quest';
      case TitleFilter.time:
        return 'Time';
      case TitleFilter.gacha:
        return 'Gacha';
      case TitleFilter.newOnly:
        return 'New';
    }
  }
}

// ── Controller ────────────────────────────────────────────────────────────────

class AllTitlesController extends ChangeNotifier {
  final searchController = TextEditingController();
  final Isar _isar = IsarService.instance;

  List<EarnedTitle> _all = [];
  String _query = '';
  TitleFilter _filter = TitleFilter.all;

  String get query => _query;
  TitleFilter get filter => _filter;
  int get totalCount => _all.length;

  AllTitlesController() {
    _load();
  }

  Future<void> _load() async {
    _all = await _isar.earnedTitles
        .where()
        .sortByEarnedAtDesc()
        .findAll();
    notifyListeners();
  }

  List<EarnedTitle> get filtered {
    var list = _all;

    // Apply filter
    switch (_filter) {
      case TitleFilter.quest:
        list = list.where((t) => t.condition == TitleCondition.questCount).toList();
        break;
      case TitleFilter.time:
        list = list.where((t) => t.condition == TitleCondition.timeBased).toList();
        break;
      case TitleFilter.gacha:
        list = list.where((t) => t.condition == TitleCondition.gacha).toList();
        break;
      case TitleFilter.newOnly:
        list = list.where((t) => !t.isSeen).toList();
        break;
      case TitleFilter.all:
        break;
    }

    // Apply search
    if (_query.isNotEmpty) {
      final q = _query.toLowerCase();
      list = list
          .where((t) =>
              t.titleText.toLowerCase().contains(q) ||
              (t.category?.toLowerCase().contains(q) ?? false) ||
              (t.conditionTag?.toLowerCase().contains(q) ?? false))
          .toList();
    }

    return list;
  }

  void onSearchChanged(String value) {
    _query = value;
    notifyListeners();
  }

  void onFilterChanged(TitleFilter f) {
    _filter = f;
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
