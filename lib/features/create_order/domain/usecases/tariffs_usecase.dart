import 'package:fly_cargo/features/create_order/data/models/tariff_models.dart';
import 'package:fly_cargo/features/create_order/domain/repositories/tariffs_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class TariffsUseCase {
  final TariffsRestRepository restTariffs;
  final TariffsPersistRepository persistTariffs;

  TariffsUseCase(this.restTariffs, this.persistTariffs);

  Future<List<TariffModel>> getTariffsRest() async {
    final result = await restTariffs.getTariffCategories();

    List<TariffModel> list = [];

    for (var index = 0; index < result.length; index++) {
      final category = result[index];
      if (category.tariffs != null) {
        list.addAll(category.tariffs!);
      }
    }

    await persistTariffs.saveTariffCategories(list);

    return list;
  }

  Future<List<TariffModel>> getTariffsPersist() async {
    return await persistTariffs.getTariffCategories();
  }
}
