import 'package:flutter/material.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/order_section_header.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/order_text_area.dart';
class OrderDescriptionSection extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onDataChanged;
  const OrderDescriptionSection({
    required this.controller, required this.onDataChanged, super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const OrderSectionHeader(
          icon: Icons.description_outlined,
          title: 'Описание груза',
          subtitle: 'Подробное описание содержимого посылки',
        ),
        const SizedBox(height: 16),
        OrderTextArea(
          controller: controller,
          label: 'Подробное описание содержимого',
          hintText:
              'Опишите что находится в посылке (например: книги, одежда, документы)',
          icon: Icons.description_outlined,
          onChanged: onDataChanged,
        ),
      ],
    );
  }
}
