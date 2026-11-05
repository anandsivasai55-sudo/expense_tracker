import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/expense_provider.dart';
import '../widgets/expense_state_view.dart';
import '../widgets/expense_tile.dart';
import 'expense_detail_screen.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) => Consumer<ExpenseProvider>(
    builder: (context, p, _) {
      if (p.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      if (p.errorMessage != null) {
        return ExpenseStateView(
          icon: Icons.error_outline,
          message: p.errorMessage!,
          buttonText: 'Retry',
          onPressed: p.loadExpenses,
        );
      }

      if (p.expenses.isEmpty) {
        return const ExpenseStateView(
          icon: Icons.inbox,
          message: 'No expenses found. Add an expense to see it here.',
        );
      }

      final items = p.expenses.reversed.toList();

      return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, i) => ExpenseTile(
          expense: items[i],
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ExpenseDetailScreen(expense: items[i]),
            ),
          ),
        ),
      );
    },
  );
}
