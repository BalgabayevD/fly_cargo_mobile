import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/courier/models/courier_profile_model.dart';
import 'package:fly_cargo/features/courier/presentation/widgets/transaction_item_widget.dart';

class TransactionsListWidget extends StatelessWidget {
  final List<IncomeTransaction> transactions;

  const TransactionsListWidget({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return AppCardWithTitle(
      title: 'История транзакций',
      variant: AppCardVariant.filled,
      child: Column(
        children: [
          if (transactions.isEmpty)
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Нет транзакций за выбранный период',
                style: TextStyle(fontSize: 14, color: Color(0xFF666666)),
              ),
            )
          else
            ...transactions.map(
              (transaction) => TransactionItemWidget(transaction: transaction),
            ),
        ],
      ),
    );
  }
}
