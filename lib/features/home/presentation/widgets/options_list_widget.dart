import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/home/presentation/recipient_page.dart';

class OptionsListWidget extends StatelessWidget {
  const OptionsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      variant: AppCardVariant.outlined,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          AppIconCard(
            icon: Icons.photo_camera,
            title: 'Фото упаковки',
            subtitle: '1 из 5',
            onTap: () => _showPhotoDialog(context, 'упаковки'),
          ),
          Divider(
            height: AppSpacing.dividerHeight,
            color: AppColors.borderLight,
          ),
          AppIconCard(
            icon: Icons.inventory_2,
            title: 'Фото содержания',
            subtitle: 'С текстом по желанию',
            onTap: () => _showPhotoDialog(context, 'содержания'),
          ),
          Divider(
            height: AppSpacing.dividerHeight,
            color: AppColors.borderLight,
          ),
          AppIconCard(
            icon: Icons.person,
            title: 'Указать получателя',
            subtitle: 'Добавить контактные данные',
            onTap: () => _showRecipientDialog(context),
          ),
          Divider(
            height: AppSpacing.dividerHeight,
            color: AppColors.borderLight,
          ),
          AppIconCard(
            icon: Icons.description,
            title: 'Описание груза',
            subtitle: 'Подробное описание посылки',
            onTap: () => _showCargoDescriptionDialog(context),
          ),
          Divider(
            height: AppSpacing.dividerHeight,
            color: AppColors.borderLight,
          ),
          AppIconCard(
            icon: Icons.security,
            title: 'Страхование',
            subtitle: 'Защита вашей посылки',
            onTap: () => _showInsuranceDialog(context),
          ),
        ],
      ),
    );
  }

  void _showPhotoDialog(BuildContext context, String type) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Фото $type'),
        content: const Text(
          'Функция добавления фотографий будет реализована в следующих версиях приложения.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Понятно'),
          ),
        ],
      ),
    );
  }

  void _showRecipientDialog(BuildContext context) async {
    final result = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(
        builder: (context) => const RecipientPage(),
      ),
    );

    if (result != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Данные получателя сохранены: ${result['name']}'),
          backgroundColor: AppColors.success,
        ),
      );
    }
  }

  void _showCargoDescriptionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Описание груза'),
        content: const Text(
          'Функция описания груза будет реализована в следующих версиях приложения.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Понятно'),
          ),
        ],
      ),
    );
  }

  void _showInsuranceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Страхование'),
        content: const Text(
          'Функция страхования будет реализована в следующих версиях приложения.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Понятно'),
          ),
        ],
      ),
    );
  }
}
