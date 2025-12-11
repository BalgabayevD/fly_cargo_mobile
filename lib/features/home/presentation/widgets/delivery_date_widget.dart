import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:intl/intl.dart';

class DeliveryDateWidget extends StatelessWidget {
  final DateTime? deliveryDate;

  const DeliveryDateWidget({
    this.deliveryDate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (deliveryDate == null) {
      return const SizedBox.shrink();
    }

    final dateFormat = DateFormat('d MMMM yyyy', 'ru');
    final formattedDate = dateFormat.format(deliveryDate!);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        child: Text(
          'Примерная дата доставки: $formattedDate года',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.surface4,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
