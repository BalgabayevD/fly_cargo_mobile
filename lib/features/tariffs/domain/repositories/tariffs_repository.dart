import 'package:fly_cargo/features/tariffs/data/models/tariff_models.dart';
import 'package:fly_cargo/features/tariffs/domain/entities/tariff_entity.dart';

abstract class TariffsRepository {
  Future<List<TariffCategoryEntity>> getTariffCategories();
  Future<CreateTariffResultEntity> createTariff(CreateTariffRequest request);
}
