import 'package:flutter/material.dart';

class ExpenseStateView extends StatelessWidget {
  final IconData icon;
  final String message;
  final String? buttonText;
  final VoidCallback? onPressed;

  const ExpenseStateView({
    super.key,
    required this.icon,
    required this.message,
    this.buttonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 48),
          const SizedBox(height: 12),
          Text(message, textAlign: TextAlign.center),
          if (buttonText != null && onPressed != null) ...[
            const SizedBox(height: 12),
            FilledButton(onPressed: onPressed, child: Text(buttonText!)),
          ],
        ],
      ),
    ),
  );
}
