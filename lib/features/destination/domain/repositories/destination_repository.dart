import 'package:fly_cargo/features/destination/data/models/destination_models.dart';
abstract class DestinationRepository {
  Future<List<CityModel>> getCitiesFrom();
  Future<List<CityModel>> getCitiesTo({required String fromCityId});
  Future<List<AddressModel>> searchAddresses({
    required String city,
    required String address,
  });
  Future<List<CityModel>> getAllCities({String? fromCityId});
}
