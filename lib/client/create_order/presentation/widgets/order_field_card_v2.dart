import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:heroicons/heroicons.dart';

class OrderFieldCardV2 extends StatelessWidget {
  final String label;
  final String? value;
  final VoidCallback? onTap;
  final bool showChevron;

  const OrderFieldCardV2({
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
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.surface4,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  if (value != null) ...[
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      value!,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.surface5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (showChevron && onTap != null) ...[
              const SizedBox(width: AppSpacing.sm),
              HeroIcon(
                HeroIcons.chevronRight,
                size: 20,
                color: AppColors.surface4,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
