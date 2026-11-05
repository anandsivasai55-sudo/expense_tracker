class Expense {
  final String id, title, category, note;
  final double amount;
  final DateTime date;

  const Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    required this.note,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'amount': amount,
    'category': category,
    'date': date.toIso8601String(),
    'note': note,
  };

  factory Expense.fromJson(Map<String, dynamic> j) => Expense(
    id: j['id'] as String,
    title: j['title'] as String,
    amount: (j['amount'] as num).toDouble(),
    category: j['category'] as String,
    date: DateTime.parse(j['date'] as String),
    note: (j['note'] as String?) ?? '',
  );
}
