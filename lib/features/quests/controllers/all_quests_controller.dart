import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../../../core/database/isar_service.dart';
import '../../../shared/models/quest.dart';

export '../../../shared/models/quest.dart';

class AllQuestsController extends ChangeNotifier {
  final searchController = TextEditingController();
  final Isar _isar = IsarService.instance;

  List<Quest> _all = [];
  String _query = '';

  String get query => _query;
  int get totalCount => _all.length;

  AllQuestsController() {
    _load();
  }

  Future<void> reload() => _load();

  Future<void> _load() async {
    _all = await _isar.quests
        .filter()
        .statusEqualTo(QuestStatus.completed)
        .sortByAssignedAtDesc()
        .findAll();
    notifyListeners();
  }

  List<Quest> get filtered {
    if (_query.isEmpty) return _all;
    final q = _query.toLowerCase();
    return _all
        .where((quest) =>
            quest.title.toLowerCase().contains(q) ||
            quest.category.toLowerCase().contains(q))
        .toList();
  }

  void onSearchChanged(String value) {
    _query = value;
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
