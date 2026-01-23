import 'package:fly_cargo/features/create_order/data/models/tariff_models.dart';
import 'package:fly_cargo/features/create_order/domain/repositories/tariffs_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class TariffsUseCase {
  final TariffsRestRepository tariffsRest;
  final TariffsPersistRepository tariffsPersist;

  TariffsUseCase(this.tariffsRest, this.tariffsPersist);

  Future<List<TariffModel>> getTariffsRest() async {
    final result = await tariffsRest.getTariffCategories();

    List<TariffModel> list = [];

    for (var index = 0; index < result.length; index++) {
      final category = result[index];
      if (category.tariffs != null) {
        list.addAll(category.tariffs!);
      }
    }

    await tariffsPersist.saveTariffCategories(list);

    return list;
  }

  Future<List<TariffModel>> getTariffsPersist() async {
    return await tariffsPersist.getTariffCategories();
  }
}
