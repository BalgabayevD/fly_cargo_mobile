import 'package:equatable/equatable.dart';
import 'package:fly_cargo/shared/destination/data/models/destination_models.dart';

abstract class DestinationEvent extends Equatable {
  const DestinationEvent();

  @override
  List<Object?> get props => [];
}


class LoadCitiesFromEvent extends DestinationEvent {
  const LoadCitiesFromEvent();
}


class LoadCitiesToEvent extends DestinationEvent {
  final String fromCityId;

  const LoadCitiesToEvent({required this.fromCityId});

  @override
  List<Object?> get props => [fromCityId];
}


class SearchAddressesEvent extends DestinationEvent {
  final String city;
  final String address;

  const SearchAddressesEvent({required this.city, required this.address});

  @override
  List<Object?> get props => [city, address];
}


class LoadAllCitiesEvent extends DestinationEvent {
  final String? fromCityId;

  const LoadAllCitiesEvent({this.fromCityId});

  @override
  List<Object?> get props => [fromCityId];
}


class SelectCityEvent extends DestinationEvent {
  final CityModel city;

  const SelectCityEvent({required this.city});

  @override
  List<Object?> get props => [city];
}


class SelectAddressEvent extends DestinationEvent {
  final AddressModel address;

  const SelectAddressEvent({required this.address});

  @override
  List<Object?> get props => [address];
}


class ResetDestinationEvent extends DestinationEvent {
  const ResetDestinationEvent();
}
