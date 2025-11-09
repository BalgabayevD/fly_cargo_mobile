import 'package:flutter/material.dart';

mixin SendPackageButtonStyling {
  static const double buttonHeight = 56.0;
  static const double borderRadius = 16.0;
  static const double iconSize = 24.0;
  static const double spacing = 12.0;
  static const double shadowBlur = 8.0;
  static const double shadowOffset = 4.0;
  static const double shadowAlpha = 0.3;
}

class SendPackageButtonWidget extends StatelessWidget
    with SendPackageButtonStyling {
  final VoidCallback onTap;

  const SendPackageButtonWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: SendPackageButtonStyling.buttonHeight,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF007AFF), Color(0xFF0056CC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(
            SendPackageButtonStyling.borderRadius,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(
                0xFF007AFF,
              ).withValues(alpha: SendPackageButtonStyling.shadowAlpha),
              blurRadius: SendPackageButtonStyling.shadowBlur,
              offset: const Offset(0, SendPackageButtonStyling.shadowOffset),
            ),
          ],
        ),
        child: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.local_shipping,
                color: Colors.white,
                size: SendPackageButtonStyling.iconSize,
              ),
              SizedBox(width: SendPackageButtonStyling.spacing),
              Text(
                'Отправить посылку',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
