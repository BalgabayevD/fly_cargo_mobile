import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/payments/domain/entities/card.dart'
    as payment_card;
import 'package:fly_cargo/features/payments/presentation/cards_list/bloc/cards_list_bloc.dart';
import 'package:fly_cargo/features/payments/presentation/cards_list/bloc/cards_list_state.dart';
import 'package:fly_cargo/features/payments/presentation/widgets/cards_list/card_item_widget.dart';
import 'package:fly_cargo/features/payments/presentation/widgets/cards_list/cards_list_footer_widget.dart';

/// Главный виджет списка карт
class CardsListWidget extends StatelessWidget {
  final int orderId;

  const CardsListWidget({
    required this.orderId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardsListBloc, CardsListState>(
      builder: (context, state) {
        if (state is CardsListLoading) {
          return _buildLoadingState();
        }

        if (state is CardsListError) {
          return _buildErrorState(state);
        }

        if (state is CardsListLoaded) {
          return _buildLoadedState(state);
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorState(CardsListError state) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          state.message,
          style: TextStyle(color: AppColors.danger),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildLoadedState(CardsListLoaded state) {
    return Column(
      children: [
        Expanded(
          child: _buildCardsList(state.cards, state.selectedCardId),
        ),
        CardsListFooterWidget(
          orderId: orderId,
          selectedCardId: state.selectedCardId,
        ),
      ],
    );
  }

  Widget _buildCardsList(
    List<payment_card.Card> cards,
    int? selectedCardId,
  ) {
    return ListView.builder(
      padding: const EdgeInsets.all(24),
      itemCount: cards.length,
      itemBuilder: (context, index) {
        final card = cards[index];
        return CardItemWidget(
          card: card,
          isSelected: selectedCardId == card.id,
        );
      },
    );
  }
}
