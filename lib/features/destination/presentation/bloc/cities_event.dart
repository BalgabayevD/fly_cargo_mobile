part of 'cities_bloc.dart';

sealed class CitiesEvent {}

class LoadFromCitiesEvent extends CitiesEvent {}

class TouchFromCityEvent extends CitiesEvent {
  final int cityId;

  TouchFromCityEvent(this.cityId);
}

class TouchToCityEvent extends CitiesEvent {
  final int cityId;

  TouchToCityEvent(this.cityId);
}

enum LocationsEntityField { from, to }

class UpdateLocationEvent extends CitiesEvent {
  final LocationsEntityField field;
  final LocationsEntity location;

  UpdateLocationEvent(this.field, this.location);
}
