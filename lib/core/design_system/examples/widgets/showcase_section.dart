import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

class ShowcaseSection extends StatelessWidget {
  final String title;
  final Widget child;

  const ShowcaseSection({
    required this.title,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTypography.h4),
        const SizedBox(height: AppSpacing.md),
        child,
        const SizedBox(height: AppSpacing.xxl),
      ],
    );
  }
}
