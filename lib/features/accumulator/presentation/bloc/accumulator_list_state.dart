import 'package:equatable/equatable.dart';
import 'package:fly_cargo/features/accumulator/domain/entities/accumulator_entity.dart';

abstract class AccumulatorListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AccumulatorListInitialState extends AccumulatorListState {}

class AccumulatorListLoadingState extends AccumulatorListState {}

class AccumulatorListLoadedState extends AccumulatorListState {
  final List<AccumulatorEntity> accumulators;

  AccumulatorListLoadedState(this.accumulators);

  @override
  List<Object?> get props => [accumulators];
}

class AccumulatorListEmptyState extends AccumulatorListState {}

class AccumulatorListErrorState extends AccumulatorListState {
  final String message;

  AccumulatorListErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
