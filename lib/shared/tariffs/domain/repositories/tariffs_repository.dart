import 'package:fly_cargo/shared/tariffs/data/models/tariff_models.dart';

abstract class TariffsRepository {

  Future<List<TariffCategoryModel>> getTariffCategories();


  Future<CreateTariffResponse> createTariff(CreateTariffRequest request);
}
