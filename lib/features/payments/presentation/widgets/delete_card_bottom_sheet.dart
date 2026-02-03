import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/payments/domain/entities/card_entity.dart';
import 'package:heroicons/heroicons.dart';

class DeleteCardBottomSheet extends StatelessWidget {
  final CardEntity card;
  final VoidCallback onDelete;

  const DeleteCardBottomSheet({
    required this.card,
    required this.onDelete,
    super.key,
  });

  static Future<bool?> show(BuildContext context, CardEntity card) {
    return showModalBottomSheet<bool>(
      context: context,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => DeleteCardBottomSheet(
        card: card,
        onDelete: () => Navigator.pop(context, true),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXL),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Header(onClose: () => Navigator.pop(context, false)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: Column(
              children: [
                _CardInfo(card: card),
                const SizedBox(height: AppSpacing.xl),
                _DeleteButton(
                  onPressed: onDelete,
                  bottomPadding: bottomPadding,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onClose;

  const _Header({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.sm),
      child: Row(
        children: [
          const SizedBox(width: 48),
          Expanded(
            child: Text(
              'Управление картой',
              style: AppTypography.h5,
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            icon: HeroIcon(
              HeroIcons.xMark,
              size: 24,
              color: AppColors.surface4,
            ),
            onPressed: onClose,
          ),
        ],
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
            border: Border.all(width: 1, color: AppColors.surface2),
            borderRadius: BorderRadius.circular(8),
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.network(
            card.image,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.credit_card,
                color: AppColors.surface4,
              );
            },
          ),
        ),
        const SizedBox(width: AppSpacing.lg),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(card.mask, style: AppTypography.bodyLarge),
            Text(
              '${card.type} ${card.bank}',
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.surface4,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _DeleteButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double bottomPadding;

  const _DeleteButton({
    required this.onPressed,
    required this.bottomPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding + AppSpacing.lg),
      child: BeButton(
        text: 'Удалить карту',
        color: BeButtonColor.primary,
        onPressed: onPressed,
      ),
    );
  }
}
