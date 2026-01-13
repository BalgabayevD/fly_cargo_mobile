import 'package:fly_cargo/core/di/configuration.dart';
import 'package:fly_cargo/core/di/requestable.dart';
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

  @override
  Future<List<CityEntity>> getCitiesFrom() async {
    try {
      final response = await requestable.dio.get(
        '/api/v1/directions/cities/from',
      );
      return response.data
          .map((city) => city.toCityModel().toEntity())
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CityEntity>> getCitiesTo(int fromCityId) async {
    try {
      final response = await requestable.dio.get(
        '/api/v1/directions/cities/to',
        queryParameters: {'fromCityId': fromCityId},
      );
      return response.data
          .map((city) => city.toCityModel().toEntity())
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<String>> getAddressesFromQuery(
    String city,
    String address,
  ) async {
    try {
      final response = await requestable.dio.get<List<String>>(
        '/api/v1/maps/cities/list',
        queryParameters: {
          'city': city,
          'address': address,
        },
      );
      return response.data ?? [];
    } catch (e) {
      rethrow;
    }
  }
}
