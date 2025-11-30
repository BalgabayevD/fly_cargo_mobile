import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

/// Секция демонстрации градиентов
class GradientsSection extends StatelessWidget {
  const GradientsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          decoration: const BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.all(
              Radius.circular(AppSpacing.radiusMD),
            ),
          ),
          child: const Center(
            child: Text(
              'Primary Gradient',
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Container(
          height: 100,
          decoration: const BoxDecoration(
            gradient: AppColors.secondaryGradient,
            borderRadius: BorderRadius.all(
              Radius.circular(AppSpacing.radiusMD),
            ),
          ),
          child: Center(
            child: Text(
              'Secondary Gradient',
              style: AppTypography.h5.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Container(
          height: 100,
          decoration: const BoxDecoration(
            gradient: AppColors.primaryDarkGradient,
            borderRadius: BorderRadius.all(
              Radius.circular(AppSpacing.radiusMD),
            ),
          ),
          child: const Center(
            child: Text(
              'Primary Dark Gradient',
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

