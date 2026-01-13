import 'package:fly_cargo/features/destination/domain/entities/city_entity.dart';
import 'package:fly_cargo/features/destination/domain/repositories/cities_persist_repository.dart';
import 'package:fly_cargo/features/destination/domain/repositories/cities_rest_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CitiesUseCase {
  final CitiesRestRepository citiesRestRepository;
  final CitiesPersistRepository citiesPersistRepository;

  CitiesUseCase(this.citiesRestRepository, this.citiesPersistRepository);

  Future<List<CityEntity>> getRestCitiesFrom() {
    return citiesRestRepository.getCitiesFrom();
  }

  Future<List<CityEntity>> getRestCitiesTo(int fromCityId) {
    return citiesRestRepository.getCitiesTo(fromCityId);
  }

  Future<List<String>> getAddressesFromQuery(String city, String address) {
    return citiesRestRepository.getAddressesFromQuery(city, address);
  }

  Future<List<CityEntity>> getPersistCitiesFrom() {
    return citiesPersistRepository.getCitiesFrom();
  }

  Future<List<CityEntity>> getPersistCitiesTo(int fromCityId) {
    return citiesPersistRepository.getCitiesTo(fromCityId);
  }

  Future<void> saveCitiesFrom(List<CityEntity> cities) {
    return citiesPersistRepository.saveCitiesFrom(cities);
  }

  Future<void> saveCitiesTo(int fromCityId, List<CityEntity> cities) {
    return citiesPersistRepository.saveCitiesTo(fromCityId, cities);
  }

  Future<void> clearCities() async {
    return citiesPersistRepository.clearCities();
  }
}
