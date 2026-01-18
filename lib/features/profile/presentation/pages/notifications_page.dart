import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:go_router/go_router.dart';

class NotificationsPage extends StatelessWidget {
  static const String path = 'notifications';

  const NotificationsPage({super.key});

  static GoRoute route({GlobalKey<NavigatorState>? parentNavigatorKey}) {
    return GoRoute(
      path: path,
      parentNavigatorKey: parentNavigatorKey,
      builder: (context, state) => const NotificationsPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BePage(
      title: context.l10n.notificationSettings,
      automaticallyImplyLeading: true,
      centerTitle: false,
      child: ListView(
        children: [
          _NotificationSettingTile(
            title: 'Push-уведомления',
            description: 'Получать уведомления о статусе заказов',
            isEnabled: true,
            onChanged: (value) {},
          ),
          const SizedBox(height: AppSpacing.md),
          _NotificationSettingTile(
            title: 'Email уведомления',
            description: 'Получать email с информацией о заказах',
            isEnabled: false,
            onChanged: (value) {},
          ),
          const SizedBox(height: AppSpacing.md),
          _NotificationSettingTile(
            title: 'SMS уведомления',
            description: 'Получать SMS о важных событиях',
            isEnabled: true,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}

class _NotificationSettingTile extends StatelessWidget {
  final String title;
  final String description;
  final bool isEnabled;
  final ValueChanged<bool> onChanged;

  const _NotificationSettingTile({
    required this.title,
    required this.description,
    required this.isEnabled,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.surface5,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.surface4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Switch(
            value: isEnabled,
            onChanged: onChanged,
            activeTrackColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
