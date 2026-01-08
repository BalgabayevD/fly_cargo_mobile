import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.surface5),
          onPressed: () => context.pop(),
        ),
        title: Text(
          context.l10n.contacts,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.surface5,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ContactItem(
              label: context.l10n.contactPhone,
              value: '+7 727 123-456',
            ),
            const SizedBox(height: AppSpacing.lg),
            _ContactItem(
              label: context.l10n.mobilePhone,
              value: '+7 (777) 231-24-12',
            ),
            const SizedBox(height: AppSpacing.lg),
            _ContactItem(
              label: context.l10n.email,
              value: 'sapsano@gmail.com',
            ),
            const SizedBox(height: AppSpacing.lg),
            _ContactItem(
              label: context.l10n.whatsapp,
              value: '+7 (777) 231-24-12',
            ),
            const SizedBox(height: AppSpacing.lg),
            _ContactItem(
              label: context.l10n.legalAddress,
              value: 'г. Алматы, ул. Аспандиярова, д 4',
            ),
            const SizedBox(height: AppSpacing.xxl),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => _makeCall('+7727123456'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  context.l10n.call,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
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
                  backgroundColor: Color(0xFF25D366),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  context.l10n.writeWhatsapp,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
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

class _ContactItem extends StatelessWidget {
  final String label;
  final String value;

  const _ContactItem({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
