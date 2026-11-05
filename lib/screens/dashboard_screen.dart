import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/expense_provider.dart';
import '../widgets/expense_state_view.dart';
import '../widgets/expense_tile.dart';
import 'add_expense_screen.dart';
import 'transactions_screen.dart';
import 'summary_screen.dart';
import 'expense_detail_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int tab = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [_home(), const TransactionsScreen(), const SummaryScreen()];
    return Scaffold(
      appBar: AppBar(title: const Text('My Expense Tracker')),
      body: pages[tab],
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AddExpenseScreen()),
        ),
        icon: const Icon(Icons.add),
        label: const Text('Add expense'),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (i) => setState(() => tab = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(
            icon: Icon(Icons.receipt_long),
            label: 'Transactions',
          ),
          NavigationDestination(
            icon: Icon(Icons.pie_chart_outline),
            label: 'Summary',
          ),
        ],
      ),
    );
  }

  Widget _home() => Consumer<ExpenseProvider>(
    builder: (context, p, _) {
      if (p.isLoading) return const Center(child: CircularProgressIndicator());
      if (p.errorMessage != null)
        return ExpenseStateView(
          icon: Icons.error,
          message: p.errorMessage!,
          buttonText: 'Retry',
          onPressed: p.loadExpenses,
        );

      final recent = p.expenses.reversed.take(4).toList();

      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('This month'),
                  Text(
                    '₹${p.monthTotal.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text('${p.expenses.length} expenses recorded'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Recent expenses',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          if (recent.isEmpty)
            const ExpenseStateView(
              icon: Icons.inbox,
              message: 'No expenses yet. Add your first expense.',
            )
          else
            ...recent.map(
              (e) => ExpenseTile(
                expense: e,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ExpenseDetailScreen(expense: e),
                  ),
                ),
              ),
            ),
        ],
      );
    },
  );
}
