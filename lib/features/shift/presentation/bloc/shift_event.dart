import 'package:equatable/equatable.dart';

abstract class ShiftEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ShiftLoadStatusEvent extends ShiftEvent {}

class ShiftOpenEvent extends ShiftEvent {}

class ShiftCloseEvent extends ShiftEvent {}
