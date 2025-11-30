import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

/// Универсальная карточка для отображения полей формы заказа
class OrderFieldCard extends StatelessWidget {
  final String label;
  final String? value;
  final VoidCallback? onTap;
  final bool showChevron;

  const OrderFieldCard({
    required this.label,
    this.value,
    this.onTap,
    this.showChevron = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
          border: Border.all(
            color: AppColors.borderLight,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    value ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            if (showChevron && onTap != null) ...[
              const SizedBox(width: AppSpacing.sm),
              const HeroIcon(
                HeroIcons.chevronRight,
                size: 20,
                color: AppColors.textSecondary,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

