import 'package:fly_cargo/features/destination/domain/entities/city_entity.dart';
import 'package:fly_cargo/features/destination/domain/entities/locations_entity.dart';
import 'package:fly_cargo/features/destination/domain/repositories/cities_persist_repository.dart';
import 'package:fly_cargo/features/destination/domain/repositories/cities_rest_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CitiesUseCase {
  final CitiesRestRepository citiesRestRepository;
  final CitiesPersistRepository citiesPersistRepository;

  CitiesUseCase(this.citiesRestRepository, this.citiesPersistRepository);

  Future<List<CityEntity>> getRestCitiesFrom() async {
    final cities = await citiesRestRepository.getCitiesFrom();
    await citiesPersistRepository.saveCitiesFrom(cities);
    return cities;
  }

  Future<List<CityEntity>> getRestCitiesTo(int fromCityId) async {
    final cities = await citiesRestRepository.getCitiesTo(fromCityId);
    await citiesPersistRepository.saveCitiesTo(fromCityId, cities);
    return cities;
  }

  Future<List<String>> getAddressesFromQuery(String city, String address) {
    return citiesRestRepository.getAddressesFromQuery(city, address);
  }

  List<CityEntity> getPersistCitiesTo(int fromCityId) {
    return citiesPersistRepository.getCitiesTo(fromCityId);
  }

  (LocationsEntity, LocationsEntity) getInitialCities() {
    List<CityEntity> fromCities = [];
    int? fromCityId;
    List<CityEntity> toCities = [];
    int? toCityId;

    fromCities = citiesPersistRepository.getCitiesFrom();

    if (fromCities.isNotEmpty) {
      fromCityId = fromCities.first.id;

      toCities = citiesPersistRepository.getCitiesTo(fromCities.first.id);
      if (toCities.isNotEmpty) {
        toCityId = toCities.first.id;
      }
    }

    LocationsEntity from = LocationsEntity(
      cities: fromCities,
      selectedCityId: fromCityId,
    );
    LocationsEntity to = LocationsEntity(
      cities: toCities,
      selectedCityId: toCityId,
    );

    return (from, to);
  }
}
