import 'package:flutter/material.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/order_card.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/order_section_header.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/order_text_field.dart';

class OrderAddressDetailsSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextEditingController apartmentController;
  final TextEditingController entranceController;
  final TextEditingController floorController;
  final VoidCallback onDataChanged;

  const OrderAddressDetailsSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.apartmentController,
    required this.entranceController,
    required this.floorController,
    required this.onDataChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrderSectionHeader(
          icon: Icons.location_on_outlined,
          title: title,
          subtitle: subtitle,
        ),
        const SizedBox(height: 16),
        OrderCard(
          child: Row(
            children: [
              Expanded(
                child: OrderTextField(
                  controller: apartmentController,
                  label: 'Квартира',
                  onChanged: onDataChanged,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OrderTextField(
                  controller: entranceController,
                  label: 'Подъезд',
                  onChanged: onDataChanged,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OrderTextField(
                  controller: floorController,
                  label: 'Этаж',
                  onChanged: onDataChanged,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
