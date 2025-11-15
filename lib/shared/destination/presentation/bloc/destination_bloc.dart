import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/shared/destination/domain/usecases/get_all_cities_usecase.dart';
import 'package:fly_cargo/shared/destination/domain/usecases/get_cities_from_usecase.dart';
import 'package:fly_cargo/shared/destination/domain/usecases/get_cities_to_usecase.dart';
import 'package:fly_cargo/shared/destination/domain/usecases/search_addresses_usecase.dart';
import 'package:fly_cargo/shared/destination/presentation/bloc/destination_event.dart';
import 'package:fly_cargo/shared/destination/presentation/bloc/destination_state.dart';
import 'package:injectable/injectable.dart';
@injectable
class DestinationBloc extends Bloc<DestinationEvent, DestinationState> {
  final GetCitiesFromUseCase _getCitiesFromUseCase;
  final GetCitiesToUseCase _getCitiesToUseCase;
  final SearchAddressesUseCase _searchAddressesUseCase;
  final GetAllCitiesUseCase _getAllCitiesUseCase;
  DestinationBloc(
    this._getCitiesFromUseCase,
    this._getCitiesToUseCase,
    this._searchAddressesUseCase,
    this._getAllCitiesUseCase,
  ) : super(const DestinationInitial()) {
    on<LoadCitiesFromEvent>(_onLoadCitiesFrom);
    on<LoadCitiesToEvent>(_onLoadCitiesTo);
    on<SearchAddressesEvent>(_onSearchAddresses);
    on<LoadAllCitiesEvent>(_onLoadAllCities);
    on<SelectCityEvent>(_onSelectCity);
    on<SelectAddressEvent>(_onSelectAddress);
    on<ResetDestinationEvent>(_onResetDestination);
  }
  Future<void> _onLoadCitiesFrom(
    LoadCitiesFromEvent event,
    Emitter<DestinationState> emit,
  ) async {
    emit(const DestinationLoading());
    try {
      final cities = await _getCitiesFromUseCase.call();
      emit(CitiesFromLoaded(cities: cities));
    } catch (e) {
      emit(DestinationError(message: e.toString()));
    }
  }
  Future<void> _onLoadCitiesTo(
    LoadCitiesToEvent event,
    Emitter<DestinationState> emit,
  ) async {
    emit(const DestinationLoading());
    try {
      final cities = await _getCitiesToUseCase.call(
        fromCityId: event.fromCityId,
      );
      emit(CitiesToLoaded(cities: cities));
    } catch (e) {
      emit(DestinationError(message: e.toString()));
    }
  }
  Future<void> _onSearchAddresses(
    SearchAddressesEvent event,
    Emitter<DestinationState> emit,
  ) async {
    emit(const DestinationLoading());
    try {
      final addresses = await _searchAddressesUseCase.call(
        city: event.city,
        address: event.address,
      );
      emit(AddressesFound(addresses: addresses));
    } catch (e) {
      emit(DestinationError(message: e.toString()));
    }
  }
  Future<void> _onLoadAllCities(
    LoadAllCitiesEvent event,
    Emitter<DestinationState> emit,
  ) async {
    emit(const DestinationLoading());
    try {
      final cities = await _getAllCitiesUseCase.call(
        fromCityId: event.fromCityId,
      );
      emit(AllCitiesLoaded(cities: cities));
    } catch (e) {
      emit(DestinationError(message: e.toString()));
    }
  }
  void _onSelectCity(SelectCityEvent event, Emitter<DestinationState> emit) {
    emit(CitySelected(selectedCity: event.city));
  }
  void _onSelectAddress(
    SelectAddressEvent event,
    Emitter<DestinationState> emit,
  ) {
    emit(AddressSelected(selectedAddress: event.address));
  }
  void _onResetDestination(
    ResetDestinationEvent event,
    Emitter<DestinationState> emit,
  ) {
    emit(const DestinationInitial());
  }
}
