import 'package:flutter/material.dart';
class DeliveriesStatisticsDialog extends StatelessWidget {
  final Map<String, dynamic> statistics;
  const DeliveriesStatisticsDialog({
    required this.statistics, super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Статистика доставок'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildStatRow('Всего доставок', '${statistics['totalDeliveries']}'),
          _buildStatRow('Доставлено', '${statistics['deliveredCount']}'),
          _buildStatRow('Отменено', '${statistics['cancelledCount']}'),
          _buildStatRow('Общий заработок', '${statistics['totalEarnings'].toInt()} ₸'),
          _buildStatRow('Средний чек', '${statistics['averageEarnings'].toInt()} ₸'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Закрыть'),
        ),
      ],
    );
  }
  Widget _buildStatRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF666666),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF333333),
            ),
          ),
        ],
      ),
    );
  }
}
