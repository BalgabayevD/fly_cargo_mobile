import 'dart:developer' show log;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/profile/presentation/pages/contacts_page.dart';
import 'package:fly_cargo/features/profile/presentation/pages/legal_entities_page.dart';
import 'package:fly_cargo/features/profile/presentation/pages/notifications_page.dart';
import 'package:fly_cargo/features/profile/presentation/pages/privacy_policy_page.dart';
import 'package:fly_cargo/features/profile/presentation/pages/profile_page.dart';
import 'package:fly_cargo/features/profile/presentation/pages/terms_of_service_page.dart';
import 'package:fly_cargo/features/profile/presentation/pages/transportation_rules_page.dart';
import 'package:fly_cargo/features/profile/presentation/widgets/language_selection_bottom_sheet.dart';
import 'package:fly_cargo/features/profile/presentation/widgets/settings_menu_items.dart';
import 'package:fly_cargo/features/profile/presentation/widgets/settings_sections.dart';
import 'package:fly_cargo/features/ui_kit/presentation/screen/ui_kit_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:package_info_plus/package_info_plus.dart';

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
                    context.push(ProfilePage.location());
                  },
                ),
                const BeSpace(size: .sm),
                LightListTile(
                  title: 'Платёжные карты',
                  endContent: HeroIcon(
                    HeroIcons.creditCard,
                    color: BeColors.surface4,
                  ),
                ),
                LightListTile(
                  title: 'История платежей',
                  endContent: HeroIcon(
                    HeroIcons.clock,
                    color: BeColors.surface4,
                  ),
                ),
                LanguageSection(
                  onTap: () {
                    LanguageSelectionBottomSheet.show(context);
                  },
                ),
                LightListTile(
                  title: context.l10n.notificationSettings,
                  onTap: () {
                    context.push(NotificationsPage.location());
                  },
                ),
                LightListTile(
                  title: context.l10n.privacyPolicyTitle,
                  onTap: () => context.push(PrivacyPolicyPage.location()),
                  endContent: HeroIcon(
                    HeroIcons.arrowTopRightOnSquare,
                    size: 20,
                    color: AppColors.surface4,
                  ),
                ),
                LightListTile(
                  title: context.l10n.termsOfServiceTitle,
                  onTap: () => context.push(TermsOfServicePage.location()),
                  endContent: HeroIcon(
                    HeroIcons.arrowTopRightOnSquare,
                    size: 20,
                    color: AppColors.surface4,
                  ),
                ),
                LightListTile(
                  title: context.l10n.contacts,
                  onTap: () => context.push(ContactsPage.location()),
                ),
                LightListTile(
                  title: context.l10n.forLegalEntities,
                  onTap: () => context.push(LegalEntitiesPage.location()),
                  endContent: HeroIcon(
                    HeroIcons.arrowTopRightOnSquare,
                    size: 20,
                    color: AppColors.surface4,
                  ),
                ),
                LightListTile(
                  title: context.l10n.transportationRules,
                  onTap: () => context.push(TransportationRulesPage.location()),
                  endContent: HeroIcon(
                    HeroIcons.arrowTopRightOnSquare,
                    size: 20,
                    color: AppColors.surface4,
                  ),
                ),

                if (kDebugMode)
                  LightListTile(
                    title: 'Ui-Kit',
                    onTap: () => context.push(UiKitScreen.location()),
                    endContent: HeroIcon(
                      HeroIcons.beaker,
                      size: 20,
                      color: BeColors.surface4,
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
}
