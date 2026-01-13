import 'package:fly_cargo/features/destination/data/destination_remote_source.dart';
import 'package:fly_cargo/features/destination/data/mappers/destination_mapper.dart';
import 'package:fly_cargo/features/destination/domain/entities/address_entity.dart';
import 'package:fly_cargo/features/destination/domain/entities/city_entity.dart';
import 'package:fly_cargo/features/destination/domain/repositories/destination_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DestinationRepository)
class DestinationRepositoryImpl implements DestinationRepository {
  final DestinationRemoteSource _remoteSource;

  DestinationRepositoryImpl(this._remoteSource);

  @override
  Future<List<CityEntity>> getCitiesFrom() async {
    try {
      final response = await _remoteSource.getCitiesFrom();
      return response.data
          .map((city) => city.toCityModel().toEntity())
          .toList();
    } catch (e) {
      throw DestinationException('Ошибка при загрузке городов отправки: $e');
    }
  }

  @override
  Future<List<CityEntity>> getCitiesTo({required String fromCityId}) async {
    try {
      final response = await _remoteSource.getCitiesTo(fromCityId);
      return response.data
          .map((city) => city.toCityModel().toEntity())
          .toList();
    } catch (e) {
      throw DestinationException('Ошибка при загрузке городов доставки: $e');
    }
  }

  @override
  Future<List<AddressEntity>> searchAddresses({
    required String city,
    required String address,
  }) async {
    try {
      final response = await _remoteSource.searchAddresses(city, address);
      if (response.data == null) {
        return <AddressEntity>[];
      }
      return response.data!.map((addr) {
        final addressModel = addr.toAddressModel();
        return AddressEntity(
          city: city,
          address: addressModel.address,
          cityId: '',
          fullAddress: addressModel.fullAddress,
        );
      }).toList();
    } catch (e) {
      throw DestinationException('Ошибка при поиске адресов: $e');
    }
  }

  @override
  Future<List<CityEntity>> getAllCities({String? fromCityId}) async {
    try {
      final fromCities = await getCitiesFrom();
      final toCities = fromCityId != null
          ? await getCitiesTo(fromCityId: fromCityId)
          : <CityEntity>[];
      final allCities = <CityEntity>[];
      final addedIds = <String>{};
      for (final city in [...fromCities, ...toCities]) {
        if (!addedIds.contains(city.id)) {
          allCities.add(city);
          addedIds.add(city.id.toString());
        }
      }
      allCities.sort((a, b) => a.name.compareTo(b.name));
      return allCities;
    } catch (e) {
      throw DestinationException('Ошибка при загрузке всех городов: $e');
    }
  }
}

class DestinationException implements Exception {
  final String message;
  const DestinationException(this.message);

  @override
  String toString() => 'DestinationException: $message';
}
