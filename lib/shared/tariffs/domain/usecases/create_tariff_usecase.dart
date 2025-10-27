import 'package:fly_cargo/shared/tariffs/data/models/tariff_models.dart';
import 'package:fly_cargo/shared/tariffs/domain/repositories/tariffs_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateTariffUseCase {
  final TariffsRepository _repository;

  const CreateTariffUseCase(this._repository);

  Future<CreateTariffResponse> call(CreateTariffRequest request) async {
    return await _repository.createTariff(request);
  }
}
