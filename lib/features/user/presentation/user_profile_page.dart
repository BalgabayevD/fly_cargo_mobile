import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/user/presentation/user_cost_calculator_page.dart';
import 'package:fly_cargo/features/user/presentation/user_edit_profile_page.dart';
import 'package:fly_cargo/features/user/presentation/user_notifications_page.dart';
import 'package:fly_cargo/features/user/presentation/user_order_history_page.dart';
import 'package:fly_cargo/features/user/presentation/user_payment_cards_page.dart';
import 'package:fly_cargo/features/user/presentation/user_payments_page.dart';
import 'package:fly_cargo/shared/profile/presentation/bloc/profile_bloc.dart';
import 'package:fly_cargo/shared/profile/presentation/bloc/profile_event.dart';
import 'package:fly_cargo/shared/profile/presentation/bloc/profile_state.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF333333)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Профиль',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Color(0xFF333333)),
            onPressed: () => _editProfile(context),
          ),
        ],
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (profile, daysSinceCreated) => SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Аватар и основная информация
                  _buildProfileHeader(profile),
                  const SizedBox(height: 30),

                  // Статистика пользователя
                  _buildStatsSection(daysSinceCreated),
                  const SizedBox(height: 30),

                  // Первый блок меню (пользовательские настройки)
                  _buildUserMenuSection(context, profile),
                  const SizedBox(height: 20),

                  // Второй блок меню (сервисы)
                  _buildServicesMenuSection(context, profile),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            error: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Color(0xFF999999),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    message,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF666666),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ProfileBloc>().add(
                        const ProfileEvent.loadProfile(),
                      );
                    },
                    child: const Text('Повторить'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileHeader(dynamic profile) {
    final fullName = '${profile.firstName} ${profile.lastName}'.trim();
    return Column(
      children: [
        // Аватар
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFE0E0E0), width: 2),
          ),
          child: profile.photo.isNotEmpty
              ? ClipOval(
                  child: Image.network(
                    profile.photo,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        _buildDefaultAvatar(),
                  ),
                )
              : _buildDefaultAvatar(),
        ),
        const SizedBox(height: 16),

        // Имя
        Text(
          fullName.isNotEmpty ? fullName : 'Пользователь',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 4),

        // Телефон
        Text(
          profile.phone,
          style: const TextStyle(fontSize: 16, color: Color(0xFF666666)),
        ),
      ],
    );
  }

  String _getDaysText(int days) {
    if (days % 10 == 1 && days % 100 != 11) {
      return 'день';
    } else if (days % 10 >= 2 &&
        days % 10 <= 4 &&
        (days % 100 < 10 || days % 100 >= 20)) {
      return 'дня';
    } else {
      return 'дней';
    }
  }

  Widget _buildDefaultAvatar() {
    return const Icon(Icons.person, size: 50, color: Color(0xFF999999));
  }

  Widget _buildStatsSection(int daysSinceCreated) {
    return AppCard(
      variant: AppCardVariant.filled,
      child: Column(
        children: [
          const Text(
            'Статистика',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  'Заказы',
                  '0',
                  Icons.shopping_bag,
                  const Color(0xFF007AFF),
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  'Карты',
                  '0',
                  Icons.credit_card,
                  const Color(0xFF34C759),
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  'С нами',
                  '$daysSinceCreated ${_getDaysText(daysSinceCreated)}',
                  Icons.calendar_today,
                  const Color(0xFFFF9500),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Color(0xFF666666)),
        ),
      ],
    );
  }

  Widget _buildUserMenuSection(BuildContext context, dynamic profile) {
    return AppCard(
      variant: AppCardVariant.outlined,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          _buildMenuItem(
            icon: Icons.person,
            title: 'Мой профиль',
            subtitle: 'Личная информация',
            onTap: () => _editProfile(context),
          ),
          const Divider(height: 1, color: Color(0xFFE0E0E0)),
          _buildMenuItem(
            icon: Icons.credit_card,
            title: 'Платежные карты',
            subtitle: 'Добавить карту',
            onTap: () => _openPaymentCardsPage(context),
          ),
          const Divider(height: 1, color: Color(0xFFE0E0E0)),
          _buildMenuItem(
            icon: Icons.notifications,
            title: 'Уведомления',
            subtitle: 'Настройки уведомлений',
            onTap: () => _openNotificationsPage(context),
          ),
          const Divider(height: 1, color: Color(0xFFE0E0E0)),
          _buildMenuItem(
            icon: Icons.history,
            title: 'История заказов',
            subtitle: '0 заказов',
            onTap: () => _openOrderHistoryPage(context),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesMenuSection(BuildContext context, dynamic profile) {
    return AppCard(
      variant: AppCardVariant.outlined,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          _buildMenuItem(
            icon: Icons.payment,
            title: 'Платежи',
            subtitle: 'История транзакций',
            onTap: () => _openPaymentsPage(context),
          ),
          const Divider(height: 1, color: Color(0xFFE0E0E0)),
          _buildMenuItem(
            icon: Icons.calculate,
            title: 'Калькулятор стоимости',
            subtitle: 'Расчет доставки',
            onTap: () => _openCostCalculatorPage(context),
          ),
          const Divider(height: 1, color: Color(0xFFE0E0E0)),
          _buildMenuItem(
            icon: Icons.contact_phone,
            title: 'Поддержка',
            subtitle: profile.phone,
            onTap: () => _openContactPage(context),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: const Color(0xFF666666), size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFF333333),
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 14, color: Color(0xFF666666)),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Color(0xFFCCCCCC),
      ),
      onTap: onTap,
    );
  }

  void _editProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserEditProfilePage()),
    );
  }

  void _openPaymentCardsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserPaymentCardsPage()),
    );
  }

  void _openNotificationsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserNotificationsPage()),
    );
  }

  void _openOrderHistoryPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserOrderHistoryPage()),
    );
  }

  void _openPaymentsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserPaymentsPage()),
    );
  }

  void _openCostCalculatorPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserCostCalculatorPage()),
    );
  }

  void _openContactPage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Контактная информация'),
        backgroundColor: Color(0xFF007AFF),
      ),
    );
  }
}
