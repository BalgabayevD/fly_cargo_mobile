import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';

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
            context.l10n.processingPayment,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.surface5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            context.l10n.pleaseWait,
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

