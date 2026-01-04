import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/payments/domain/entities/card.dart' as payment_card;
import 'package:fly_cargo/features/payments/presentation/cards_list/bloc/cards_list_bloc.dart';
import 'package:fly_cargo/features/payments/presentation/cards_list/bloc/cards_list_event.dart';
import 'package:fly_cargo/features/payments/presentation/widgets/cards_list/payment_styles.dart';

/// Виджет элемента списка карты
class CardItemWidget extends StatelessWidget {
  final payment_card.Card card;
  final bool isSelected;
  
  const CardItemWidget({
    required this.card,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onCardTap(context),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: _buildContainerDecoration(context),
        child: Row(
          children: [
            _buildRadioButton(context),
            const SizedBox(width: 12),
            _buildCardImage(context),
            const SizedBox(width: 12),
            _buildCardInfo(context),
          ],
        ),
      ),
    );
  }

  void _onCardTap(BuildContext context) {
    context.read<CardsListBloc>().add(CardsListCardSelected(card.id));
  }

  BoxDecoration _buildContainerDecoration(BuildContext context) {
    return BoxDecoration(
      color: AppColors.white,
      border: Border.all(
        color: isSelected ? context.paymentPrimaryColor : AppColors.surface2,
        width: 1.5,
      ),
      borderRadius: BorderRadius.circular(context.cardBorderRadius),
    );
  }

  Widget _buildRadioButton(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? context.paymentPrimaryColor : AppColors.surface3,
          width: 2,
        ),
      ),
      child: isSelected ? _buildRadioButtonInner() : null,
    );
  }

  Widget _buildRadioButtonInner() {
    return Center(
      child: Container(
        width: 12,
        height: 12,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF5C3A31),
        ),
      ),
    );
  }

  Widget _buildCardImage(BuildContext context) {
    return Container(
      width: 56,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.surface3,
          width: 1,
        ),
      ),
      alignment: Alignment.center,
      child: card.image.isNotEmpty
          ? _buildNetworkImage(context)
          : _buildFallbackIcon(context),
    );
  }

  Widget _buildNetworkImage(BuildContext context) {
    return Image.network(
      card.image,
      width: 56,
      height: 40,
      fit: BoxFit.contain,
      errorBuilder: (_, __, ___) => _buildFallbackIcon(context),
    );
  }

  Widget _buildFallbackIcon(BuildContext context) {
    return Icon(
      Icons.credit_card,
      color: AppColors.surface4,
      size: 24,
    );
  }

  Widget _buildCardInfo(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            card.mask,
            style: context.cardTitleStyle.copyWith(
              color: AppColors.surface5,
            ),
          ),
          if (card.bank.isNotEmpty)
            Text(
              card.bank,
              style: context.cardSubtitleStyle.copyWith(
                color: AppColors.surface4,
              ),
            ),
        ],
      ),
    );
  }
}

