import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/orders/presentation/models/order_status.dart';
import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';
import 'package:intl/intl.dart';

class OrderCard extends StatelessWidget {
  final OrderEntity order;
  final VoidCallback? onTap;

  const OrderCard({
    required this.order,
    this.onTap,
    super.key,
  });

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
            _OrderCardHeader(
              orderId: order.id.toString(),
              createdAt: order.createdAt,
            ),
            const SizedBox(height: AppSpacing.md),
            if (trackingNumber != null)
              _OrderTrackingNumber(trackingNumber: trackingNumber),
            if (order.price != null && trackingNumber == null)
              _OrderCost(price: order.price!),
            const SizedBox(height: AppSpacing.sm),
            _OrderStatusText(status: status),
          ],
        ),
      ),
    );
  }
}

class _OrderCardHeader extends StatelessWidget {
  final String orderId;
  final String createdAt;

  const _OrderCardHeader({
    required this.orderId,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            context.l10n.orderNumber(orderId),
            style: AppTypography.h6.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.surface5,
            ),
          ),
        ),
        Text(
          _formatDate(createdAt),
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.surface5,
          ),
        ),
      ],
    );
  }

  String _formatDate(String dateString) {
    try {
      final clean = dateString.trim().replaceAll('"', '');
      final date = DateTime.parse(clean);
      final formatter = DateFormat('d.M.yyyy');
      return formatter.format(date.toLocal());
    } catch (e) {
      return dateString;
    }
  }
}

class _OrderTrackingNumber extends StatelessWidget {
  final String trackingNumber;

  const _OrderTrackingNumber({
    required this.trackingNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.trackingNumber(trackingNumber),
      style: AppTypography.bodyMedium.copyWith(
        color: AppColors.surface4,
      ),
    );
  }
}

class _OrderCost extends StatelessWidget {
  final double price;

  const _OrderCost({
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.orderCost(price.toStringAsFixed(0)),
      style: AppTypography.bodyMedium.copyWith(
        color: AppColors.surface4,
      ),
    );
  }
}

class _OrderStatusText extends StatelessWidget {
  final OrderStatus status;

  const _OrderStatusText({
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      status.getLocalizedText(context),
      style: AppTypography.cardTitle.copyWith(
        color: status.statusTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 17,
      ),
    );
  }
}
