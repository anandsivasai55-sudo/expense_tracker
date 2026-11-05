import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/expense_provider.dart';
import '../widgets/expense_state_view.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

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
          icon: Icons.pie_chart_outline,
          message: 'Add expenses to see your category summary.',
        );
      }

      final entries = p.categoryTotals.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));

      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Total spending',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            '₹${p.total.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          Text(
            'Spending by category',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          ...entries.map(
            (e) => Card(
              child: ListTile(
                title: Text(e.key),
                trailing: Text('₹${e.value.toStringAsFixed(2)}'),
              ),
            ),
          ),
        ],
      );
    },
  );
}
