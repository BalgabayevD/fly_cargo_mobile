import 'dart:developer' show log;

import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/profile/presentation/widgets/language_selection_bottom_sheet.dart';
import 'package:fly_cargo/features/profile/presentation/widgets/settings_menu_items.dart';
import 'package:fly_cargo/features/profile/presentation/widgets/settings_sections.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
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
    return BePage(
      title: context.l10n.settings,
      automaticallyImplyLeading: false,
      centerTitle: true,
      isBorder: true,
      padding: EdgeInsets.zero,
      appBarColor: BeColors.white,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                AuthSection(
                  onProfileTap: () {
                    context.push('/profile');
                  },
                ),
                const SizedBox(height: AppSpacing.sm),
                LanguageSection(
                  onTap: () {
                    LanguageSelectionBottomSheet.show(context);
                  },
                ),
                LightListTile(
                  title: context.l10n.notificationSettings,
                  onTap: () {
                    context.push('/notifications');
                  },
                ),
                LightListTile(
                  title: context.l10n.privacyPolicyTitle,
                  onTap: () => _openUrl('https://example.com/privacy'),
                  endContent: HeroIcon(
                    HeroIcons.arrowTopRightOnSquare,
                    size: 20,
                    color: AppColors.surface4,
                  ),
                ),

                LightListTile(
                  title: context.l10n.termsOfServiceTitle,
                  onTap: () => _openUrl('https://example.com/terms'),
                  endContent: HeroIcon(
                    HeroIcons.arrowTopRightOnSquare,
                    size: 20,
                    color: AppColors.surface4,
                  ),
                ),
                LightListTile(
                  title: context.l10n.contacts,
                  onTap: () {
                    context.push('/contacts');
                  },
                ),
                LightListTile(
                  title: context.l10n.forLegalEntities,
                  onTap: () => _openUrl('https://example.com/legal'),
                  endContent: HeroIcon(
                    HeroIcons.arrowTopRightOnSquare,
                    size: 20,
                    color: AppColors.surface4,
                  ),
                ),
                LightListTile(
                  title: context.l10n.transportationRules,
                  onTap: () => _openUrl('https://example.com/rules'),
                  endContent: HeroIcon(
                    HeroIcons.arrowTopRightOnSquare,
                    size: 20,
                    color: AppColors.surface4,
                  ),
                ),
              ],
            ),
          ),
          SettingsFooter(appVersion: _appVersion),
        ],
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
