import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsPage extends StatelessWidget {
  static const String path = 'contacts';

  const ContactsPage({super.key});

  static GoRoute route({GlobalKey<NavigatorState>? parentNavigatorKey}) {
    return GoRoute(
      path: path,
      parentNavigatorKey: parentNavigatorKey,
      builder: (context, state) => const ContactsPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BePage(
      isBorder: true,
      title: context.l10n.contacts,
      automaticallyImplyLeading: true,
      centerTitle: false,
      child: ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: AppSpacing.xxxl),
              _ContactItemWidget(
                icon: HeroIcons.phone,
                label: context.l10n.contactPhone,
                value: '+7 727 123-456',
              ),
              const SizedBox(height: AppSpacing.xxxl),
              _ContactItemWidget(
                icon: HeroIcons.devicePhoneMobile,
                label: context.l10n.mobilePhone,
                value: '+7 (777) 231-24-12',
              ),
              const SizedBox(height: AppSpacing.xxxl),
              _ContactItemWidget(
                icon: HeroIcons.envelope,
                label: context.l10n.email,
                value: 'sapsano@gmail.com',
              ),
              const SizedBox(height: AppSpacing.xxxl),
              _ContactItemWidget(
                icon: HeroIcons.chatBubbleLeftRight,
                label: context.l10n.whatsapp,
                value: '+7 (777) 231-24-12',
              ),
              const SizedBox(height: AppSpacing.xxxl),
              _ContactItemWidget(
                icon: HeroIcons.mapPin,
                label: context.l10n.legalAddress,
                value: 'г. Алматы, ул. Аспандиярова, д 4',
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () => _makeCall('+7727123456'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.warningLight,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusMD,
                        ),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HeroIcon(
                          HeroIcons.phone,
                          size: 20,
                          color: AppColors.warning,
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Text(
                          context.l10n.call,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.warning,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () => _openWhatsApp('+77772312412'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.successLight,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusMD,
                        ),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HeroIcon(
                          HeroIcons.chatBubbleLeftRight,
                          size: 20,
                          color: AppColors.success,
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Text(
                          context.l10n.writeWhatsapp,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.success,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _makeCall(String phone) async {
    final uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _openWhatsApp(String phone) async {
    final cleanPhone = phone.replaceAll(RegExp(r'[^\d]'), '');
    final uri = Uri.parse('https://wa.me/$cleanPhone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

class _ContactItemWidget extends StatelessWidget {
  final HeroIcons icon;
  final String label;
  final String value;

  const _ContactItemWidget({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.surface4,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.surface5,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
