import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:heroicons/heroicons.dart';

class ReadOnlyAddressField extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback? onTap;

  const ReadOnlyAddressField({
    required this.label,
    required this.value,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
            border: Border.all(
              color: AppColors.border,
              width: AppSpacing.borderWidth,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: AppTypography.bodyLarge,
                ),
              ),
              if (onTap != null) ...[
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
      ],
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
        child: content,
      );
    }

    return content;
  }
}

class AddressTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? hintText;
  final TextInputType? keyboardType;

  const AddressTextField({
    required this.label,
    required this.controller,
    this.hintText,
    this.keyboardType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTypography.bodyMedium.copyWith(
              color: AppColors.textTertiary,
            ),
            filled: true,
            fillColor: AppColors.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
              borderSide: const BorderSide(
                color: AppColors.border,
                width: AppSpacing.borderWidth,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
              borderSide: const BorderSide(
                color: AppColors.border,
                width: AppSpacing.borderWidth,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: AppSpacing.borderWidthThick,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.md,
            ),
          ),
          style: AppTypography.bodyLarge,
        ),
      ],
    );
  }
}
