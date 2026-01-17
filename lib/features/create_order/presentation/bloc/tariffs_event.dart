part of 'tariffs_bloc.dart';

sealed class TariffsEvent {
  const TariffsEvent();
}

class TariffsLoadEvent extends TariffsEvent {}

class TariffsSelectTariffEvent extends TariffsEvent {
  final TariffsEntity tariff;

  const TariffsSelectTariffEvent(this.tariff);
}
