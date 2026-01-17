import 'package:fly_cargo/features/create_order/data/models/tariff_models.dart';

abstract class TariffsRestRepository {
  Future<List<TariffCategoryModel>> getTariffCategories();
}

abstract class TariffsPersistRepository {
  Future<List<TariffModel>> getTariffCategories();
  Future<void> saveTariffCategories(List<TariffModel> tariffs);
}
