import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
class OrderCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  const OrderCard({required this.child, super.key, this.padding});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}
