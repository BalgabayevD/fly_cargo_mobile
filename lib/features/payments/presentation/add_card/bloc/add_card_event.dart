import 'package:equatable/equatable.dart';

abstract class AddCardEvent extends Equatable {
  const AddCardEvent();
  
  @override
  List<Object?> get props => [];
}

class AddCardRequested extends AddCardEvent {
  const AddCardRequested();
}

class AddCardCompleted extends AddCardEvent {
  const AddCardCompleted();
}

class AddCardCancelled extends AddCardEvent {
  const AddCardCancelled();
}

