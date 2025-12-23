import 'package:flutter/material.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/order_section_header.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/order_text_area.dart';
class OrderCommentSection extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onDataChanged;
  const OrderCommentSection({
    required this.controller, required this.onDataChanged, super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const OrderSectionHeader(
          icon: Icons.message_outlined,
          title: 'Комментарий для курьера',
          subtitle: 'Дополнительная информация для доставки',
        ),
        const SizedBox(height: 16),
        OrderTextArea(
          controller: controller,
          label: 'Дополнительная информация для курьера',
          hintText: 'Например: Позвонить за 10 минут, оставить у соседей',
          icon: Icons.message_outlined,
          onChanged: onDataChanged,
        ),
      ],
    );
  }
}
