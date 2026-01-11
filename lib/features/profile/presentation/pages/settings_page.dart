import 'dart:developer' show log;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/core/router/app_router.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/auth_state.dart';
import 'package:fly_cargo/features/auth/presentation/router/auth_router.dart';
import 'package:fly_cargo/features/profile/presentation/widgets/language_selection_bottom_sheet.dart';
import 'package:fly_cargo/features/profile/presentation/widgets/settings_menu_items.dart';
import 'package:fly_cargo/features/profile/presentation/widgets/settings_sections.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  static const String path = '/settings';

  const SettingsPage({super.key});

  static GoRoute route({
    List<RouteBase>? routes,
    GlobalKey<NavigatorState>? parentNavigatorKey,
  }) {
    return GoRoute(
      path: path,
      builder: (context, state) => const SettingsPage(),
      routes: routes ?? const <RouteBase>[],
    );
  }

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _appVersion = '1.0.1';

  @override
  void initState() {
    super.initState();
    _loadAppVersion();
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
        title: Text(
          context.l10n.settings,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.surface5,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, authState) {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Divider(height: 1, color: AppColors.border),
                    AuthSection(
                      authState: authState,
                      onProfileTap: () {
                        context.go(
                          '${AppRoutes.settings}/${AppRoutes.profile}',
                        );
                      },
                      onAuthTap: () {
                        AuthRouter.navigateToPhoneInput(context);
                      },
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    LanguageSection(
                      onTap: () {
                        LanguageSelectionBottomSheet.show(context);
                      },
                    ),
                    NotificationsSection(
                      onTap: () {
                        context.go(
                          '${AppRoutes.settings}/${AppRoutes.notifications}',
                        );
                      },
                    ),
                    ContactsSection(
                      onTap: () {
                        context.go(
                          '${AppRoutes.settings}/${AppRoutes.contacts}',
                        );
                      },
                    ),
                    LegalSections(
                      onPrivacyTap: () =>
                          _openUrl('https://example.com/privacy'),
                      onTermsTap: () => _openUrl('https://example.com/terms'),
                      onLegalTap: () => _openUrl('https://example.com/legal'),
                      onRulesTap: () => _openUrl('https://example.com/rules'),
                    ),
                  ],
                ),
              ),
              SettingsFooter(appVersion: _appVersion),
            ],
          );
        },
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
