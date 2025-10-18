import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

class IncomeStatsWidget extends StatelessWidget {
  final double earnings;
  final int deliveries;

  const IncomeStatsWidget({
    super.key,
    required this.earnings,
    required this.deliveries,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      variant: AppCardVariant.filled,
      backgroundColor: const Color(0xFF007AFF).withValues(alpha: 0.1),
      child: Column(
        children: [
          const Text(
            'Заработок',
            style: TextStyle(fontSize: 16, color: Color(0xFF666666)),
          ),
          const SizedBox(height: 8),
          Text(
            '${earnings.toInt()} ₸',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: Color(0xFF007AFF),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem('Доставки', '$deliveries', Icons.local_shipping),
              _buildStatItem(
                'Средний чек',
                '${deliveries > 0 ? (earnings / deliveries).toInt() : 0} ₸',
                Icons.analytics,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xFF007AFF), size: 20),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Color(0xFF666666)),
        ),
      ],
    );
  }
}
