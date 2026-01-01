import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

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
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.surface2,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.inbox_outlined,
                size: 60,
                color: AppColors.surface5,
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(
              'У вас пока нет заказов',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.surface5,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Создайте свой первый заказ\nна главной странице',
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

