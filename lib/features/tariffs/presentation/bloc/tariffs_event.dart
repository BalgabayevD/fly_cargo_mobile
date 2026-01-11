import 'package:equatable/equatable.dart';
abstract class TariffsEvent extends Equatable {
  const TariffsEvent();
  @override
  List<Object?> get props => [];
}
class LoadTariffCategoriesEvent extends TariffsEvent {
  const LoadTariffCategoriesEvent();
}
class ResetTariffsEvent extends TariffsEvent {
  const ResetTariffsEvent();
}
