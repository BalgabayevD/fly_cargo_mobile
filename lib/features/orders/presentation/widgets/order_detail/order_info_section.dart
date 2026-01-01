import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

class OrderInfoSection extends StatelessWidget {
  final String label;
  final String value;

  const OrderInfoSection({
    required this.label,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.surface4,
            ),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.surface5,
            ),
          ),
        ],
      ),
    );
  }
}

