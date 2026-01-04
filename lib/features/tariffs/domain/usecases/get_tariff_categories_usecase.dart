import 'package:fly_cargo/features/tariffs/domain/entities/tariff_entity.dart';
import 'package:fly_cargo/features/tariffs/domain/repositories/tariffs_repository.dart';
import 'package:fly_cargo/features/tariffs/domain/usecases/create_tariff_usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTariffCategoriesUseCase {
  final TariffsRepository _tariffsRepository;

  GetTariffCategoriesUseCase(this._tariffsRepository);

  Future<List<TariffCategoryEntity>> call() async {
    try {
      return await _tariffsRepository.getTariffCategories();
    } catch (e) {
      throw TariffsUseCaseException('Ошибка получения категорий тарифов: $e');
    }
  }
}
