import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

/// Секция демонстрации цветов
class ColorsSection extends StatelessWidget {
  const ColorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColorRow(name: 'Primary', color: AppColors.primary),
        ColorRow(name: 'Primary Light', color: AppColors.primaryLight),
        ColorRow(name: 'Primary Dark', color: AppColors.primaryDark),
        const SizedBox(height: AppSpacing.md),
        ColorRow(name: 'Secondary', color: AppColors.secondary),
        ColorRow(name: 'Secondary Light', color: AppColors.secondaryLight),
        ColorRow(name: 'Secondary Dark', color: AppColors.secondaryDark),
        const SizedBox(height: AppSpacing.md),
        ColorRow(name: 'Success', color: AppColors.success),
        ColorRow(name: 'Warning', color: AppColors.warning),
        ColorRow(name: 'Error', color: AppColors.error),
        ColorRow(name: 'Info', color: AppColors.info),
      ],
    );
  }
}

/// Строка с цветом
class ColorRow extends StatelessWidget {
  final String name;
  final Color color;

  const ColorRow({
    required this.name,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(AppSpacing.radiusSM),
              border: Border.all(color: AppColors.border),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppTypography.bodyMedium),
                Text(
                  '#${color.value.toRadixString(16).substring(2).toUpperCase()}',
                  style: AppTypography.caption,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

