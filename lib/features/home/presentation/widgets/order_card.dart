import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/shared/orders/data/models/order_model.dart';
import 'package:fly_cargo/shared/orders/presentation/models/order_status.dart';
import 'package:intl/intl.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;

  const OrderCard({
    required this.order,
    super.key,
  });

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final formatter = DateFormat('d.M.yyyy', 'ru');
      return formatter.format(date);
    } catch (e) {
      return dateString;
    }
  }

  @override
  Widget build(BuildContext context) {
    final status = OrderStatusHelper.getStatus(order);
    final trackingNumber = OrderStatusHelper.getTrackingNumber(order);

    return Container(
      decoration: BoxDecoration(
        color: status.backgroundColor,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
        border: status.borderColor != null
            ? Border.all(
                color: status.borderColor!,
                width: 1.5,
              )
            : null,
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
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              Text(
                _formatDate(order.createdAt),
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          if (order.price != null && status == OrderStatus.awaitingPayment)
            Text(
              'Стоимость: ${order.price!.toStringAsFixed(0)} тг',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          if (trackingNumber != null && status != OrderStatus.awaitingPayment)
            Text(
              'Трековый номер $trackingNumber',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          if (order.price != null &&
              trackingNumber == null &&
              status != OrderStatus.awaitingPayment)
            Text(
              'Стоимость: ${order.price!.toStringAsFixed(0)} тг',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            status.text,
            style: AppTypography.bodyMedium.copyWith(
              color: status.statusTextColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
