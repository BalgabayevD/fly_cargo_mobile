import 'package:equatable/equatable.dart';
import 'package:fly_cargo/features/tariffs/domain/entities/tariff_entity.dart';

abstract class TariffsState extends Equatable {
  const TariffsState();
  @override
  List<Object?> get props => [];
}

class TariffsInitial extends TariffsState {
  const TariffsInitial();
}

class TariffsLoading extends TariffsState {
  const TariffsLoading();
}

class TariffsLoaded extends TariffsState {
  final List<TariffCategoryEntity> categories;
  const TariffsLoaded({required this.categories});
  @override
  List<Object?> get props => [categories];
}

class TariffsError extends TariffsState {
  final String message;
  const TariffsError({required this.message});
  @override
  List<Object?> get props => [message];
}
