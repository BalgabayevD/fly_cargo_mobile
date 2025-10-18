import 'package:equatable/equatable.dart';
import 'package:fly_cargo/shared/destination/data/models/destination_models.dart';

abstract class DestinationEvent extends Equatable {
  const DestinationEvent();

  @override
  List<Object?> get props => [];
}

/// Событие загрузки городов отправки
class LoadCitiesFromEvent extends DestinationEvent {
  const LoadCitiesFromEvent();
}

/// Событие загрузки городов доставки
class LoadCitiesToEvent extends DestinationEvent {
  final String fromCityId;

  const LoadCitiesToEvent({required this.fromCityId});

  @override
  List<Object?> get props => [fromCityId];
}

/// Событие поиска адресов
class SearchAddressesEvent extends DestinationEvent {
  final String city;
  final String address;

  const SearchAddressesEvent({required this.city, required this.address});

  @override
  List<Object?> get props => [city, address];
}

/// Событие загрузки всех городов
class LoadAllCitiesEvent extends DestinationEvent {
  final String? fromCityId;

  const LoadAllCitiesEvent({this.fromCityId});

  @override
  List<Object?> get props => [fromCityId];
}

/// Событие выбора города
class SelectCityEvent extends DestinationEvent {
  final CityModel city;

  const SelectCityEvent({required this.city});

  @override
  List<Object?> get props => [city];
}

/// Событие выбора адреса
class SelectAddressEvent extends DestinationEvent {
  final AddressModel address;

  const SelectAddressEvent({required this.address});

  @override
  List<Object?> get props => [address];
}

/// Событие сброса состояния
class ResetDestinationEvent extends DestinationEvent {
  const ResetDestinationEvent();
}
