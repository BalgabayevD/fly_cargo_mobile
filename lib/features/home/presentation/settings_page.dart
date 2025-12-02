import 'dart:developer' show log;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/home/presentation/pages/contacts_page.dart';
import 'package:fly_cargo/features/home/presentation/pages/profile_page.dart';
import 'package:fly_cargo/features/home/presentation/widgets/settings/settings_menu_items.dart';
import 'package:fly_cargo/features/home/presentation/widgets/settings/settings_sections.dart';
import 'package:fly_cargo/features/user/presentation/user_notifications_page.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_bloc.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_state.dart';
import 'package:fly_cargo/shared/auth/presentation/router/auth_router.dart';
import 'package:fly_cargo/shared/profile/presentation/bloc/profile_bloc.dart';
import 'package:fly_cargo/shared/profile/presentation/bloc/profile_event.dart';
import 'package:fly_cargo/shared/profile/presentation/bloc/profile_state.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _appVersion = '1.0.1';

  @override
  void initState() {
    super.initState();
    _loadAppVersion();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authState = context.read<AuthBloc>().state;
      if (authState is AuthAuthenticated) {
        context.read<ProfileBloc>().add(const ProfileEvent.loadProfile());
      }
    });
  }

  Future<void> _loadAppVersion() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      setState(() {
        _appVersion = packageInfo.version;
      });
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Настройки',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, authState) {
          if (authState is AuthAuthenticated) {
            context.read<ProfileBloc>().add(const ProfileEvent.loadProfile());
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, authState) {
            return BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, profileState) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          AuthSection(
                            authState: authState,
                            profileState: profileState,
                            onProfileTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ProfilePage(),
                                ),
                              );
                            },
                            onAuthTap: () {
                              AuthRouter.navigateToPhoneInput(context);
                            },
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          LanguageSection(
                            onTap: () {},
                          ),
                          NotificationsSection(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const UserNotificationsPage(),
                                ),
                              );
                            },
                          ),
                          ContactsSection(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ContactsPage(),
                                ),
                              );
                            },
                          ),
                          LegalSections(
                            onPrivacyTap: () =>
                                _openUrl('https://example.com/privacy'),
                            onTermsTap: () =>
                                _openUrl('https://example.com/terms'),
                            onLegalTap: () =>
                                _openUrl('https://example.com/legal'),
                            onRulesTap: () =>
                                _openUrl('https://example.com/rules'),
                          ),
                        ],
                      ),
                    ),
                    SettingsFooter(appVersion: _appVersion),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
