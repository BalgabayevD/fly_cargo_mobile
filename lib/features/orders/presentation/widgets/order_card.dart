import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/orders/presentation/models/order_status.dart';
import 'package:fly_cargo/features/shared/orders/data/models/order_model.dart';
import 'package:intl/intl.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;
  final VoidCallback? onTap;

  const OrderCard({
    required this.order,
    this.onTap,
    super.key,
  });

  String _formatDate(String dateString) {
    try {
      final clean = dateString.trim().replaceAll('"', '');
      final date = DateTime.parse(clean);
      final formatter = DateFormat('d.M.yyyy', 'ru');
      return formatter.format(date.toLocal());
    } catch (e) {
      return dateString;
    }
  }

  @override
  Widget build(BuildContext context) {
    final status = OrderStatusHelper.getStatus(order);
    final trackingNumber = OrderStatusHelper.getTrackingNumber(order);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: status.backgroundColor,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
          border: Border.all(
            color: status.borderColor,
            width: 1.5,
          ),
        ),
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Заказ ${order.id}',
                    style: AppTypography.h6.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.surface5,
                    ),
                  ),
                ),
                Text(
                  _formatDate(order.createdAt),
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.surface4,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            if (trackingNumber != null)
              Text(
                'Трековый номер $trackingNumber',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.surface4,
                ),
              ),
            if (order.price != null && trackingNumber == null)
              Text(
                'Стоимость: ${order.price!.toStringAsFixed(0)} тг',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.surface4,
                ),
              ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              status.text,
              style: AppTypography.cardTitle.copyWith(
                color: status.statusTextColor,
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
