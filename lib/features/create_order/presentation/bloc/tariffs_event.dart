part of 'tariffs_bloc.dart';

sealed class TariffsEvent {
  const TariffsEvent();
}

class TariffsLoadEvent extends TariffsEvent {}
