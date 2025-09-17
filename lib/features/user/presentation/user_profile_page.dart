import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/user/models/user_profile_model.dart';
import 'package:fly_cargo/features/user/presentation/user_cost_calculator_page.dart';
import 'package:fly_cargo/features/user/presentation/user_edit_profile_page.dart';
import 'package:fly_cargo/features/user/presentation/user_notifications_page.dart';
import 'package:fly_cargo/features/user/presentation/user_order_history_page.dart';
import 'package:fly_cargo/features/user/presentation/user_payment_cards_page.dart';
import 'package:fly_cargo/features/user/presentation/user_payments_page.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late UserProfile _profile;

  @override
  void initState() {
    super.initState();
    _profile = _getMockProfile();
  }

  UserProfile _getMockProfile() {
    return UserProfile(
      id: 'user_1',
      name: 'Дамир',
      phone: '+7 777 380 6602',
      email: 'damir@example.com',
      joinDate: DateTime(2024, 1, 15),
      status: 'active',
      paymentCards: [
        PaymentCard(
          id: 'card_1',
          type: 'Visa',
          lastFourDigits: '2395',
          holderName: 'Дамир Токмашов',
          isPrimary: true,
          expiryDate: DateTime(2025, 12, 31),
        ),
      ],
      orderHistory: [
        Order(
          id: 'order_1',
          fromAddress: 'Алматы, ул. Абая 1',
          toAddress: 'Астана, ул. Республики 10',
          createdAt: DateTime.now().subtract(const Duration(days: 2)),
          status: OrderStatus.completed,
          cost: 2500.0,
          description: 'Документы',
        ),
        Order(
          id: 'order_2',
          fromAddress: 'Алматы, ул. Достык 15',
          toAddress: 'Алматы, ул. Сатпаева 25',
          createdAt: DateTime.now().subtract(const Duration(days: 5)),
          status: OrderStatus.completed,
          cost: 1200.0,
          description: 'Пакет',
        ),
      ],
      notificationSettings: const NotificationSettings(
        orderUpdates: true,
        promotions: true,
        paymentNotifications: true,
        systemNotifications: false,
      ),
    );
  }

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
            onPressed: () => _editProfile(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Аватар и основная информация
            _buildProfileHeader(),
            const SizedBox(height: 30),

            // Статистика пользователя
            _buildStatsSection(),
            const SizedBox(height: 30),

            // Первый блок меню (пользовательские настройки)
            _buildUserMenuSection(),
            const SizedBox(height: 20),

            // Второй блок меню (сервисы)
            _buildServicesMenuSection(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
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
          child: _profile.avatarUrl != null
              ? ClipOval(
                  child: Image.network(
                    _profile.avatarUrl!,
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
          _profile.name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 4),

        // Телефон
        Text(
          _profile.phone,
          style: const TextStyle(fontSize: 16, color: Color(0xFF666666)),
        ),
        const SizedBox(height: 8),

        // Статус
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: _profile.statusColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            _profile.statusText,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: _profile.statusColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDefaultAvatar() {
    return const Icon(Icons.person, size: 50, color: Color(0xFF999999));
  }

  Widget _buildStatsSection() {
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
                  '${_profile.orderHistory.length}',
                  Icons.shopping_bag,
                  const Color(0xFF007AFF),
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  'Карты',
                  '${_profile.paymentCards.length}',
                  Icons.credit_card,
                  const Color(0xFF34C759),
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  'С нами',
                  '${DateTime.now().difference(_profile.joinDate).inDays} дн',
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
            color: color.withOpacity(0.1),
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

  Widget _buildUserMenuSection() {
    return AppCard(
      variant: AppCardVariant.outlined,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          _buildMenuItem(
            icon: Icons.person,
            title: 'Мой профиль',
            subtitle: 'Личная информация',
            onTap: () => _editProfile(),
          ),
          const Divider(height: 1, color: Color(0xFFE0E0E0)),
          _buildMenuItem(
            icon: Icons.credit_card,
            title: 'Платежные карты',
            subtitle: _profile.primaryCard?.displayName ?? 'Добавить карту',
            onTap: () => _openPaymentCardsPage(),
          ),
          const Divider(height: 1, color: Color(0xFFE0E0E0)),
          _buildMenuItem(
            icon: Icons.notifications,
            title: 'Уведомления',
            subtitle: 'Настройки уведомлений',
            onTap: () => _openNotificationsPage(),
          ),
          const Divider(height: 1, color: Color(0xFFE0E0E0)),
          _buildMenuItem(
            icon: Icons.history,
            title: 'История заказов',
            subtitle: '${_profile.orderHistory.length} заказов',
            onTap: () => _openOrderHistoryPage(),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesMenuSection() {
    return AppCard(
      variant: AppCardVariant.outlined,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          _buildMenuItem(
            icon: Icons.payment,
            title: 'Платежи',
            subtitle: 'История транзакций',
            onTap: () => _openPaymentsPage(),
          ),
          const Divider(height: 1, color: Color(0xFFE0E0E0)),
          _buildMenuItem(
            icon: Icons.calculate,
            title: 'Калькулятор стоимости',
            subtitle: 'Расчет доставки',
            onTap: () => _openCostCalculatorPage(),
          ),
          const Divider(height: 1, color: Color(0xFFE0E0E0)),
          _buildMenuItem(
            icon: Icons.contact_phone,
            title: 'Поддержка',
            subtitle: _profile.phone,
            onTap: () => _openContactPage(),
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

  void _editProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserEditProfilePage()),
    );
  }

  void _openPaymentCardsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserPaymentCardsPage()),
    );
  }

  void _openNotificationsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserNotificationsPage()),
    );
  }

  void _openOrderHistoryPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserOrderHistoryPage()),
    );
  }

  void _openPaymentsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserPaymentsPage()),
    );
  }

  void _openCostCalculatorPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserCostCalculatorPage()),
    );
  }

  void _openContactPage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Контактная информация'),
        backgroundColor: Color(0xFF007AFF),
      ),
    );
  }
}
