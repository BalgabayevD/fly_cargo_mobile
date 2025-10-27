import 'package:fly_cargo/shared/tariffs/data/models/tariff_models.dart';

abstract class TariffsRepository {
  /// Получить все категории тарифов
  Future<List<TariffCategoryModel>> getTariffCategories();

  /// Создать новый тариф
  Future<CreateTariffResponse> createTariff(CreateTariffRequest request);
}
