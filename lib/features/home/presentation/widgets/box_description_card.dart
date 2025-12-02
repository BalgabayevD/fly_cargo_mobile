import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

class BoxDescriptionCard extends StatelessWidget {
  final String description;

  const BoxDescriptionCard({
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppCardWithTitle(
      title: 'Описание',
      variant: AppCardVariant.filled,
      child: Text(
        description,
        style: AppTypography.bodyMedium.copyWith(
          height: AppTypography.lineHeightRelaxed,
        ),
      ),
    );
  }
}
