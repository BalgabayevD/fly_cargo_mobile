import 'package:equatable/equatable.dart';

abstract class TariffsEvent extends Equatable {
  const TariffsEvent();

  @override
  List<Object?> get props => [];
}

/// Событие загрузки категорий тарифов
class LoadTariffCategoriesEvent extends TariffsEvent {
  const LoadTariffCategoriesEvent();
}

/// Событие сброса состояния
class ResetTariffsEvent extends TariffsEvent {
  const ResetTariffsEvent();
}
