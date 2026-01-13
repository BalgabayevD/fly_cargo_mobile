import 'package:fly_cargo/features/destination/domain/entities/city_entity.dart';

abstract class CitiesRestRepository {
  Future<List<CityEntity>> getCitiesFrom();
  Future<List<CityEntity>> getCitiesTo(int fromCityId);
  Future<List<String>> getAddressesFromQuery(
    String city,
    String address,
  );
}
