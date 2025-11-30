import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

/// Текст-ссылка с оранжевым цветом
class InfoLinkText extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const InfoLinkText({
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusXS),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.xs,
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

