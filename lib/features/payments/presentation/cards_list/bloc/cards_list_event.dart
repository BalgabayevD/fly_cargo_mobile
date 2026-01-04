import 'package:equatable/equatable.dart';

abstract class CardsListEvent extends Equatable {
  const CardsListEvent();
  
  @override
  List<Object?> get props => [];
}

class CardsListLoadRequested extends CardsListEvent {
  const CardsListLoadRequested();
}

class CardsListRefreshRequested extends CardsListEvent {
  const CardsListRefreshRequested();
}

class CardsListCardSelected extends CardsListEvent {
  final int cardId;
  
  const CardsListCardSelected(this.cardId);
  
  @override
  List<Object?> get props => [cardId];
}

