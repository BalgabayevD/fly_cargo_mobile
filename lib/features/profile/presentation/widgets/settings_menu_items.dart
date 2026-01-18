import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:heroicons/heroicons.dart';

class SettingsUserMenuItem extends StatelessWidget {
  final String? displayName;
  final String? userPhone;
  final bool isAuthenticated;
  final VoidCallback onTap;

  const SettingsUserMenuItem({
    required this.onTap,
    required this.isAuthenticated,
    this.displayName,
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
          vertical: AppSpacing.paddingLG,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                HeroIcon(
                  HeroIcons.userCircle,
                  size: 24,
                  color: AppColors.surface5,
                ),
                const SizedBox(width: AppSpacing.md),
                isAuthenticated
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            displayName ?? '',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.surface5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          Text(
                            userPhone ?? '',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.surface5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    : Text(
                        context.l10n.appAuthSettings,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.surface5,
                        ),
                      ),
              ],
            ),
            HeroIcon(
              HeroIcons.chevronRight,
              size: 16,
              color: AppColors.surface5,
            ),
          ],
        ),
      ),
    );
  }
}

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
        context.l10n.appVersionInfo('2026', appVersion),
        style: TextStyle(
          fontSize: 12,
          color: AppColors.surface4,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
