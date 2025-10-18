import 'package:equatable/equatable.dart';
import 'package:fly_cargo/shared/destination/data/models/destination_models.dart';

abstract class DestinationState extends Equatable {
  const DestinationState();

  @override
  List<Object?> get props => [];
}

/// Начальное состояние
class DestinationInitial extends DestinationState {
  const DestinationInitial();
}

/// Состояние загрузки
class DestinationLoading extends DestinationState {
  const DestinationLoading();
}

/// Состояние успешной загрузки городов отправки
class CitiesFromLoaded extends DestinationState {
  final List<CityModel> cities;

  const CitiesFromLoaded({required this.cities});

  @override
  List<Object?> get props => [cities];
}

/// Состояние успешной загрузки городов доставки
class CitiesToLoaded extends DestinationState {
  final List<CityModel> cities;

  const CitiesToLoaded({required this.cities});

  @override
  List<Object?> get props => [cities];
}

/// Состояние успешной загрузки всех городов
class AllCitiesLoaded extends DestinationState {
  final List<CityModel> cities;

  const AllCitiesLoaded({required this.cities});

  @override
  List<Object?> get props => [cities];
}

/// Состояние успешного поиска адресов
class AddressesFound extends DestinationState {
  final List<AddressModel> addresses;

  const AddressesFound({required this.addresses});

  @override
  List<Object?> get props => [addresses];
}

/// Состояние выбора города
class CitySelected extends DestinationState {
  final CityModel selectedCity;

  const CitySelected({required this.selectedCity});

  @override
  List<Object?> get props => [selectedCity];
}

/// Состояние выбора адреса
class AddressSelected extends DestinationState {
  final AddressModel selectedAddress;

  const AddressSelected({required this.selectedAddress});

  @override
  List<Object?> get props => [selectedAddress];
}

/// Состояние ошибки
class DestinationError extends DestinationState {
  final String message;

  const DestinationError({required this.message});

  @override
  List<Object?> get props => [message];
}
