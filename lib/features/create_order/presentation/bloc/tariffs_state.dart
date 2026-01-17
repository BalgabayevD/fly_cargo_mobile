part of 'tariffs_bloc.dart';

sealed class TariffsState {
  const TariffsState();
}

class TariffsInitialState extends TariffsState {}

class TariffsLoadedState extends TariffsState with EquatableMixin {
  final TariffsEntity tariff;

  const TariffsLoadedState(this.tariff);

  @override
  List<Object?> get props => [tariff];
}
