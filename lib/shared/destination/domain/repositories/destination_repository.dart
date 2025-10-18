import 'package:fly_cargo/shared/destination/data/models/destination_models.dart';

/// Абстракция для репозитория работы с городами и адресами
abstract class DestinationRepository {
  /// Получение списка городов отправки
  Future<List<CityModel>> getCitiesFrom();

  /// Получение списка городов доставки для конкретного города отправки
  Future<List<CityModel>> getCitiesTo({required String fromCityId});

  /// Поиск адресов в городе
  Future<List<AddressModel>> searchAddresses({
    required String city,
    required String address,
  });

  /// Получение всех доступных городов (отправки + доставки)
  Future<List<CityModel>> getAllCities({String? fromCityId});
}
