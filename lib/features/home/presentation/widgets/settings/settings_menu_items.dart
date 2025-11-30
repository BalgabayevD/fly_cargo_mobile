import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:heroicons/heroicons.dart';

/// Пункт меню настроек
class SettingsMenuItem extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String? rightText;
  final VoidCallback onTap;
  final bool showExternalLink;

  const SettingsMenuItem({
    required this.title,
    required this.onTap,
    this.icon,
    this.rightText,
    this.showExternalLink = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: AppColors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.paddingLG,
        ),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, size: 24, color: AppColors.textPrimary),
              const SizedBox(width: AppSpacing.md),
            ] else
              const SizedBox(width: 0),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (rightText != null) ...[
              Text(
                rightText!,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
            ],
            if (showExternalLink)
              const HeroIcon(
                HeroIcons.arrowTopRightOnSquare,
                size: 20,
                color: AppColors.textSecondary,
              ),
            // else if (rightText == null)
            //   const HeroIcon(
            //     HeroIcons.chevronRight,
            //     size: 20,
            //     color: AppColors.textSecondary,
            //   ),
          ],
        ),
      ),
    );
  }
}

/// Пункт меню с информацией о пользователе
class SettingsUserMenuItem extends StatelessWidget {
  final String? userName;
  final String? userPhone;
  final VoidCallback onTap;

  const SettingsUserMenuItem({
    required this.onTap,
    this.userName,
    this.userPhone,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: AppColors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        child: Row(
          children: [
            const HeroIcon(
              HeroIcons.userCircle,
              size: 24,
              color: AppColors.textPrimary,
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: userName != null && userPhone != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName!,
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          userPhone!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    )
                  : const Text(
                      'Авторизация в приложении',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.textPrimary,
                      ),
                    ),
            ),
            const HeroIcon(
              HeroIcons.chevronRight,
              size: 20,
              color: AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}

/// Футер с версией приложения
class SettingsFooter extends StatelessWidget {
  final String appVersion;

  const SettingsFooter({
    required this.appVersion,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Text(
        'Sapsano 2025 год. Версия $appVersion',
        style: const TextStyle(
          fontSize: 12,
          color: AppColors.textTertiary,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
