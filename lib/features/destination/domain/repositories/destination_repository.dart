import 'package:fly_cargo/features/destination/domain/entities/address_entity.dart';
import 'package:fly_cargo/features/destination/domain/entities/city_entity.dart';

abstract class DestinationRepository {
  Future<List<CityEntity>> getCitiesFrom();
  Future<List<CityEntity>> getCitiesTo({required String fromCityId});
  Future<List<AddressEntity>> searchAddresses({
    required String city,
    required String address,
  });
  Future<List<CityEntity>> getAllCities({String? fromCityId});
}
