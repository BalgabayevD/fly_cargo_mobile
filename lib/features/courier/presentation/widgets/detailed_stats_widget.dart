import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

class DetailedStatsWidget extends StatelessWidget {
  final int deliveries;
  final double rating;
  final int timeOnRoad;
  final double distance;

  const DetailedStatsWidget({
    super.key,
    required this.deliveries,
    required this.rating,
    required this.timeOnRoad,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return AppCardWithTitle(
      title: 'Детальная статистика',
      variant: AppCardVariant.filled,
      child: Column(
        children: [
          _buildStatRow('Доставки выполнено', '$deliveries'),
          _buildStatRow('Средний рейтинг', rating.toString()),
          _buildStatRow('Время в пути', '$timeOnRoad ч'),
          _buildStatRow('Расстояние', '${distance.toInt()} км'),
        ],
      ),
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Color(0xFF666666)),
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
