import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/order_card.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/order_section_header.dart';

class OrderCategorySection extends StatelessWidget {
  final String category;
  final ValueChanged<String> onCategoryChanged;

  const OrderCategorySection({
    super.key,
    required this.category,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const OrderSectionHeader(
          icon: Icons.category_outlined,
          title: 'Категория груза',
          subtitle: 'Выберите тип отправляемого груза',
        ),
        const SizedBox(height: 16),
        OrderCard(
          child: DropdownButtonFormField<String>(
            value: category,
            decoration: InputDecoration(
              labelText: 'Выберите категорию',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.borderLight),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.borderLight),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.primary, width: 2),
              ),
              filled: true,
              fillColor: AppColors.surfaceVariant,
            ),
            items: const [
              DropdownMenuItem(value: 'Обычный', child: Text('Обычный')),
              DropdownMenuItem(value: 'Документы', child: Text('Документы')),
              DropdownMenuItem(
                value: 'Электроника',
                child: Text('Электроника'),
              ),
              DropdownMenuItem(value: 'Одежда', child: Text('Одежда')),
              DropdownMenuItem(value: 'Продукты', child: Text('Продукты')),
            ],
            onChanged: (value) => onCategoryChanged(value ?? 'Обычный'),
          ),
        ),
      ],
    );
  }
}
