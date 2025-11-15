import 'package:fly_cargo/shared/tariffs/data/models/tariff_models.dart';
import 'package:fly_cargo/shared/tariffs/domain/repositories/tariffs_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetTariffCategoriesUseCase {
  final TariffsRepository _tariffsRepository;
  GetTariffCategoriesUseCase(this._tariffsRepository);
  Future<List<TariffCategoryModel>> call() async {
    try {
      return await _tariffsRepository.getTariffCategories();
    } catch (e) {
      throw TariffsUseCaseException('Ошибка получения категорий тарифов: $e');
    }
  }
}
class TariffsUseCaseException implements Exception {
  final String message;
  const TariffsUseCaseException(this.message);
  @override
  String toString() => 'TariffsUseCaseException: $message';
}
