part of 'payment_cards_bloc.dart';

sealed class PaymentCardsEvent {}

class PaymentCardsLoadEvent extends PaymentCardsEvent {}

class PaymentCardsAddEvent extends PaymentCardsEvent {}
