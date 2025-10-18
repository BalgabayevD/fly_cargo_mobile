import 'package:flutter/material.dart';
import 'package:fly_cargo/features/courier/presentation/courier_home_page.dart';
import 'package:fly_cargo/features/home/presentation/home_page.dart';
import 'package:fly_cargo/features/user/presentation/user_demo_page.dart';

class AppModeSelectionPage extends StatelessWidget {
  const AppModeSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Логотип и заголовок
              const Icon(
                Icons.local_shipping,
                size: 80,
                color: Color(0xFF007AFF),
              ),
              const SizedBox(height: 24),
              const Text(
                'Fly Cargo',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Выберите режим работы',
                style: TextStyle(fontSize: 16, color: Color(0xFF666666)),
              ),
              const SizedBox(height: 60),

              // Кнопка клиента
              _buildModeCard(
                context: context,
                title: 'Клиент',
                subtitle: 'Отправить посылку',
                icon: Icons.person,
                color: const Color(0xFF007AFF),
                onTap: () => _navigateToClientMode(context),
              ),
              const SizedBox(height: 20),

              // Кнопка курьера
              _buildModeCard(
                context: context,
                title: 'Курьер',
                subtitle: 'Доставить заказы',
                icon: Icons.delivery_dining,
                color: const Color(0xFF34C759),
                onTap: () => _navigateToCourierMode(context),
              ),
              const SizedBox(height: 40),

              // Кнопка для тестирования профиля
              TextButton(
                onPressed: () => _navigateToUserProfile(context),
                child: const Text(
                  'Тестировать профиль пользователя',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF007AFF),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Информация
              const Text(
                'Для разработки и тестирования',
                style: TextStyle(fontSize: 12, color: Color(0xFF999999)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModeCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, size: 30, color: color),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF666666),
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 20, color: color),
          ],
        ),
      ),
    );
  }

  void _navigateToClientMode(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  void _navigateToCourierMode(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const CourierHomePage()),
    );
  }

  void _navigateToUserProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserDemoPage()),
    );
  }
}
