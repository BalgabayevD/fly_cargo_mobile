import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/auth/domain/entities/user_type.dart';

class OrderPaymentButton extends StatelessWidget {
  final double price;
  final UserType userType;
  final VoidCallback onPressed;

  const OrderPaymentButton({
    required this.price,
    required this.userType,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF5C3A31),
          foregroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          userType.isUser
              ? 'Оплатить ${price.toStringAsFixed(0)} тг'
              : 'Привязать штрихкод',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

