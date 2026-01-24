import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';

class OrdersList extends StatelessWidget {
  final List<OrderEntity> orders;
  final void Function(OrderEntity order) onOrderTap;

  const OrdersList({
    required this.orders,
    required this.onOrderTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.lg),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.md),
          child: Text('1'),
        );
      },
    );
  }
}
