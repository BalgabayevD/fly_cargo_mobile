import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/payments/domain/entities/card_entity.dart';
import 'package:fly_cargo/features/payments/domain/usecases/payment_usecase.dart';
import 'package:injectable/injectable.dart';

part 'payment_cards_event.dart';
part 'payment_cards_state.dart';

@injectable
class PaymentCardsBloc extends Bloc<PaymentCardsEvent, PaymentCardsState> {
  final PaymentUseCase payment;

  PaymentCardsBloc(this.payment) : super(PaymentCardsState(cards: [])) {
    on<PaymentCardsLoadEvent>(_load);
    on<PaymentCardsAddEvent>(_add);
    on<PaymentCardsDeleteEvent>(_delete);
  }

  Future<void> _load(
    PaymentCardsLoadEvent event,
    Emitter<PaymentCardsState> emit,
  ) async {
    final cards = await payment.getCardsList();
    emit(state.copyWith(cards: cards));
  }

  Future<void> _add(
    PaymentCardsAddEvent event,
    Emitter<PaymentCardsState> emit,
  ) async {
    final url = await payment.addCard();
    emit(PaymentCardsAddState(cards: state.cards, url: url));
  }

  Future<void> _delete(
    PaymentCardsDeleteEvent event,
    Emitter<PaymentCardsState> emit,
  ) async {
    final success = await payment.deleteCard(event.cardId);
    if (success) {
      final updatedCards =
          state.cards.where((card) => card.id != event.cardId).toList();
      emit(state.copyWith(cards: updatedCards));
    }
  }
}
