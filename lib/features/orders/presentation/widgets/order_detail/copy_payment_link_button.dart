import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';

class CopyPaymentLinkButton extends StatelessWidget {
  final int orderId;

  const CopyPaymentLinkButton({
    required this.orderId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final link = 'https://fly-cargo.kz/payment/$orderId';
        Clipboard.setData(ClipboardData(text: link));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.l10n.paymentLinkCopied),
            duration: Duration(seconds: 2),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            context.l10n.copyPaymentLink,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.surface5,
            ),
          ),
        ),
      ),
    );
  }
}

