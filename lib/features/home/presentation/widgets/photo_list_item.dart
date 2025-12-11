import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

class PhotoListItem extends StatelessWidget {
  final String photoName;
  final VoidCallback onDelete;

  const PhotoListItem({
    required this.photoName,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
        border: Border.all(
          color: AppColors.surface2,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          HeroIcon(
            HeroIcons.photo,
            size: 20,
            color: AppColors.surface4,
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Text(
              photoName,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.surface5,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          IconButton(
            icon: HeroIcon(
              HeroIcons.xMark,
              size: 20,
              color: AppColors.surface4,
            ),
            onPressed: onDelete,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}
