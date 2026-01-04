import 'package:fly_cargo/features/tariffs/data/models/tariff_models.dart';
import 'package:fly_cargo/features/tariffs/domain/entities/tariff_entity.dart';
import 'package:fly_cargo/features/tariffs/domain/repositories/tariffs_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateTariffUseCase {
  final TariffsRepository _repository;

  const CreateTariffUseCase(this._repository);

  Future<CreateTariffResultEntity> call(CreateTariffRequest request) async {
    try {
      return await _repository.createTariff(request);
    } catch (e) {
      throw TariffsUseCaseException('Ошибка создания тарифа: $e');
    }
  }
}

class TariffsUseCaseException implements Exception {
  final String message;
  const TariffsUseCaseException(this.message);

  @override
  String toString() => 'TariffsUseCaseException: $message';
}
