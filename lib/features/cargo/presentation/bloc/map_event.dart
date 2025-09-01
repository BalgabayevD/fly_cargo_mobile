part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class MapLocationChanged extends MapEvent {
  final Location location;

  const MapLocationChanged(this.location);

  @override
  List<Object> get props => [location];
}

class SearchLocationsRequested extends MapEvent {
  final String query;

  const SearchLocationsRequested(this.query);

  @override
  List<Object> get props => [query];
}

class LocationSelected extends MapEvent {
  final Location location;

  const LocationSelected(this.location);

  @override
  List<Object> get props => [location];
}

class ClearSearch extends MapEvent {}
