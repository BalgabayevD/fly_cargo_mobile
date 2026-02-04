import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/bottom_dialog.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/typography.dart';
import 'package:fly_cargo/features/payments/domain/entities/card_entity.dart';

class DeleteCardBottomSheet {
  static Future<bool?> show(BuildContext context, CardEntity card) {
    return BeBottomDialog.showBottomDialog<bool>(
      context: context,
      text: 'Управление картой',
      initialChildSize: 0.35,
      maxChildSize: 0.35,
      minChildSize: 0.2,
      children: [_CardInfo(card: card)],
      action: Builder(
        builder: (ctx) => BeButton(
          text: 'Удалить карту',
          color: BeButtonColor.primary,
          onPressed: () => Navigator.of(ctx).pop(true),
        ),
      ),
    );
  }
}

class _CardInfo extends StatelessWidget {
  final CardEntity card;

  const _CardInfo({required this.card});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 62,
          height: 42,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: BeColors.surface2),
            borderRadius: BorderRadius.circular(8),
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.network(
            card.image,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.credit_card,
                color: BeColors.surface4,
              );
            },
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(card.mask, style: AppTypography.bodyLarge),
            Text(
              '${card.type} ${card.bank}',
              style: AppTypography.bodySmall.copyWith(
                color: BeColors.surface4,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
