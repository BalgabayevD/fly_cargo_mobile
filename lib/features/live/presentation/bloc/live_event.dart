part of 'live_bloc.dart';

@immutable
sealed class LiveEvent {}

class LiveStartEvent extends LiveEvent {}
