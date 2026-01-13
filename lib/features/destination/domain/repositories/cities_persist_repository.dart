import 'package:fly_cargo/features/destination/domain/entities/city_entity.dart';

abstract class CitiesPersistRepository {
  Future<List<CityEntity>> getCitiesFrom();
  Future<void> saveCitiesFrom(List<CityEntity> cities);

  Future<List<CityEntity>> getCitiesTo(int fromCityId);
  Future<void> saveCitiesTo(int fromCityId, List<CityEntity> cities);

  Future<void> clearCities();
}
