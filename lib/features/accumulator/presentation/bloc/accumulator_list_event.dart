import 'package:equatable/equatable.dart';

abstract class AccumulatorListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AccumulatorListLoadEvent extends AccumulatorListEvent {}

class AccumulatorListRefreshEvent extends AccumulatorListEvent {}
