import 'package:equatable/equatable.dart';
import 'package:fly_cargo/shared/tariffs/data/models/tariff_models.dart';

abstract class TariffsState extends Equatable {
  const TariffsState();

  @override
  List<Object?> get props => [];
}

/// Начальное состояние
class TariffsInitial extends TariffsState {
  const TariffsInitial();
}

/// Состояние загрузки
class TariffsLoading extends TariffsState {
  const TariffsLoading();
}

/// Состояние успешной загрузки
class TariffsLoaded extends TariffsState {
  final List<TariffCategoryModel> categories;

  const TariffsLoaded({required this.categories});

  @override
  List<Object?> get props => [categories];
}

/// Состояние ошибки
class TariffsError extends TariffsState {
  final String message;

  const TariffsError({required this.message});

  @override
  List<Object?> get props => [message];
}
