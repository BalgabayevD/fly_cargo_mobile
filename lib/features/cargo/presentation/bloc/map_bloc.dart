import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/location.dart';
import '../../domain/usecases/search_locations_usecase.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final SearchLocationsUseCase searchLocationsUseCase;

  MapBloc({required this.searchLocationsUseCase}) : super(const MapLoaded()) {
    on<MapLocationChanged>(_onLocationChanged);
    on<SearchLocationsRequested>(_onSearchLocationsRequested);
    on<LocationSelected>(_onLocationSelected);
    on<ClearSearch>(_onClearSearch);
  }

  Future<void> _onLocationChanged(
    MapLocationChanged event,
    Emitter<MapState> emit,
  ) async {
    if (state is MapLoaded) {
      emit((state as MapLoaded).copyWith(currentLocation: event.location));
    }
  }

  Future<void> _onSearchLocationsRequested(
    SearchLocationsRequested event,
    Emitter<MapState> emit,
  ) async {
    if (state is! MapLoaded) return;

    if (event.query.isEmpty) {
      emit(
        (state as MapLoaded).copyWith(
          searchResults: [],
          searchStatus: SearchStatus.initial,
        ),
      );
      return;
    }

    emit((state as MapLoaded).copyWith(searchStatus: SearchStatus.loading));

    final result = await searchLocationsUseCase(
      SearchLocationsParams(query: event.query),
    );

    result.fold(
      (failure) => emit(
        (state as MapLoaded).copyWith(
          searchStatus: SearchStatus.error,
          errorMessage: _mapFailureToMessage(failure),
        ),
      ),
      (locations) => emit(
        (state as MapLoaded).copyWith(
          searchResults: locations,
          searchStatus: SearchStatus.success,
        ),
      ),
    );
  }

  Future<void> _onLocationSelected(
    LocationSelected event,
    Emitter<MapState> emit,
  ) async {
    if (state is! MapLoaded) return;

    emit(
      (state as MapLoaded).copyWith(
        selectedLocation: event.location,
        searchResults: [],
        searchStatus: SearchStatus.initial,
      ),
    );
  }

  Future<void> _onClearSearch(ClearSearch event, Emitter<MapState> emit) async {
    if (state is! MapLoaded) return;

    emit(
      (state as MapLoaded).copyWith(
        searchResults: [],
        searchStatus: SearchStatus.initial,
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return 'serverError';
      case NetworkFailure _:
        return 'networkError';
      default:
        return 'unexpectedError';
    }
  }
}
