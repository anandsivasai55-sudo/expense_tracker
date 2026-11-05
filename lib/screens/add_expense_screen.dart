import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/expense.dart';
import '../providers/expense_provider.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final formKey = GlobalKey<FormState>();
  final title = TextEditingController();
  final amount = TextEditingController();
  final note = TextEditingController();
  final categories = const [
    'Food',
    'Travel',
    'Shopping',
    'Education',
    'Bills',
    'Other',
  ];
  String category = 'Food';
  DateTime date = DateTime.now();
  bool saving = false;

  @override
  void dispose() {
    title.dispose();
    amount.dispose();
    note.dispose();
    super.dispose();
  }

  Future<void> save() async {
    if (!formKey.currentState!.validate()) return;
    setState(() => saving = true);
    try {
      final item = Expense(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        title: title.text.trim(),
        amount: double.parse(amount.text.trim()),
        category: category,
        date: date,
        note: note.text.trim(),
      );
      await context.read<ExpenseProvider>().addExpense(item);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Expense saved successfully')),
      );
      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Could not save expense: $e')));
    } finally {
      if (mounted) setState(() => saving = false);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Add expense')),
    body: Form(
      key: formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextFormField(
            controller: title,
            maxLength: 60,
            decoration: const InputDecoration(
              labelText: 'Expense title',
              border: OutlineInputBorder(),
            ),
            validator: (v) {
              if (v == null || v.trim().isEmpty)
                return 'Please enter an expense title';
              if (v.trim().length < 2)
                return 'Title must contain at least 2 characters';
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: amount,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: 'Amount (₹)',
              border: OutlineInputBorder(),
            ),
            validator: (v) {
              final n = double.tryParse(v?.trim() ?? '');
              if (n == null) return 'Enter a valid amount';
              if (n <= 0) return 'Amount must be greater than zero';
              if (n > 100000000) return 'Enter a smaller amount';
              return null;
            },
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: category,
            decoration: const InputDecoration(
              labelText: 'Category',
              border: OutlineInputBorder(),
            ),
            items: categories
                .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                .toList(),
            onChanged: (v) {
              if (v != null) setState(() => category = v);
            },
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            icon: const Icon(Icons.calendar_month),
            label: Text('Date: ${date.day}/${date.month}/${date.year}'),
            onPressed: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: date,
                firstDate: DateTime(2020),
                lastDate: DateTime.now(),
              );
              if (picked != null) setState(() => date = picked);
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: note,
            maxLength: 200,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'Note (optional)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: saving ? null : save,
            child: Text(saving ? 'Saving...' : 'Save expense'),
          ),
        ],
      ),
    ),
  );
}
