import 'package:equatable/equatable.dart';
import 'package:fly_cargo/features/accumulator/domain/entities/accumulator_entity.dart';

abstract class AccumulatorScanState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AccumulatorScanInitialState extends AccumulatorScanState {}

class AccumulatorScanLoadingState extends AccumulatorScanState {}

class AccumulatorScanSuccessState extends AccumulatorScanState {
  final AccumulatorEntity accumulator;

  AccumulatorScanSuccessState(this.accumulator);

  @override
  List<Object?> get props => [accumulator];
}

class AccumulatorScanErrorState extends AccumulatorScanState {
  final String message;

  AccumulatorScanErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
