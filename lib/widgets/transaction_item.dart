import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.deepPurple.shade100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                transaction.category,
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ],
          ),

          Text(
            transaction.amount,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: transaction.amount.contains('-')
                  ? Colors.redAccent
                  : Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
