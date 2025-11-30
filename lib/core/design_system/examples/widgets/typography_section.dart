import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

/// Секция демонстрации типографии
class TypographySection extends StatelessWidget {
  const TypographySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Заголовок 1', style: AppTypography.h1),
        const SizedBox(height: AppSpacing.sm),
        Text('Заголовок 2', style: AppTypography.h2),
        const SizedBox(height: AppSpacing.sm),
        Text('Заголовок 3', style: AppTypography.h3),
        const SizedBox(height: AppSpacing.sm),
        Text('Заголовок 4', style: AppTypography.h4),
        const SizedBox(height: AppSpacing.sm),
        Text('Заголовок 5', style: AppTypography.h5),
        const SizedBox(height: AppSpacing.sm),
        Text('Заголовок 6', style: AppTypography.h6),
        const SizedBox(height: AppSpacing.md),
        Text('Основной текст (Large)', style: AppTypography.bodyLarge),
        const SizedBox(height: AppSpacing.sm),
        Text('Основной текст (Medium)', style: AppTypography.bodyMedium),
        const SizedBox(height: AppSpacing.sm),
        Text('Основной текст (Small)', style: AppTypography.bodySmall),
        const SizedBox(height: AppSpacing.md),
        Text('Подзаголовок Large', style: AppTypography.subtitleLarge),
        const SizedBox(height: AppSpacing.sm),
        Text('Подзаголовок Medium', style: AppTypography.subtitleMedium),
        const SizedBox(height: AppSpacing.sm),
        Text('Подзаголовок Small', style: AppTypography.subtitleSmall),
      ],
    );
  }
}
