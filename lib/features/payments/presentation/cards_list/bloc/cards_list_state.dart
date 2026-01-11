import 'package:equatable/equatable.dart';
import 'package:fly_cargo/features/payments/domain/entities/card.dart';

abstract class CardsListState extends Equatable {
  const CardsListState();
  
  @override
  List<Object?> get props => [];
}

class CardsListInitial extends CardsListState {
  const CardsListInitial();
}

class CardsListLoading extends CardsListState {
  const CardsListLoading();
}

class CardsListLoaded extends CardsListState {
  final List<Card> cards;
  final int? selectedCardId;
  
  const CardsListLoaded({
    required this.cards,
    this.selectedCardId,
  });
  
  @override
  List<Object?> get props => [cards, selectedCardId];
  
  CardsListLoaded copyWith({
    List<Card>? cards,
    int? selectedCardId,
  }) {
    return CardsListLoaded(
      cards: cards ?? this.cards,
      selectedCardId: selectedCardId ?? this.selectedCardId,
    );
  }
}

class CardsListEmpty extends CardsListState {
  const CardsListEmpty();
}

class CardsListError extends CardsListState {
  final String message;
  
  const CardsListError(this.message);
  
  @override
  List<Object?> get props => [message];
}

