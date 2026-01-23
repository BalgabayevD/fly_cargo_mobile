part of 'payment_cards_bloc.dart';

class PaymentCardsState {
  final List<CardEntity> cards;

  const PaymentCardsState({required this.cards});

  PaymentCardsState copyWith({
    List<CardEntity>? cards,
  }) {
    return PaymentCardsState(
      cards: cards ?? this.cards,
    );
  }
}
