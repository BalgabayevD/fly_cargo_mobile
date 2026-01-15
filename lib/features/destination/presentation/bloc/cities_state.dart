part of 'cities_bloc.dart';

sealed class CitiesState {}

class CitiesInitialState extends CitiesState {}

class CitiesEmptyState extends CitiesState {}

class FromCityTouchedLoadedState extends CitiesState {
  final LocationsEntity from;
  final LocationsEntity to;

  FromCityTouchedLoadedState(this.from, this.to);

  FromCityTouchedLoadedState copyWith({
    LocationsEntity? from,
    LocationsEntity? to,
  }) {
    return FromCityTouchedLoadedState(
      from ?? this.from,
      to ?? this.to,
    );
  }
}

class ToCityTouchedLoadedState extends CitiesState {
  final LocationsEntity from;
  final LocationsEntity to;

  ToCityTouchedLoadedState({
    required this.from,
    required this.to,
  });
}
