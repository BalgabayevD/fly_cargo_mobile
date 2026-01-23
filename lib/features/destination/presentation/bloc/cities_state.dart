part of 'cities_bloc.dart';

sealed class CitiesState {
  const CitiesState();
}

class CitiesEmptyState extends CitiesState {}

class CitySelectedState extends CitiesState with EquatableMixin {
  final LocationsEntity from;
  final LocationsEntity to;

  const CitySelectedState(this.from, this.to);

  CitySelectedState copyWith({
    LocationsEntity? from,
    LocationsEntity? to,
  }) {
    return CitySelectedState(
      from ?? this.from,
      to ?? this.to,
    );
  }

  @override
  List<Object?> get props => [from, to];
}
