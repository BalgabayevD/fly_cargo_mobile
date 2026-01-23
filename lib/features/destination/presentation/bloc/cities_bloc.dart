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

  // Future<void> _updateLocation(
  //   UpdateLocationEvent event,
  //   Emitter<CitiesState> emit,
  // ) async {
  //   switch (event.field) {
  //     case .from:
  //       await _updateFromLocation(event.location, emit);
  //       break;
  //     case .to:
  //       await _updateToLocation(event.location, emit);
  //       break;
  //   }
  // }
  //
  // Future<void> _updateFromLocation(
  //   LocationsEntity event,
  //   Emitter<CitiesState> emit,
  // ) async {
  //   try {
  //     if (event.validQuery) {
  //       final queries = await cities.getAddressesFromQuery(
  //         event.city!.name,
  //         event.address!,
  //       );
  //
  //       event = event.copyWith(searchQueries: queries);
  //     }
  //
  //     if (state is CitiesLoadedState) {
  //       emit(CitiesLoadedState(event));
  //     }
  //
  //     if (state is FromCityTouchedLoadedState) {
  //       emit(
  //         FromCityTouchedLoadedState(
  //           from: event,
  //           to: (state as FromCityTouchedLoadedState).to,
  //         ),
  //       );
  //     }
  //   } catch (e) {}
  // }
  //
  // Future<void> _updateToLocation(
  //   LocationsEntity event,
  //   Emitter<CitiesState> emit,
  // ) async {
  //   try {
  //     var location = event;
  //
  //     if (event.validQuery) {
  //       final queries = await cities.getAddressesFromQuery(
  //         event.city!.name,
  //         event.address!,
  //       );
  //
  //       location = location.copyWith(searchQueries: queries);
  //     }
  //
  //     if (state is FromCityTouchedLoadedState) {
  //       emit(
  //         FromCityTouchedLoadedState(
  //           from: (state as FromCityTouchedLoadedState).from,
  //           to: location,
  //         ),
  //       );
  //     }
  //   } catch (e) {}
  // }
}
