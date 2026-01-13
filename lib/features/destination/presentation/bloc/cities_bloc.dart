import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/destination/domain/entities/locations_entity.dart';
import 'package:fly_cargo/features/destination/domain/usecases/cities_use_case.dart';

part 'cities_event.dart';
part 'cities_state.dart';

class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {
  final CitiesUseCase cities;

  CitiesBloc(this.cities) : super(CitiesInitialState()) {
    on<LoadFromCitiesEvent>(_loadFromCities);
    on<TouchFromCityEvent>(_touchFromCity);
    on<TouchToCityEvent>(_touchToCity);
    on<UpdateLocationEvent>(_updateLocation);
  }

  Future<void> _loadFromCities(
    LoadFromCitiesEvent event,
    Emitter<CitiesState> emit,
  ) async {
    try {
      final localFromCities = await cities.getPersistCitiesFrom();

      if (localFromCities.isNotEmpty) {
        final from = LocationsEntity(
          cities: localFromCities,
          selectedCityId: localFromCities.first.id,
        );

        emit(CitiesLoadedState(from));
      }

      final remoteFromCities = await cities.getRestCitiesFrom();

      if (remoteFromCities.isNotEmpty) {
        final from = LocationsEntity(
          cities: remoteFromCities,
          selectedCityId: remoteFromCities.first.id,
        );

        emit(CitiesLoadedState(from));
        await cities.saveCitiesFrom(remoteFromCities);

        add(TouchFromCityEvent(remoteFromCities.first.id));
      }
    } catch (_) {
      emit(CitiesEmptyState());
    }
  }

  Future<void> _touchFromCity(
    TouchFromCityEvent event,
    Emitter<CitiesState> emit,
  ) async {
    if (state is CitiesLoadedState || state is FromCityTouchedLoadedState) {
      final s = state as CitiesLoadedState;

      if (event.cityId == s.from.selectedCityId) return;

      final from = s.from.copyWith(selectedCityId: event.cityId);

      final to = LocationsEntity(
        cities: [],
        selectedCityId: null,
      );

      emit(FromCityTouchedLoadedState(from: from, to: to));

      try {
        final toCities = await cities.getPersistCitiesTo(event.cityId);

        if (toCities.isNotEmpty) {
          final to = LocationsEntity(
            cities: toCities,
            selectedCityId: toCities.first.id,
          );

          emit(FromCityTouchedLoadedState(from: s.from, to: to));
        }

        final remoteToCities = await cities.getRestCitiesTo(event.cityId);

        if (remoteToCities.isNotEmpty) {
          final to = LocationsEntity(
            cities: remoteToCities,
            selectedCityId: remoteToCities.first.id,
          );

          emit(FromCityTouchedLoadedState(from: s.from, to: to));
        }
      } catch (_) {}
    }
  }

  Future<void> _touchToCity(
    TouchToCityEvent event,
    Emitter<CitiesState> emit,
  ) async {
    if (state is ToCityTouchedLoadedState) {
      final s = state as ToCityTouchedLoadedState;

      if (event.cityId == s.to.selectedCityId) return;

      final to = s.from.copyWith(selectedCityId: event.cityId);

      emit(FromCityTouchedLoadedState(from: s.from, to: to));
    }
  }

  Future<void> _updateLocation(
    UpdateLocationEvent event,
    Emitter<CitiesState> emit,
  ) async {
    switch (event.field) {
      case .from:
        await _updateFromLocation(event.location, emit);
        break;
      case .to:
        await _updateToLocation(event.location, emit);
        break;
    }
  }

  Future<void> _updateFromLocation(
    LocationsEntity event,
    Emitter<CitiesState> emit,
  ) async {
    try {
      var location = event;

      if (event.validQuery) {
        final queries = await cities.getAddressesFromQuery(
          event.city!.name,
          event.address!,
        );

        location = location.copyWith(searchQueries: queries);
      }

      if (state is CitiesLoadedState) {
        emit(CitiesLoadedState(event));
      }

      if (state is FromCityTouchedLoadedState) {
        emit(
          FromCityTouchedLoadedState(
            from: event,
            to: (state as FromCityTouchedLoadedState).to,
          ),
        );
      }
    } catch (e) {}
  }

  Future<void> _updateToLocation(
    LocationsEntity event,
    Emitter<CitiesState> emit,
  ) async {
    try {
      var location = event;

      if (event.validQuery) {
        final queries = await cities.getAddressesFromQuery(
          event.city!.name,
          event.address!,
        );

        location = location.copyWith(searchQueries: queries);
      }

      if (state is FromCityTouchedLoadedState) {
        emit(
          FromCityTouchedLoadedState(
            from: (state as FromCityTouchedLoadedState).from,
            to: location,
          ),
        );
      }
    } catch (e) {}
  }
}
