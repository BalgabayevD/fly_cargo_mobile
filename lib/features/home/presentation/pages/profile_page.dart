import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_bloc.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_event.dart';
import 'package:fly_cargo/shared/profile/presentation/bloc/profile_bloc.dart';
import 'package:fly_cargo/shared/profile/presentation/bloc/profile_state.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.textPrimary),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Профиль',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
            loaded: (profile, _) => Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      _ProfileField(
                        label: 'Номер телефона',
                        value: profile.phoneNumber,
                      ),
                      const Divider(height: 1),
                      _ProfileField(
                        label: 'Имя',
                        value: profile.name,
                      ),
                      const Divider(height: 1),
                      _ProfileField(
                        label: 'Email',
                        value: profile.email,
                      ),
                      const Divider(height: 1),
                      _ProfileField(
                        label: 'Роль',
                        value: profile.role == 'client'
                            ? 'Клиент'
                            : profile.role == 'courier'
                            ? 'Курьер'
                            : profile.role,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () => _logout(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppSpacing.radiusMD,
                              ),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Выйти из профиля',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Функция удаления профиля в разработке',
                              ),
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: AppSpacing.sm,
                          ),
                          child: Text(
                            'Заявка на удаление профиля',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primary,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            error: (message) => Center(
              child: Text(
                message,
                style: const TextStyle(color: AppColors.error),
              ),
            ),
          );
        },
      ),
    );
  }

  void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Выход'),
        content: const Text('Вы уверены, что хотите выйти?'),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () {
              context.read<AuthBloc>().add(const AuthLogout());
              context.pop();
              context.pop();
            },
            child: const Text(
              'Выйти',
              style: TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileField extends StatelessWidget {
  final String label;
  final String value;

  const _ProfileField({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            value.isNotEmpty ? value : 'Не указано',
            style: TextStyle(
              fontSize: 16,
              color: value.isNotEmpty
                  ? AppColors.textPrimary
                  : AppColors.textTertiary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
