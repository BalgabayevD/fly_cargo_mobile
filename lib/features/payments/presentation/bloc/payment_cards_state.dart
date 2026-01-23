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

class PaymentCardsAddState extends PaymentCardsState {
  final String url;

  const PaymentCardsAddState({required this.url, required super.cards});

  @override
  PaymentCardsAddState copyWith({
    List<CardEntity>? cards,
    String? url,
  }) {
    return PaymentCardsAddState(
      cards: cards ?? this.cards,
      url: url ?? this.url,
    );
  }
}
