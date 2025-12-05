import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/router/app_router.dart';
import 'package:fly_cargo/features/user/presentation/widgets/menu_item_widget.dart';
import 'package:fly_cargo/features/user/presentation/widgets/stat_item_widget.dart';
import 'package:fly_cargo/shared/profile/presentation/bloc/profile_bloc.dart';
import 'package:fly_cargo/shared/profile/presentation/bloc/profile_event.dart';
import 'package:fly_cargo/shared/profile/presentation/bloc/profile_state.dart';
import 'package:go_router/go_router.dart';
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
          onPressed: () => context.pop(),
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
                  _buildProfileHeader(profile),
                  const SizedBox(height: 30),
                  _buildStatsSection(daysSinceCreated),
                  const SizedBox(height: 30),
                  _buildUserMenuSection(context, profile),
                  const SizedBox(height: 20),
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
    final fullName = profile.name?.trim() ?? '';
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
          child: (profile.image != null && profile.image!.isNotEmpty)
              ? ClipOval(
                  child: Image.network(
                    profile.image!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        _buildDefaultAvatar(),
                  ),
                )
              : _buildDefaultAvatar(),
        ),
        const SizedBox(height: 16),
        Text(
          fullName.isNotEmpty ? fullName : 'Пользователь',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          profile.phoneNumber,
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
              const Expanded(
                child: StatItemWidget(
                  label: 'Заказы',
                  value: '0',
                  icon: Icons.shopping_bag,
                  color: Color(0xFF007AFF),
                ),
              ),
              const Expanded(
                child: StatItemWidget(
                  label: 'Карты',
                  value: '0',
                  icon: Icons.credit_card,
                  color: Color(0xFF34C759),
                ),
              ),
              Expanded(
                child: StatItemWidget(
                  label: 'С нами',
                  value: '$daysSinceCreated ${_getDaysText(daysSinceCreated)}',
                  icon: Icons.calendar_today,
                  color: const Color(0xFFFF9500),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget _buildUserMenuSection(BuildContext context, dynamic profile) {
    return AppCard(
      variant: AppCardVariant.outlined,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          MenuItemWidget(
            icon: Icons.person,
            title: 'Мой профиль',
            subtitle: 'Личная информация',
            onTap: () => _editProfile(context),
          ),
          const Divider(height: 1, color: Color(0xFFE0E0E0)),
          MenuItemWidget(
            icon: Icons.credit_card,
            title: 'Платежные карты',
            subtitle: 'Добавить карту',
            onTap: () => _openPaymentCardsPage(context),
          ),
          const Divider(height: 1, color: Color(0xFFE0E0E0)),
          MenuItemWidget(
            icon: Icons.notifications,
            title: 'Уведомления',
            subtitle: 'Настройки уведомлений',
            onTap: () => _openNotificationsPage(context),
          ),
          const Divider(height: 1, color: Color(0xFFE0E0E0)),
          MenuItemWidget(
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
          MenuItemWidget(
            icon: Icons.payment,
            title: 'Платежи',
            subtitle: 'История транзакций',
            onTap: () => _openPaymentsPage(context),
          ),
          const Divider(height: 1, color: Color(0xFFE0E0E0)),
          MenuItemWidget(
            icon: Icons.calculate,
            title: 'Калькулятор стоимости',
            subtitle: 'Расчет доставки',
            onTap: () => _openCostCalculatorPage(context),
          ),
          const Divider(height: 1, color: Color(0xFFE0E0E0)),
          MenuItemWidget(
            icon: Icons.contact_phone,
            title: 'Поддержка',
            subtitle: profile.phoneNumber,
            onTap: () => _openContactPage(context),
          ),
        ],
      ),
    );
  }
  void _editProfile(BuildContext context) {
    context.push('${AppRoutes.userDemo}/${AppRoutes.userProfile}/${AppRoutes.userEditProfile}');
  }
  void _openPaymentCardsPage(BuildContext context) {
    context.push('${AppRoutes.userDemo}/${AppRoutes.userProfile}/${AppRoutes.userCards}');
  }
  void _openNotificationsPage(BuildContext context) {
    context.push('${AppRoutes.userDemo}/${AppRoutes.userProfile}/${AppRoutes.userNotifications}');
  }
  void _openOrderHistoryPage(BuildContext context) {
    context.push('${AppRoutes.userDemo}/${AppRoutes.userProfile}/${AppRoutes.userHistory}');
  }
  void _openPaymentsPage(BuildContext context) {
    context.push('${AppRoutes.userDemo}/${AppRoutes.userProfile}/${AppRoutes.userPayments}');
  }
  void _openCostCalculatorPage(BuildContext context) {
    context.push('${AppRoutes.userDemo}/${AppRoutes.userProfile}/${AppRoutes.userCalculator}');
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
