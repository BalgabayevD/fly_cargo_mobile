import 'package:flutter/material.dart';
import 'package:fly_cargo/features/home/presentation/widgets/settings/settings_menu_items.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_state.dart';
import 'package:fly_cargo/shared/profile/presentation/bloc/profile_state.dart';

/// Секция авторизации
class AuthSection extends StatelessWidget {
  final AuthState authState;
  final ProfileState profileState;
  final VoidCallback onProfileTap;
  final VoidCallback onAuthTap;

  const AuthSection({
    required this.authState,
    required this.profileState,
    required this.onProfileTap,
    required this.onAuthTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isAuthenticated = authState is AuthAuthenticated;
    String? displayName;
    String? userPhone;

    if (isAuthenticated) {
      profileState.when(
        initial: () {},
        loading: () {},
        loaded: (profile, _) {
          final fullName = '${profile.firstName} ${profile.lastName}'.trim();
          // Если есть имя - используем его, иначе телефон
          if (fullName.isNotEmpty) {
            displayName = fullName;
          } else if (profile.phone.isNotEmpty) {
            displayName = profile.phone;
          }
          userPhone = profile.phone.isNotEmpty ? profile.phone : null;
        },
        error: (_) {},
      );
    }

    return SettingsUserMenuItem(
      displayName: displayName,
      userPhone: userPhone,
      isAuthenticated: isAuthenticated,
      onTap: isAuthenticated ? onProfileTap : onAuthTap,
    );
  }
}

/// Секция языка
class LanguageSection extends StatelessWidget {
  final VoidCallback onTap;

  const LanguageSection({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsMenuItem(
      title: 'Язык приложения',
      rightText: 'Русский',
      onTap: onTap,
    );
  }
}

/// Секция уведомлений
class NotificationsSection extends StatelessWidget {
  final VoidCallback onTap;

  const NotificationsSection({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsMenuItem(
      title: 'Настройка уведомлений',
      onTap: onTap,
    );
  }
}

/// Секция юридических документов
class LegalSections extends StatelessWidget {
  final VoidCallback onPrivacyTap;
  final VoidCallback onTermsTap;
  final VoidCallback onLegalTap;
  final VoidCallback onRulesTap;

  const LegalSections({
    required this.onPrivacyTap,
    required this.onTermsTap,
    required this.onLegalTap,
    required this.onRulesTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsMenuItem(
          title: 'Политика пользования',
          onTap: onPrivacyTap,
          showExternalLink: true,
        ),
        SettingsMenuItem(
          title: 'Условия оферты',
          onTap: onTermsTap,
          showExternalLink: true,
        ),
        SettingsMenuItem(
          title: 'Для юридических лиц',
          onTap: onLegalTap,
          showExternalLink: true,
        ),
        SettingsMenuItem(
          title: 'Правила перевозки',
          onTap: onRulesTap,
          showExternalLink: true,
        ),
      ],
    );
  }
}

/// Секция контактов
class ContactsSection extends StatelessWidget {
  final VoidCallback onTap;

  const ContactsSection({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsMenuItem(
      title: 'Контакты',
      onTap: onTap,
    );
  }
}
