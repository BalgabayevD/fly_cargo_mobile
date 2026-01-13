part of 'cities_bloc.dart';

sealed class CitiesState {}

class CitiesInitialState extends CitiesState {}

class CitiesEmptyState extends CitiesState {}

class CitiesLoadedState extends CitiesState {
  final LocationsEntity from;

  CitiesLoadedState(this.from);
}

class FromCityTouchedLoadedState extends CitiesState {
  final LocationsEntity from;
  final LocationsEntity to;

  FromCityTouchedLoadedState({
    required this.from,
    required this.to,
  });
}

class ToCityTouchedLoadedState extends CitiesState {
  final LocationsEntity from;
  final LocationsEntity to;

  ToCityTouchedLoadedState({
    required this.from,
    required this.to,
  });
}
