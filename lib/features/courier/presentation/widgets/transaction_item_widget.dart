import 'package:flutter/material.dart';
import 'package:fly_cargo/features/courier/models/courier_profile_model.dart';
class TransactionItemWidget extends StatelessWidget {
  final IncomeTransaction transaction;
  const TransactionItemWidget({required this.transaction, super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: transaction.typeColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              _getTransactionIcon(transaction.type),
              color: transaction.typeColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.description,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  _formatDateTime(transaction.date),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF666666),
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${transaction.amount > 0 ? '+' : ''}${transaction.amount.toInt()} ₸',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: transaction.amount > 0
                  ? const Color(0xFF34C759)
                  : const Color(0xFFFF3B30),
            ),
          ),
        ],
      ),
    );
  }
  IconData _getTransactionIcon(String type) {
    switch (type) {
      case 'delivery':
        return Icons.local_shipping;
      case 'bonus':
        return Icons.card_giftcard;
      case 'penalty':
        return Icons.warning;
      default:
        return Icons.payment;
    }
  }
  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day.toString().padLeft(2, '0')}.${dateTime.month.toString().padLeft(2, '0')} в ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
