import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/features/payments/domain/entities/card_entity.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentCardTile extends StatelessWidget {
  final CardEntity card;
  final VoidCallback? onTap;

  const PaymentCardTile({
    required this.card,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: BaseListTile(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 16,
          children: [
            Container(
              width: 62,
              height: 42,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: BeColors.border),
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
            Expanded(
              child: Column(
                spacing: 3,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    card.mask,
                    style: GoogleFonts.montserrat(
                      fontSize: 17,
                      height: 1,
                      fontWeight: FontWeight.w500,
                      color: BeColors.surface5,
                    ),
                  ),
                  Text(
                    '${card.type} ${card.bank}',
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                      height: 1,
                      color: BeColors.surface4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
