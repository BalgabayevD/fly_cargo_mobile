part of 'map_bloc.dart';

enum SearchStatus { initial, loading, success, error }

abstract class MapState extends Equatable {
  const MapState();

  @override
  List<Object?> get props => [];
}

class MapInitial extends MapState {}

class MapLoaded extends MapState {
  final Location? currentLocation;
  final Location? selectedLocation;
  final List<Location> searchResults;
  final SearchStatus searchStatus;
  final String? errorMessage;

  const MapLoaded({
    this.currentLocation,
    this.selectedLocation,
    this.searchResults = const [],
    this.searchStatus = SearchStatus.initial,
    this.errorMessage,
  });

  MapLoaded copyWith({
    Location? currentLocation,
    Location? selectedLocation,
    List<Location>? searchResults,
    SearchStatus? searchStatus,
    String? errorMessage,
  }) {
    return MapLoaded(
      currentLocation: currentLocation ?? this.currentLocation,
      selectedLocation: selectedLocation ?? this.selectedLocation,
      searchResults: searchResults ?? this.searchResults,
      searchStatus: searchStatus ?? this.searchStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    currentLocation,
    selectedLocation,
    searchResults,
    searchStatus,
    errorMessage,
  ];
}
