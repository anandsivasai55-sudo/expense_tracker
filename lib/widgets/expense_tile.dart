import 'package:flutter/material.dart';

import '../models/expense.dart';

class ExpenseTile extends StatelessWidget {
  final Expense expense;
  final VoidCallback onTap;

  const ExpenseTile({super.key, required this.expense, required this.onTap});

  @override
  Widget build(BuildContext context) => Card(
    child: ListTile(
      leading: const CircleAvatar(child: Icon(Icons.receipt_long)),
      title: Text(expense.title),
      subtitle: Text(
        '${expense.category} • ${expense.date.day}/${expense.date.month}/${expense.date.year}',
      ),
      trailing: Text('₹${expense.amount.toStringAsFixed(2)}'),
      onTap: onTap,
    ),
  );
}
