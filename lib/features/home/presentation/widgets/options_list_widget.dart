import 'package:flutter/material.dart';

class OptionsListWidget extends StatelessWidget {
  const OptionsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE9ECEF)),
      ),
      child: Column(
        children: [
          OptionTileWidget(
            icon: Icons.photo_camera,
            title: 'Фото упаковки',
            subtitle: '1 из 5',
            onTap: () => _showPhotoDialog(context, 'упаковки'),
          ),
          const Divider(height: 1, color: Color(0xFFE9ECEF)),
          OptionTileWidget(
            icon: Icons.inventory_2,
            title: 'Фото содержания',
            subtitle: 'С текстом по желанию',
            onTap: () => _showPhotoDialog(context, 'содержания'),
          ),
          const Divider(height: 1, color: Color(0xFFE9ECEF)),
          OptionTileWidget(
            icon: Icons.person,
            title: 'Указать получателя',
            subtitle: 'Добавить контактные данные',
            onTap: () => _showRecipientDialog(context),
          ),
          const Divider(height: 1, color: Color(0xFFE9ECEF)),
          OptionTileWidget(
            icon: Icons.description,
            title: 'Описание груза',
            subtitle: 'Подробное описание посылки',
            onTap: () => _showCargoDescriptionDialog(context),
          ),
          const Divider(height: 1, color: Color(0xFFE9ECEF)),
          OptionTileWidget(
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

  void _showRecipientDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Получатель'),
        content: const Text(
          'Функция указания получателя будет реализована в следующих версиях приложения.',
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

class OptionTileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const OptionTileWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFF007AFF).withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: const Color(0xFF007AFF), size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF333333),
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 14, color: Color(0xFF666666)),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Color(0xFF999999),
      ),
      onTap: onTap,
    );
  }
}
