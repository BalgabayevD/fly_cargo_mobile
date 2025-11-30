import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/user/presentation/widgets/menu_item_widget.dart';
import 'package:fly_cargo/features/user/presentation/widgets/stat_item_widget.dart';

/// Виджет секции статистики
class StatsSection extends StatelessWidget {
  final int daysSinceCreated;

  const StatsSection({required this.daysSinceCreated, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: StatItemWidget(
            label: 'Заказов',
            value: '0',
            icon: Icons.local_shipping,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: StatItemWidget(
            label: 'Дней с нами',
            value: daysSinceCreated.toString(),
            icon: Icons.calendar_today,
            color: AppColors.info,
          ),
        ),
      ],
    );
  }
}

/// Виджет меню пользователя
class UserMenuSection extends StatelessWidget {
  final VoidCallback onOrderHistory;
  final VoidCallback onPaymentCards;
  final VoidCallback onNotifications;

  const UserMenuSection({
    required this.onOrderHistory,
    required this.onPaymentCards,
    required this.onNotifications,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      variant: AppCardVariant.outlined,
      child: Column(
        children: [
          MenuItemWidget(
            icon: Icons.history,
            title: 'История заказов',
            subtitle: 'Просмотр ваших заказов',
            onTap: onOrderHistory,
          ),
          const Divider(height: 1),
          MenuItemWidget(
            icon: Icons.credit_card,
            title: 'Мои карты',
            subtitle: 'Управление платежными картами',
            onTap: onPaymentCards,
          ),
          const Divider(height: 1),
          MenuItemWidget(
            icon: Icons.notifications,
            title: 'Уведомления',
            subtitle: 'Настройка уведомлений',
            onTap: onNotifications,
          ),
        ],
      ),
    );
  }
}

/// Виджет меню сервисов
class ServicesMenuSection extends StatelessWidget {
  final VoidCallback onCostCalculator;
  final VoidCallback onPayments;

  const ServicesMenuSection({
    required this.onCostCalculator,
    required this.onPayments,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      variant: AppCardVariant.outlined,
      child: Column(
        children: [
          MenuItemWidget(
            icon: Icons.calculate,
            title: 'Калькулятор стоимости',
            subtitle: 'Рассчитать стоимость доставки',
            onTap: onCostCalculator,
          ),
          const Divider(height: 1),
          MenuItemWidget(
            icon: Icons.payment,
            title: 'Платежи',
            subtitle: 'История платежей',
            onTap: onPayments,
          ),
        ],
      ),
    );
  }
}
