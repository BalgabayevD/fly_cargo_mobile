import 'package:fly_cargo/core/di/configuration.dart';
import 'package:fly_cargo/core/di/requestable.dart';
import 'package:fly_cargo/features/destination/domain/entities/address_query_entity.dart';
import 'package:fly_cargo/features/destination/domain/entities/city_entity.dart';
import 'package:fly_cargo/features/destination/domain/repositories/cities_rest_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CitiesRestRepository)
class CitiesRestRepositoryImpl implements CitiesRestRepository {
  final Requestable requestable;
  final Configuration configuration;

  CitiesRestRepositoryImpl({
    required this.requestable,
    required this.configuration,
  });

  String get _ => configuration.environmentVariables.gatewayBaseUrl;

  @override
  Future<List<CityEntity>> getCitiesFrom() async {
    try {
      final response = await requestable.dio.get(
        '$_/cities/from',
      );

      return (response.data['data'] as List).map((data) {
        return CityEntity.fromJson(data);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CityEntity>> getCitiesTo(int fromCityId) async {
    try {
      final response = await requestable.dio.get(
        '$_/cities/to',
        queryParameters: {'fromCityId': fromCityId},
      );
      return (response.data['data'] as List).map((data) {
        return CityEntity.fromJson(data);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<AddressQueryEntity>> getAddressesFromQuery(
    String city,
    String address,
  ) async {
    try {
      final response = await requestable.dio.get(
        '$_/cities/address',
        queryParameters: {
          'city': city,
          'address': address,
        },
      );
      if (response.data['data'] == null) {
        return const <AddressQueryEntity>[];
      }
      return (response.data['data'] as List).map((data) {
        return AddressQueryEntity.fromJson(data);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }
}
