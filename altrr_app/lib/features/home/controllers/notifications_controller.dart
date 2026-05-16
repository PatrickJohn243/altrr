import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../shared/models/app_notification.dart';

class NotificationsController extends ChangeNotifier {
  NotificationsController._();
  static final instance = NotificationsController._();

  static const _kKey = 'altrr_notifications';
  static const _maxStored = 50;

  List<AppNotification> _items = [];

  List<AppNotification> get all => _items;

  List<AppNotification> get todayItems {
    final today = DateTime.now();
    return _items
        .where((n) =>
            n.timestamp.year == today.year &&
            n.timestamp.month == today.month &&
            n.timestamp.day == today.day)
        .toList();
  }

  List<AppNotification> get earlierItems {
    final today = DateTime.now();
    return _items
        .where((n) => !(n.timestamp.year == today.year &&
            n.timestamp.month == today.month &&
            n.timestamp.day == today.day))
        .toList();
  }

  int get unreadCount => _items.where((n) => !n.isRead).length;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_kKey);
    if (raw != null) {
      try {
        _items = AppNotification.listFromJson(raw);
      } catch (_) {
        _items = [];
      }
    }
    notifyListeners();
  }

  Future<void> add(AppNotification notification) async {
    _items.insert(0, notification);
    if (_items.length > _maxStored) {
      _items = _items.sublist(0, _maxStored);
    }
    await _persist();
    notifyListeners();
  }

  Future<void> markAllRead() async {
    for (final n in _items) {
      n.isRead = true;
    }
    await _persist();
    notifyListeners();
  }

  Future<void> _persist() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kKey, AppNotification.listToJson(_items));
  }

  /// Returns a relative time label: "just now", "5m ago", "2h ago",
  /// "Yesterday", or "MMM d" for older dates.
  static String relativeTime(DateTime timestamp) {
    final diff = DateTime.now().difference(timestamp);
    if (diff.inMinutes < 1) return 'just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays == 1) return 'Yesterday';
    return '${_monthName(timestamp.month)} ${timestamp.day}';
  }

  static String _monthName(int month) => const [
        '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
      ][month];
}
