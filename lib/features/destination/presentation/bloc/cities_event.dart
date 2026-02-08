part of 'cities_bloc.dart';

sealed class CitiesEvent {
  const CitiesEvent();
}

class LoadInitialCitiesEvent extends CitiesEvent {}

class TouchFromCityEvent extends CitiesEvent {
  final LocationsEntity location;

  const TouchFromCityEvent(this.location);
}

class TouchToCityEvent extends CitiesEvent {
  final LocationsEntity location;

  const TouchToCityEvent(this.location);
}

class TouchFromAddressEvent extends CitiesEvent {
  final String cityName;
  final String address;

  const TouchFromAddressEvent(this.cityName, this.address);
}

class TouchToAddressEvent extends CitiesEvent {
  final String cityName;
  final String address;

  const TouchToAddressEvent(this.cityName, this.address);
}
