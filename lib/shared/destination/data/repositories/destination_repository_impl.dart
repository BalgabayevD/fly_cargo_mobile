import 'package:fly_cargo/shared/destination/data/destination_remote_source.dart';
import 'package:fly_cargo/shared/destination/data/models/destination_models.dart';
import 'package:fly_cargo/shared/destination/domain/repositories/destination_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DestinationRepository)
class DestinationRepositoryImpl implements DestinationRepository {
  final DestinationRemoteSource _remoteSource;

  DestinationRepositoryImpl(this._remoteSource);

  @override
  Future<List<CityModel>> getCitiesFrom() async {
    try {
      final response = await _remoteSource.getCitiesFrom();
      return response.data.map((city) => city.toCityModel()).toList();
    } catch (e) {
      throw DestinationException('Ошибка при загрузке городов отправки: $e');
    }
  }

  @override
  Future<List<CityModel>> getCitiesTo({required String fromCityId}) async {
    try {
      final response = await _remoteSource.getCitiesTo(fromCityId);
      return response.data.map((city) => city.toCityModel()).toList();
    } catch (e) {
      throw DestinationException('Ошибка при загрузке городов доставки: $e');
    }
  }

  @override
  Future<List<AddressModel>> searchAddresses({
    required String city,
    required String address,
  }) async {
    try {
      final response = await _remoteSource.searchAddresses(city, address);
      // Если data равно null, возвращаем пустой список
      if (response.data == null) {
        return <AddressModel>[];
      }

      return response.data!.map((addr) {
        final addressModel = addr.toAddressModel();
        return AddressModel(
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
  Future<List<CityModel>> getAllCities({String? fromCityId}) async {
    try {
      final fromCities = await getCitiesFrom();
      final toCities = fromCityId != null
          ? await getCitiesTo(fromCityId: fromCityId)
          : <CityModel>[];

      final allCities = <CityModel>[];
      final addedIds = <String>{};

      for (final city in [...fromCities, ...toCities]) {
        if (!addedIds.contains(city.id)) {
          allCities.add(city);
          addedIds.add(city.id);
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
