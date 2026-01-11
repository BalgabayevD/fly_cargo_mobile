import 'package:equatable/equatable.dart';

abstract class AddCardState extends Equatable {
  const AddCardState();
  
  @override
  List<Object?> get props => [];
}

class AddCardInitial extends AddCardState {
  const AddCardInitial();
}

class AddCardLoading extends AddCardState {
  const AddCardLoading();
}

class AddCardFormReady extends AddCardState {
  final String formUrl;
  
  const AddCardFormReady(this.formUrl);
  
  @override
  List<Object?> get props => [formUrl];
}

class AddCardSuccess extends AddCardState {
  const AddCardSuccess();
}

class AddCardError extends AddCardState {
  final String message;
  
  const AddCardError(this.message);
  
  @override
  List<Object?> get props => [message];
}

