import 'dart:convert';

import 'package:fly_cargo/core/di/configuration.dart';
import 'package:fly_cargo/features/create_order/data/models/tariff_models.dart';
import 'package:fly_cargo/features/create_order/domain/repositories/tariffs_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: TariffsPersistRepository)
class TariffsPersistRepositoryImpl implements TariffsPersistRepository {
  final Configuration configuration;

  const TariffsPersistRepositoryImpl({
    required this.configuration,
  });

  static String key = 'persist:tariffs';

  SharedPreferences get sharedPreferences =>
      configuration.package.sharedPreferences;

  @override
  Future<List<TariffModel>> getTariffCategories() async {
    final tariffs = sharedPreferences.getStringList(key);

    if (tariffs == null) {
      return const <TariffModel>[];
    }

    return tariffs.map((tariff) {
      final Map<String, dynamic> map = json.decode(tariff);
      return TariffModel.fromJson(map);
    }).toList();
  }

  @override
  Future<void> saveTariffCategories(List<TariffModel> tariffs) async {
    final list = tariffs.map((tariff) => json.encode(tariff.toJson())).toList();
    await sharedPreferences.setStringList(key, list);
  }
}
