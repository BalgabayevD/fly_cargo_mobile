import 'package:equatable/equatable.dart';

abstract class AccumulatorScanEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AccumulatorScanIdentificationEvent extends AccumulatorScanEvent {
  final String identification;

  AccumulatorScanIdentificationEvent(this.identification);

  @override
  List<Object?> get props => [identification];
}

class AccumulatorScanResetEvent extends AccumulatorScanEvent {}
