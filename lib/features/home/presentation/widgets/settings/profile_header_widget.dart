import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

/// Виджет заголовка профиля
class ProfileHeaderWidget extends StatelessWidget {
  final dynamic profile;

  const ProfileHeaderWidget({required this.profile, super.key});

  @override
  Widget build(BuildContext context) {
    final fullName = '${profile.firstName} ${profile.lastName}'.trim();
    final phoneNumber = profile.phone ?? '';

    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.primary,
                AppColors.primaryDark,
              ],
            ),
          ),
          child: Center(
            child: Text(
              fullName.isNotEmpty ? fullName[0].toUpperCase() : 'У',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          fullName.isNotEmpty ? fullName : 'Пользователь',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          phoneNumber,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
