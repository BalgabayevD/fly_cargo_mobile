import 'package:fly_cargo/features/destination/domain/entities/address_query_entity.dart';
import 'package:fly_cargo/features/destination/domain/entities/city_entity.dart';

abstract class CitiesRestRepository {
  Future<List<CityEntity>> getCitiesFrom();
  Future<List<CityEntity>> getCitiesTo(int fromCityId);
  Future<List<AddressQueryEntity>> getAddressesFromQuery(
    String cityName,
    String address,
  );
}
