import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/user/presentation/user_profile_page.dart';

class UserDemoPage extends StatelessWidget {
  const UserDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Демо профиля пользователя',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person,
                size: 60,
                color: Color(0xFF999999),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Профиль пользователя',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Нажмите кнопку ниже, чтобы открыть профиль пользователя',
              style: TextStyle(fontSize: 16, color: Color(0xFF666666)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            AppButton(
              text: 'Открыть профиль',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserProfilePage(),
                  ),
                );
              },
              size: AppButtonSize.large,
              variant: AppButtonVariant.primary,
              isFullWidth: true,
            ),
            const SizedBox(height: 16),
            const Text(
              'Реализованные функции:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  _FeatureItem(
                    icon: Icons.person,
                    title: 'Мой профиль',
                    description: 'Редактирование личной информации',
                  ),
                  _FeatureItem(
                    icon: Icons.credit_card,
                    title: 'Платежные карты',
                    description: 'Управление картами и способами оплаты',
                  ),
                  _FeatureItem(
                    icon: Icons.notifications,
                    title: 'Уведомления',
                    description: 'Настройки уведомлений и история',
                  ),
                  _FeatureItem(
                    icon: Icons.history,
                    title: 'История заказов',
                    description: 'Просмотр и фильтрация заказов',
                  ),
                  _FeatureItem(
                    icon: Icons.payment,
                    title: 'Платежи',
                    description: 'История транзакций и статистика',
                  ),
                  _FeatureItem(
                    icon: Icons.calculate,
                    title: 'Калькулятор стоимости',
                    description: 'Расчет стоимости доставки',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _FeatureItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF007AFF).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: const Color(0xFF007AFF), size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF666666),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
