part of 'live_bloc.dart';

@immutable
sealed class LiveState {}

final class LiveInitialState extends LiveState {}

final class LiveInitialLoading extends LiveState {}

final class LiveInitialLoaded extends LiveState {}
