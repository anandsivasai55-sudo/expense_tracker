import 'package:flutter/foundation.dart';

import '../models/expense.dart';
import '../services/expense_storage_service.dart';

class ExpenseProvider extends ChangeNotifier {
  final ExpenseStorageService storage;
  ExpenseProvider(this.storage);

  List<Expense> _items = [];
  bool isLoading = true;
  String? errorMessage;

  List<Expense> get expenses => List.unmodifiable(_items);
  double get total => _items.fold(0, (s, e) => s + e.amount);

  double get monthTotal {
    final now = DateTime.now();
    return _items
        .where((e) => e.date.year == now.year && e.date.month == now.month)
        .fold(0, (s, e) => s + e.amount);
  }

  Map<String, double> get categoryTotals {
    final map = <String, double>{};
    for (final e in _items) {
      map[e.category] = (map[e.category] ?? 0) + e.amount;
    }
    return map;
  }

  Future<void> loadExpenses() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      _items = await storage.loadExpenses();
    } catch (_) {
      errorMessage = 'Unable to load saved expenses. Please retry.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addExpense(Expense expense) async {
    final updated = [..._items, expense];
    await storage.saveExpenses(updated);
    _items = updated;
    notifyListeners();
  }

  Future<void> deleteExpense(String id) async {
    final updated = _items.where((e) => e.id != id).toList();
    await storage.saveExpenses(updated);
    _items = updated;
    notifyListeners();
  }
}
