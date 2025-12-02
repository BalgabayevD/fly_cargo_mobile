import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

class ButtonsSection extends StatelessWidget {
  const ButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Primary кнопки', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: AppSpacing.sm),
        AppButton(
          text: 'Primary Large',
          size: AppButtonSize.large,
          variant: AppButtonVariant.primary,
          isFullWidth: true,
          onPressed: () {},
        ),
        const SizedBox(height: AppSpacing.sm),
        AppButton(
          text: 'Primary Medium',
          size: AppButtonSize.medium,
          variant: AppButtonVariant.primary,
          isFullWidth: true,
          onPressed: () {},
        ),
        const SizedBox(height: AppSpacing.sm),
        AppButton(
          text: 'Primary Small',
          size: AppButtonSize.small,
          variant: AppButtonVariant.primary,
          isFullWidth: true,
          onPressed: () {},
        ),
        const SizedBox(height: AppSpacing.md),
        const Text('Secondary кнопки', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: AppSpacing.sm),
        AppButton(
          text: 'Secondary Button',
          variant: AppButtonVariant.secondary,
          isFullWidth: true,
          onPressed: () {},
        ),
        const SizedBox(height: AppSpacing.md),
        const Text('Outline кнопки', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: AppSpacing.sm),
        AppButton(
          text: 'Outline Button',
          variant: AppButtonVariant.outline,
          isFullWidth: true,
          onPressed: () {},
        ),
        const SizedBox(height: AppSpacing.md),
        const Text('Ghost кнопки', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: AppSpacing.sm),
        AppButton(
          text: 'Ghost Button',
          variant: AppButtonVariant.ghost,
          isFullWidth: true,
          onPressed: () {},
        ),
        const SizedBox(height: AppSpacing.md),
        const Text('Кнопки с иконками', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: AppSpacing.sm),
        AppButton(
          text: 'С иконкой',
          icon: Icons.send,
          isFullWidth: true,
          onPressed: () {},
        ),
        const SizedBox(height: AppSpacing.md),
        const Text('Disabled кнопки', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: AppSpacing.sm),
        const AppButton(
          text: 'Disabled Button',
          isFullWidth: true,
          onPressed: null,
        ),
        const SizedBox(height: AppSpacing.md),
        const Text('Иконочные кнопки', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: AppSpacing.sm),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppIconButton(
              icon: Icons.favorite,
              size: AppButtonSize.small,
              variant: AppButtonVariant.primary,
              onPressed: () {},
            ),
            AppIconButton(
              icon: Icons.share,
              size: AppButtonSize.medium,
              variant: AppButtonVariant.secondary,
              onPressed: () {},
            ),
            AppIconButton(
              icon: Icons.settings,
              size: AppButtonSize.large,
              variant: AppButtonVariant.outline,
              onPressed: () {},
            ),
            AppIconButton(
              icon: Icons.delete,
              size: AppButtonSize.large,
              variant: AppButtonVariant.danger,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
