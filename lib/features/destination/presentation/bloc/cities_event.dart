part of 'cities_bloc.dart';

sealed class CitiesEvent {}

class LoadInitialCitiesEvent extends CitiesEvent {}

class TouchFromCityEvent extends CitiesEvent {
  final LocationsEntity location;

  TouchFromCityEvent(this.location);
}

class TouchToCityEvent extends CitiesEvent {
  final LocationsEntity location;

  TouchToCityEvent(this.location);
}
