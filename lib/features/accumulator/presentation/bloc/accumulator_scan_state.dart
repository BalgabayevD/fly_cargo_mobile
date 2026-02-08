import 'package:equatable/equatable.dart';

abstract class AccumulatorScanState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AccumulatorScanInitialState extends AccumulatorScanState {}

class AccumulatorScanScannedState extends AccumulatorScanState {}

class AccumulatorScanSuccessState extends AccumulatorScanState {}

class AccumulatorScanErrorState extends AccumulatorScanState {
  final String message;

  AccumulatorScanErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
