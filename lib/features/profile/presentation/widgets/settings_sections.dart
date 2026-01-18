import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/core/l10n/locale_cubit.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/authorization_bloc.dart';
import 'package:fly_cargo/features/profile/presentation/widgets/settings_menu_items.dart';

class AuthSection extends StatelessWidget {
  final VoidCallback onProfileTap;

  const AuthSection({
    required this.onProfileTap,
    super.key,
  });

  String _getDisplayName(
    BuildContext context,
    String? firstName,
    String? lastName,
    String? name,
  ) {
    // if (firstName != null && firstName.isNotEmpty) {
    //   if (lastName != null && lastName.isNotEmpty) {
    //     return '$firstName $lastName';
    //   }
    //   return firstName;
    // }
    if (name != null && name.isNotEmpty) {
      return name;
    }
    return context.l10n.user;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthorizationBloc, AuthorizationState>(
      builder: (context, state) {
        if (state is AuthorizedState) {
          final user = state.sessionInfo.user;
          final displayName = _getDisplayName(
            context,
            user.firstName,
            user.lastName,
            user.name,
          );
          final userPhone = user.phoneNumber ?? '';

          return SettingsUserMenuItem(
            displayName: displayName,
            userPhone: userPhone,
            isAuthenticated: true,
            onTap: onProfileTap,
          );
        }

        return SettingsUserMenuItem(
          displayName: '',
          userPhone: '',
          isAuthenticated: false,
          onTap: onProfileTap,
        );
      },
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
        return LightListTile(
          title: context.l10n.appLanguage,
          description: _getLanguageName(context, locale),
          onTap: onTap,
        );
      },
    );
  }
}
