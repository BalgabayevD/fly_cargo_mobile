import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

class PaymentProcessingWidget extends StatelessWidget {
  const PaymentProcessingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            color: Color(0xFF5C3A31),
            strokeWidth: 3,
          ),
          const SizedBox(height: 24),
          Text(
            'Обработка платежа...',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.surface5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Пожалуйста, подождите',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.surface4,
            ),
          ),
        ],
      ),
    );
  }
}

