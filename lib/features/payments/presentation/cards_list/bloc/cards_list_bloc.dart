import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/payments/domain/usecases/fetch_cards_usecase.dart';
import 'package:fly_cargo/features/payments/presentation/cards_list/bloc/cards_list_event.dart';
import 'package:fly_cargo/features/payments/presentation/cards_list/bloc/cards_list_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class CardsListBloc extends Bloc<CardsListEvent, CardsListState> {
  final FetchCardsUseCase _fetchCardsUseCase;
  
  CardsListBloc(this._fetchCardsUseCase) : super(const CardsListInitial()) {
    on<CardsListLoadRequested>(_onLoadRequested);
    on<CardsListRefreshRequested>(_onRefreshRequested);
    on<CardsListCardSelected>(_onCardSelected);
  }
  
  Future<void> _onLoadRequested(
    CardsListLoadRequested event,
    Emitter<CardsListState> emit,
  ) async {
    emit(const CardsListLoading());
    try {
      final cards = await _fetchCardsUseCase();
      if (cards.isEmpty) {
        emit(const CardsListEmpty());
      } else {
        emit(CardsListLoaded(cards: cards));
      }
    } catch (e) {
      emit(CardsListError('Не удалось загрузить карты: ${e.toString()}'));
    }
  }
  
  Future<void> _onRefreshRequested(
    CardsListRefreshRequested event,
    Emitter<CardsListState> emit,
  ) async {
    try {
      final cards = await _fetchCardsUseCase();
      if (cards.isEmpty) {
        emit(const CardsListEmpty());
      } else {
        final currentState = state;
        final selectedCardId = currentState is CardsListLoaded 
            ? currentState.selectedCardId 
            : null;
        emit(CardsListLoaded(cards: cards, selectedCardId: selectedCardId));
      }
    } catch (e) {
      emit(CardsListError('Не удалось обновить карты: ${e.toString()}'));
    }
  }
  
  Future<void> _onCardSelected(
    CardsListCardSelected event,
    Emitter<CardsListState> emit,
  ) async {
    final currentState = state;
    if (currentState is CardsListLoaded) {
      emit(currentState.copyWith(selectedCardId: event.cardId));
    }
  }
}

