import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/router/app_router.dart';
import 'package:fly_cargo/features/courier/models/courier_profile_model.dart';
import 'package:go_router/go_router.dart';

class CourierProfilePage extends StatefulWidget {
  const CourierProfilePage({super.key});
  @override
  State<CourierProfilePage> createState() => _CourierProfilePageState();
}

class _CourierProfilePageState extends State<CourierProfilePage> {
  late CourierProfile _profile;
  @override
  void initState() {
    super.initState();
    _profile = CourierProfile(
      id: '',
      name: '',
      phone: '',
      email: '',
      joinDate: DateTime.now(),
      rating: 0.0,
      totalDeliveries: 0,
      completedDeliveries: 0,
      totalEarnings: 0.0,
      status: 'inactive',
      vehicleType: '',
      licenseNumber: '',
      workingAreas: [],
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
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Профиль курьера',
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
            _buildProfileHeader(),
            const SizedBox(height: 30),
            _buildStatsSection(),
            const SizedBox(height: 30),
            _buildProfileMenu(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
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
                  child: Image.network(_profile.avatarUrl!, fit: BoxFit.cover),
                )
              : const Icon(Icons.person, size: 50, color: Color(0xFF999999)),
        ),
        const SizedBox(height: 16),
        Text(
          _profile.name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          _profile.phone,
          style: const TextStyle(fontSize: 16, color: Color(0xFF666666)),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: _profile.statusColor.withValues(alpha: 0.1),
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
                  'Рейтинг',
                  '${_profile.rating}',
                  Icons.star,
                  const Color(0xFFFF9500),
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  'Доставки',
                  '${_profile.completedDeliveries}/${_profile.totalDeliveries}',
                  Icons.local_shipping,
                  const Color(0xFF007AFF),
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  'Заработок',
                  '${_profile.totalEarnings.toInt()} ₸',
                  Icons.account_balance_wallet,
                  const Color(0xFF34C759),
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

  Widget _buildProfileMenu() {
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
            icon: Icons.account_balance_wallet,
            title: 'Мой доход',
            subtitle: 'Visa -2395',
            onTap: () => _openIncomePage(),
          ),
          const Divider(height: 1, color: Color(0xFFE0E0E0)),
          _buildMenuItem(
            icon: Icons.notifications,
            title: 'Уведомления',
            subtitle: _profile.phone,
            onTap: () => _openNotificationsPage(),
          ),
          const Divider(height: 1, color: Color(0xFFE0E0E0)),
          _buildMenuItem(
            icon: Icons.history,
            title: 'Мои доставки',
            subtitle: _profile.phone,
            onTap: () => _openDeliveriesPage(),
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
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Редактирование профиля будет реализовано'),
        backgroundColor: Color(0xFF007AFF),
      ),
    );
  }

  void _openIncomePage() {
    context.push(
      '${AppRoutes.courierHome}/${AppRoutes.courierProfile}/${AppRoutes.courierIncome}',
    );
  }

  void _openNotificationsPage() {
    context.push(
      '${AppRoutes.courierHome}/${AppRoutes.courierProfile}/${AppRoutes.courierNotifications}',
    );
  }

  void _openDeliveriesPage() {
    context.push(
      '${AppRoutes.courierHome}/${AppRoutes.courierProfile}/${AppRoutes.courierDeliveries}',
    );
  }
}
