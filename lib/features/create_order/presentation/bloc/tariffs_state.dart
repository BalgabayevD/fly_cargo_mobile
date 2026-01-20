part of 'tariffs_bloc.dart';

class TariffsState with EquatableMixin {
  final TariffsEntity tariff;

  const TariffsState(this.tariff);

  factory TariffsState.empty() => const TariffsState(TariffsEntity.empty());

  @override
  List<Object?> get props => [tariff];
}
