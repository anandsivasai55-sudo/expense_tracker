import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/providers/expense_provider.dart';
import 'package:expense_tracker/services/expense_storage_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Expense Tracker dashboard opens', (tester) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ExpenseProvider(ExpenseStorageService())..loadExpenses(),
        child: const ExpenseTrackerApp(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('My Expense Tracker'), findsOneWidget);
    expect(find.text('Recent expenses'), findsOneWidget);
    expect(find.text('Add expense'), findsOneWidget);
  });
}
