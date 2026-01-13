import 'dart:convert';

import 'package:fly_cargo/core/di/configuration.dart';
import 'package:fly_cargo/features/destination/domain/entities/city_entity.dart';
import 'package:fly_cargo/features/destination/domain/repositories/cities_persist_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: CitiesPersistRepository)
class CitiesPersistRepositoryImpl implements CitiesPersistRepository {
  final Configuration configuration;

  CitiesPersistRepositoryImpl({
    required this.configuration,
  });

  static String key = 'persist:cities';

  SharedPreferences get sharedPreferences =>
      configuration.package.sharedPreferences;

  @override
  Future<void> clearCities() async {
    var keys = sharedPreferences.getKeys();

    for (String key in keys) {
      if (key.startsWith(key)) {
        await sharedPreferences.remove(key);
      }
    }
  }

  @override
  Future<List<CityEntity>> getCitiesFrom() async {
    final fromCities = sharedPreferences.getStringList('${key}_from');

    if (fromCities == null) {
      return const <CityEntity>[];
    }

    return fromCities.map((city) {
      final Map<String, dynamic> map = json.decode(city);
      return CityEntity.fromJson(map);
    }).toList();
  }

  @override
  Future<List<CityEntity>> getCitiesTo(int fromCityId) async {
    final toCities = sharedPreferences.getStringList('${key}_$fromCityId');

    if (toCities == null) {
      return const <CityEntity>[];
    }

    return toCities.map((city) {
      final Map<String, dynamic> map = json.decode(city);
      return CityEntity.fromJson(map);
    }).toList();
  }

  @override
  Future<void> saveCitiesFrom(List<CityEntity> cities) async {
    final list = cities.map((city) => json.encode(city.toJson())).toList();
    await sharedPreferences.setStringList('${key}_from', list);
  }

  @override
  Future<void> saveCitiesTo(int fromCityId, List<CityEntity> cities) async {
    final list = cities.map((city) => json.encode(city.toJson())).toList();
    await sharedPreferences.setStringList('${key}_$fromCityId', list);
  }
}
