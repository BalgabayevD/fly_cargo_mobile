import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/core/l10n/locale_cubit.dart';
import 'package:fly_cargo/features/profile/presentation/widgets/settings_menu_items.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/auth_state.dart';

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

  String _getLanguageName(BuildContext context, Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return context.l10n.english;
      case 'kk':
        return context.l10n.kazakh;
      case 'ru':
      default:
        return context.l10n.russian;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale>(
      builder: (context, locale) {
        return SettingsMenuItem(
          title: context.l10n.appLanguage,
          rightText: _getLanguageName(context, locale),
          onTap: onTap,
        );
      },
    );
  }
}

class NotificationsSection extends StatelessWidget {
  final VoidCallback onTap;

  const NotificationsSection({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsMenuItem(
      title: context.l10n.notificationSettings,
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
          title: context.l10n.privacyPolicyTitle,
          onTap: onPrivacyTap,
          showExternalLink: true,
        ),
        SettingsMenuItem(
          title: context.l10n.termsOfServiceTitle,
          onTap: onTermsTap,
          showExternalLink: true,
        ),
        SettingsMenuItem(
          title: context.l10n.forLegalEntities,
          onTap: onLegalTap,
          showExternalLink: true,
        ),
        SettingsMenuItem(
          title: context.l10n.transportationRules,
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
      title: context.l10n.contacts,
      onTap: onTap,
    );
  }
}
