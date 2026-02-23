import 'package:equatable/equatable.dart';
import 'package:fly_cargo/features/shift/domain/entities/shift_entity.dart';

abstract class ShiftState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ShiftInitialState extends ShiftState {}

class ShiftLoadingState extends ShiftState {}

class ShiftLoadedState extends ShiftState {
  final ShiftEntity shift;

  ShiftLoadedState(this.shift);

  @override
  List<Object?> get props => [shift];
}

class ShiftActionInProgressState extends ShiftState {
  final ShiftEntity shift;

  ShiftActionInProgressState(this.shift);

  @override
  List<Object?> get props => [shift];
}

class ShiftErrorState extends ShiftState {
  final String message;

  ShiftErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
