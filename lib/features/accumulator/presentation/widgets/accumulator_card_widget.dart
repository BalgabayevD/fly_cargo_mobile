import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/features/accumulator/domain/entities/accumulator_entity.dart';
import 'package:intl/intl.dart';

class AccumulatorCardWidget extends StatelessWidget {
  final AccumulatorEntity accumulator;
  final VoidCallback? onTap;

  const AccumulatorCardWidget({
    required this.accumulator,
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _getStatusColor(),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: _getStatusBorderColor(), width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Накопитель ${accumulator.id}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: BeColors.surface5,
                  ),
                ),
                Text(
                  _formatDate(accumulator.createdAt),
                  style: const TextStyle(
                    fontSize: 14,
                    color: BeColors.surface4,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Трековый номер ${accumulator.identification}',
              style: const TextStyle(
                fontSize: 14,
                color: BeColors.surface4,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Заказов: ${accumulator.orders.length}',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: _getStatusTextColor(),
              ),
            ),
            if (_getStatusLabel().isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                _getStatusLabel(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: _getStatusTextColor(),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getStatusColor() {
    switch (accumulator.status) {
      case 'open':
        return BeColors.warningLight;
      case 'arrived':
        return BeColors.successLight;
      case 'close':
        return BeColors.surface2;
      default:
        return BeColors.white;
    }
  }

  Color _getStatusBorderColor() {
    switch (accumulator.status) {
      case 'open':
        return BeColors.warning;
      case 'arrived':
        return BeColors.success;
      case 'close':
        return BeColors.surface3;
      default:
        return BeColors.border;
    }
  }

  Color _getStatusTextColor() {
    switch (accumulator.status) {
      case 'open':
        return BeColors.warning;
      case 'arrived':
        return BeColors.success;
      case 'close':
        return BeColors.surface4;
      default:
        return BeColors.surface5;
    }
  }

  String _getStatusLabel() {
    switch (accumulator.status) {
      case 'open':
        return 'Ожидает доставки';
      case 'arrived':
        return 'Прибыл';
      case 'close':
        return 'Выполнен';
      default:
        return '';
    }
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('dd.MM.yyyy').format(date);
    } catch (_) {
      return dateString;
    }
  }
}
