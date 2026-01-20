import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';

class EmptyOrdersListState extends StatelessWidget {
  const EmptyOrdersListState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.l10n.noOrdersYet,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.surface5,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              context.l10n.createFirstOrder,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.surface4,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
