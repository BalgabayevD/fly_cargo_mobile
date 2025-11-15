import 'package:flutter/material.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/order_card.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/order_text_field.dart';
class OrderTextArea extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final IconData icon;
  final VoidCallback? onChanged;
  const OrderTextArea({
    required this.controller, required this.label, required this.hintText, required this.icon, super.key,
    this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return OrderCard(
      child: OrderTextField(
        controller: controller,
        label: label,
        hintText: hintText,
        prefixIcon: icon,
        maxLines: 3,
        onChanged: onChanged,
      ),
    );
  }
}
