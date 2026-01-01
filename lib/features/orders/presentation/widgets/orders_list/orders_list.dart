import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/shared/orders/data/models/order_model.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/order_card.dart';

class OrdersList extends StatelessWidget {
  final List<OrderModel> orders;
  final void Function(OrderModel order) onOrderTap;

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
        final order = orders[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.md),
          child: OrderCard(
            order: order,
            onTap: () => onOrderTap(order),
          ),
        );
      },
    );
  }
}

