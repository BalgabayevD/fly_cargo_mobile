import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';
import 'package:intl/intl.dart';

class AccumulatorOrderCardWidget extends StatelessWidget {
  final OrderEntity order;
  final VoidCallback? onTap;

  const AccumulatorOrderCardWidget({
    required this.order,
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
                  'Заказ ${order.id}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: BeColors.surface5,
                  ),
                ),
                Text(
                  _formatDate(order.createdAt),
                  style: const TextStyle(
                    fontSize: 14,
                    color: BeColors.surface4,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            if (order.identifications.isNotEmpty)
              Text(
                'Трековый номер ${order.identifications.first.uuid ?? ''}',
                style: const TextStyle(
                  fontSize: 14,
                  color: BeColors.surface4,
                ),
              ),
            if (order.price > 0) ...[
              const SizedBox(height: 4),
              Text(
                'Стоимость: ${order.price.toStringAsFixed(0)} тг',
                style: const TextStyle(
                  fontSize: 14,
                  color: BeColors.surface4,
                ),
              ),
            ],
            const SizedBox(height: 8),
            Text(
              _getStatusLabel(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: _getStatusTextColor(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor() {
    switch (order.status) {
      case 'arrived':
        return BeColors.warningLight;
      case 'delivers_recipient':
        return BeColors.successLight;
      case 'completed':
        return BeColors.surface2;
      default:
        return BeColors.white;
    }
  }

  Color _getStatusBorderColor() {
    switch (order.status) {
      case 'arrived':
        return BeColors.warning;
      case 'delivers_recipient':
        return BeColors.success;
      case 'completed':
        return BeColors.surface3;
      default:
        return BeColors.border;
    }
  }

  Color _getStatusTextColor() {
    switch (order.status) {
      case 'arrived':
        return BeColors.warning;
      case 'delivers_recipient':
        return BeColors.success;
      case 'completed':
        return BeColors.surface4;
      default:
        return BeColors.surface5;
    }
  }

  String _getStatusLabel() {
    switch (order.status) {
      case 'arrived':
        return 'Ожидает доставки';
      case 'delivers_recipient':
        return 'Доставка';
      case 'completed':
        return 'Доставлен';
      default:
        return 'Не прибыл';
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
