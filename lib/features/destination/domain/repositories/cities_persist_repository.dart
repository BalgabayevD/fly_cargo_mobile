import 'package:fly_cargo/features/destination/domain/entities/city_entity.dart';

abstract class CitiesPersistRepository {
  List<CityEntity> getCitiesFrom();
  Future<void> saveCitiesFrom(List<CityEntity> cities);

  List<CityEntity> getCitiesTo(int fromCityId);
  Future<void> saveCitiesTo(int fromCityId, List<CityEntity> cities);

  Future<void> clearCities();
}
