import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

class TariffCharacteristicsCard extends StatelessWidget {
  final double? weight;
  final double? length;
  final double? width;
  final double? height;
  final double? volumetricWeight;

  const TariffCharacteristicsCard({
    this.weight,
    this.length,
    this.width,
    this.height,
    this.volumetricWeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surface1,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Характеристики',
            style: AppTypography.h5.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: AppSpacing.md),
          _CharacteristicRow(label: 'Вес', value: '${weight ?? 0} кг'),
          if (length != null && length! > 0)
            _CharacteristicRow(label: 'Длина', value: '$length см'),
          if (width != null && width! > 0)
            _CharacteristicRow(label: 'Ширина', value: '$width см'),
          if (height != null && height! > 0)
            _CharacteristicRow(label: 'Высота', value: '$height см'),
          if (volumetricWeight != null && volumetricWeight! > 0)
            _CharacteristicRow(
              label: 'Объемный вес',
              value: '$volumetricWeight кг',
            ),
        ],
      ),
    );
  }
}

class _CharacteristicRow extends StatelessWidget {
  final String label;
  final String value;

  const _CharacteristicRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.surface4,
            ),
          ),
          Text(
            value,
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
