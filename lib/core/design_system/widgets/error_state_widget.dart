import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

class ErrorStateWidget extends StatelessWidget {
  final String message;

  const ErrorStateWidget({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: AppColors.surface5,
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              message,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.surface4,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.lg),
            ElevatedButton(
              onPressed: () {
                // context.read<AuthBloc>().add(const AuthLoadProfile());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
              ),
              child: const Text('Повторить'),
            ),
          ],
        ),
      ),
    );
  }
}
