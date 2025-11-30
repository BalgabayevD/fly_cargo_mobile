import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

/// Секция демонстрации карточек
class CardsSection extends StatelessWidget {
  final bool isSelected;
  final ValueChanged<bool> onSelectionChanged;

  const CardsSection({
    required this.isSelected,
    required this.onSelectionChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Elevated Card', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: AppSpacing.sm),
        const AppCard(
          variant: AppCardVariant.elevated,
          child: Text('Это elevated карточка с тенью'),
        ),
        const SizedBox(height: AppSpacing.md),
        const Text('Outlined Card', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: AppSpacing.sm),
        const AppCard(
          variant: AppCardVariant.outlined,
          child: Text('Это outlined карточка с рамкой'),
        ),
        const SizedBox(height: AppSpacing.md),
        const Text('Filled Card', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: AppSpacing.sm),
        const AppCard(
          variant: AppCardVariant.filled,
          child: Text('Это filled карточка с заливкой'),
        ),
        const SizedBox(height: AppSpacing.md),
        const Text('Card with Title', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: AppSpacing.sm),
        AppCardWithTitle(
          title: 'Заголовок карточки',
          titleAction: IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
          child: const Text('Содержимое карточки с заголовком'),
        ),
        const SizedBox(height: AppSpacing.md),
        const Text('Icon Card', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: AppSpacing.sm),
        AppIconCard(
          icon: Icons.location_on,
          title: 'Адрес доставки',
          subtitle: 'ул. Пушкина, д. 10',
          onTap: () {},
        ),
        const SizedBox(height: AppSpacing.md),
        const Text('Selection Card', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: AppSpacing.sm),
        AppSelectionCard(
          isSelected: isSelected,
          onTap: () => onSelectionChanged(!isSelected),
          child: const Padding(
            padding: EdgeInsets.all(AppSpacing.paddingLG),
            child: Text('Нажмите, чтобы выбрать'),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        const Text('Price Card', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: AppSpacing.sm),
        AppPriceCard(
          title: 'Стандартная доставка',
          price: '500 ₽',
          subtitle: '2-3 дня',
          onTap: () {},
        ),
      ],
    );
  }
}

