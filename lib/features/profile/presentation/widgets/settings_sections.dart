import 'package:flutter/material.dart';
import 'package:fly_cargo/features/profile/presentation/widgets/settings_menu_items.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_state.dart';

class AuthSection extends StatelessWidget {
  final AuthState authState;
  final VoidCallback onProfileTap;
  final VoidCallback onAuthTap;

  const AuthSection({
    required this.authState,
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
      final authenticatedState = authState as AuthAuthenticated;
      final profile = authenticatedState.profile;

      if (profile != null) {
        final name = profile.name.trim();
        if (name.isNotEmpty) {
          displayName = name;
        } else if (profile.phoneNumber.isNotEmpty) {
          displayName = profile.phoneNumber;
        }
        userPhone = profile.phoneNumber.isNotEmpty ? profile.phoneNumber : null;
      }
    }

    return SettingsUserMenuItem(
      displayName: displayName,
      userPhone: userPhone,
      isAuthenticated: isAuthenticated,
      onTap: isAuthenticated ? onProfileTap : onAuthTap,
    );
  }
}

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
