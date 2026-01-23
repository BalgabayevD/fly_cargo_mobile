import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';

class CopyPaymentLinkButton extends StatelessWidget {
  final int orderId;

  const CopyPaymentLinkButton({
    required this.orderId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BeButton(
      text: 'Скопировать ссылку на платеж',
      color: .gray,
      onPressed: () {
        final link = 'https://fly-cargo.kz/payment/$orderId';
        Clipboard.setData(ClipboardData(text: link));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.l10n.paymentLinkCopied),
            duration: Duration(seconds: 2),
          ),
        );
      },
    );
  }
}
