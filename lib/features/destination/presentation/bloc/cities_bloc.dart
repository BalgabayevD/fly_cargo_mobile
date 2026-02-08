import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/destination/domain/entities/locations_entity.dart';
import 'package:fly_cargo/features/destination/domain/usecases/cities_use_case.dart';
import 'package:injectable/injectable.dart';

part 'cities_event.dart';
part 'cities_state.dart';

@injectable
class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {
  final CitiesUseCase cities;

  CitiesBloc(this.cities) : super(_getInitialState(cities)) {
    on<LoadInitialCitiesEvent>(_loadInitialCities);
    on<TouchFromCityEvent>(_touchFromCity);
    on<TouchToCityEvent>(_touchToCity);
    on<TouchFromAddressEvent>(_touchFromAddress);
    on<TouchToAddressEvent>(_touchToAddress);
  }

  static CitySelectedState _getInitialState(CitiesUseCase cities) {
    final (fromCity, toCity) = cities.getInitialCities();
    return CitySelectedState(fromCity, toCity);
  }

  Future<void> _loadInitialCities(
    LoadInitialCitiesEvent event,
    Emitter<CitiesState> emit,
  ) async {
    try {
      final initial = cities.getInitialCities();
      emit(CitySelectedState(initial.$1, initial.$2));

      LocationsEntity from = initial.$1;
      LocationsEntity to = initial.$2;

      final remoteFromCities = await cities.getRestCitiesFrom();

      if (remoteFromCities.isNotEmpty) {
        from = from.copyWith(
          cities: remoteFromCities,
          selectedCityId: remoteFromCities.first.id,
        );

        final remoteToCities = await cities.getRestCitiesTo(
          remoteFromCities.first.id,
        );

        if (remoteToCities.isNotEmpty) {
          to = to.copyWith(
            cities: remoteToCities,
            selectedCityId: remoteToCities.first.id,
          );
        }
      }

      emit(CitySelectedState(from, to));
    } catch (_) {
      emit(CitiesEmptyState());
    }
  }

  Future<void> _touchFromCity(
    TouchFromCityEvent event,
    Emitter<CitiesState> emit,
  ) async {
    if (state is CitySelectedState) {
      final current = state as CitySelectedState;

      try {
        if (event.location.selectedCityId != current.from.selectedCityId) {
          LocationsEntity to = current.to;

          final localToCities = cities.getPersistCitiesTo(
            event.location.selectedCityId!,
          );

          if (localToCities.isNotEmpty) {
            to = to.copyWith(cities: localToCities);
          }

          emit(CitySelectedState(event.location, to));

          final remoteToCities = await cities.getRestCitiesTo(
            event.location.selectedCityId!,
          );

          if (remoteToCities.isNotEmpty) {
            to = to.copyWith(
              cities: remoteToCities,
              selectedCityId: remoteToCities.first.id,
            );
          }

          emit(CitySelectedState(event.location, to));
        } else {
          emit(CitySelectedState(event.location, current.to));
        }
      } catch (_) {}
    }
  }

  Future<void> _touchToCity(
    TouchToCityEvent event,
    Emitter<CitiesState> emit,
  ) async {
    if (state is CitySelectedState) {
      final current = state as CitySelectedState;
      emit(CitySelectedState(current.from, event.location));
    }
  }

  Future<void> _touchFromAddress(
    TouchFromAddressEvent event,
    Emitter<CitiesState> emit,
  ) async {
    if (state is CitySelectedState) {
      final current = state as CitySelectedState;
      final searchQueries = await cities.getAddressesFromQuery(
        event.cityName,
        event.address,
      );
      emit(
        CitySelectedState(
          current.from.copyWith(
            searchQueries: searchQueries,
          ),
          current.to,
        ),
      );
    }
  }

  Future<void> _touchToAddress(
    TouchToAddressEvent event,
    Emitter<CitiesState> emit,
  ) async {
    if (state is CitySelectedState) {
      final current = state as CitySelectedState;
      final searchQueries = await cities.getAddressesFromQuery(
        event.cityName,
        event.address,
      );
      emit(
        CitySelectedState(
          current.from,
          current.to.copyWith(
            searchQueries: searchQueries,
          ),
        ),
      );
    }
  }
}
