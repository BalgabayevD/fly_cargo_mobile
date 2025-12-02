import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

class PriceInfoContainer extends StatelessWidget {
  final double basePrice;
  final String currency;

  const PriceInfoContainer({
    required this.basePrice,
    required this.currency,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: AppDecorations.borderedContainerDecoration(
        gradient: AppGradients.primaryLightGradient(opacity: 0.1),
        borderColor: AppColors.primary.withValues(alpha: 0.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _PriceInfo(basePrice: basePrice, currency: currency),
          const _ShippingIcon(),
        ],
      ),
    );
  }
}

class _PriceInfo extends StatelessWidget {
  final double basePrice;
  final String currency;

  const _PriceInfo({
    required this.basePrice,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Стоимость доставки',
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'от ${basePrice.toInt()} $currency',
          style: AppTypography.h4.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _ShippingIcon extends StatelessWidget {
  const _ShippingIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
      ),
      child: const Icon(
        Icons.local_shipping,
        color: AppColors.white,
        size: AppSpacing.iconSizeLG,
      ),
    );
  }
}
