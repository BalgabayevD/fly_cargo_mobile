import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/entities/box_entity.dart';

/// Карточка с информацией о коробке
class BoxInfoCard extends StatelessWidget {
  final BoxEntity box;

  const BoxInfoCard({
    required this.box,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: AppDecorations.cardDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          children: [
            _BoxImage(imagePath: box.imagePath),
            const SizedBox(height: AppSpacing.xl),
            _BoxName(name: box.name),
            const SizedBox(height: AppSpacing.sm),
            _BoxDimensions(dimensions: box.dimensions),
          ],
        ),
      ),
    );
  }
}

/// Изображение коробки
class _BoxImage extends StatelessWidget {
  final String imagePath;

  const _BoxImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.imageBoxSize,
      height: AppDimensions.imageBoxSize,
      decoration: AppDecorations.imageContainerDecoration(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSpacing.radiusLG),
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

/// Название коробки
class _BoxName extends StatelessWidget {
  final String name;

  const _BoxName({required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: AppTypography.h4.copyWith(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w700,
      ),
      textAlign: TextAlign.center,
    );
  }
}

/// Размеры коробки
class _BoxDimensions extends StatelessWidget {
  final String dimensions;

  const _BoxDimensions({required this.dimensions});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      decoration: AppDecorations.badgeDecoration(),
      child: Text(
        'Размеры: $dimensions',
        style: AppTypography.bodyMedium.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
