import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/expense.dart';
import '../providers/expense_provider.dart';

class ExpenseDetailScreen extends StatelessWidget {
  final Expense expense;

  const ExpenseDetailScreen({super.key, required this.expense});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Expense details')),
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        CircleAvatar(radius: 32, child: Text(expense.category.substring(0, 1))),
        const SizedBox(height: 16),
        Text(
          expense.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          '₹${expense.amount.toStringAsFixed(2)}',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 20),
        _row('Category', expense.category),
        _row(
          'Date',
          '${expense.date.day}/${expense.date.month}/${expense.date.year}',
        ),
        _row('Note', expense.note.isEmpty ? 'No note added' : expense.note),
        const SizedBox(height: 20),
        OutlinedButton.icon(
          icon: const Icon(Icons.delete_outline),
          label: const Text('Delete expense'),
          onPressed: () async {
            final yes = await showDialog<bool>(
              context: context,
              builder: (d) => AlertDialog(
                title: const Text('Delete expense?'),
                content: const Text('This expense will be removed.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(d, false),
                    child: const Text('Cancel'),
                  ),
                  FilledButton(
                    onPressed: () => Navigator.pop(d, true),
                    child: const Text('Delete'),
                  ),
                ],
              ),
            );

            if (yes == true && context.mounted) {
              await context.read<ExpenseProvider>().deleteExpense(expense.id);

              if (context.mounted) Navigator.pop(context);
            }
          },
        ),
      ],
    ),
  );

  Widget _row(String label, String value) => Card(
    child: ListTile(title: Text(label), subtitle: Text(value)),
  );
}
